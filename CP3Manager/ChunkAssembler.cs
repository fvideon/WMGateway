using System;
using System.Collections.Generic;
using System.Text;
using System.Runtime.Serialization.Formatters.Binary;
using UW.ClassroomPresenter.Network.Chunking;
using System.IO;
using System.Diagnostics;

namespace CP3Manager {
    /// <summary>
    /// Derived from CP3 and simplified by removing NACK code and message dependency constraints.
    /// </summary>
    class ChunkAssembler {
        private readonly BinaryFormatter m_Formatter = new BinaryFormatter();
        private MessageAssembler NewestMessageAssember;
        private DisjointSet m_ReceivedFrameSequences;
        private ulong m_GreatestFrameSequence = ulong.MinValue;

        public ChunkAssembler() { }

        public IEnumerable<object> Assemble(Chunk chunk) {

            // Keep track of chunks we have already received.  
            // If this is a duplicate chunk return nothing.
            // Note: FrameSequence==0 for real-time ink
            if (chunk.FrameSequence > 0) {
                if (DisjointSet.Contains(ref this.m_ReceivedFrameSequences, chunk.FrameSequence)) {
                    yield break;
                }
                DisjointSet.Add(ref this.m_ReceivedFrameSequences, chunk.FrameSequence);

                // Save space in the ReceivedSequenceNumbers queue by adding all chunks
                // that we can't expect to receive anymore.
                if (chunk.OldestRecoverableFrame > ulong.MinValue) {
                    DisjointSet.Add(ref this.m_ReceivedFrameSequences, new Range(ulong.MinValue, chunk.OldestRecoverableFrame - 1));
                }

                // Check the frame sequence number to see if any frames were skipped.
                // If so, then it is likely that the frame has been dropped, so it is
                // necessary to send a NACK.
                if (chunk.FrameSequence > this.m_GreatestFrameSequence + 1ul) {
                    Debug.WriteLine(string.Format("*** Frames #{0}-{1} were dropped ({2} total)! Requesting replacements (oldest recoverable is #{3})...",
                        this.m_GreatestFrameSequence + 1ul, chunk.FrameSequence - 1ul, chunk.FrameSequence - this.m_GreatestFrameSequence - 1,
                        chunk.OldestRecoverableFrame), this.GetType().ToString());
                    //In the CP3 code here we would send the NACK.
                }

                // Assuming the chunk has not been duplicated or received out of order,
                // update our variable containing the highest sequence number seen
                // so far so we know which future frames have been dropped.
                if (chunk.FrameSequence > this.m_GreatestFrameSequence)
                    this.m_GreatestFrameSequence = chunk.FrameSequence;
            }

            // Process single-chunk messages immediately.
            if (chunk.NumberOfChunksInMessage <= 1) {
                // Don't create a MessageAssembler for singleton chunks.
                // Instead, just return the message immediately.
                using (MemoryStream ms = new MemoryStream(chunk.Data)) {
                    yield return this.m_Formatter.Deserialize(ms);
                    yield break;
                }
            }

            // For multi-chunk messages, we first attempt to find an existing MessageAssembler
            // instance for the message to which the chunk belongs (based on the range of chunk
            // sequence numbers the message spans).
            MessageAssembler assembler = this.NewestMessageAssember, previous = null;
            object message;
            for (; ; ) {
                bool done, remove, complete;

                // If there does not exist any assembler for which IsInRange(chunk) returned true,
                // create one to hold the chunk.
                if (assembler == null) {
                    Debug.WriteLine(string.Format("Creating a new MessageAssembler to manage multipart message (message #{0}, chunks #{1}-{2})",
                        chunk.MessageSequence,
                        chunk.ChunkSequenceInMessage + 1,
                        chunk.NumberOfChunksInMessage),
                        this.GetType().ToString());

                    assembler = new MessageAssembler(chunk.MessageSequence,
                        chunk.NumberOfChunksInMessage, this.m_Formatter);

                    // Insert the assembler as the first entry in our linked list,
                    // since it is most likely to be used by subsequent chunks.
                    assembler.NextOldestAssembler = this.NewestMessageAssember;
                    this.NewestMessageAssember = assembler;
                }

                // See if the chunk belongs to the current assembler.
                if (assembler.MessageSequence == chunk.MessageSequence) {
                    // If so, add the chunk to it, and we can stop searching.
                    assembler.Add(chunk);
                    done = true;

                    // If the message has been fully assembled, process it
                    // and remove the no-longer-needed assembler.
                    complete = assembler.IsComplete;
                    if (complete) {
                        message = assembler.DeserializeMessage();
                        remove = true;
                    }
                    else {
                        message = null;
                        remove = false;
                    }
                }

                else if (assembler.MessageSequence < chunk.OldestRecoverableMessage) {
                    // For each message assembler that is waiting for more chunks (and to which the current
                    // chunk does not belong), make sure it will be possible to complete the message in 
                    // the future.  If the sender reports that its OldestRecoverableFrame is greater than
                    // the sequence number of any frame yet needed to complete the message, then no
                    // NACK we send can ever satisfy our needs, so we discard the message completely
                    // (removing the assembler from the linked list).
                    Debug.WriteLine(string.Format("### Giving up on message #{0} (chunks #{0}-{1}): the oldest available chunk is {2}!",
                        chunk.MessageSequence,
                        chunk.ChunkSequenceInMessage + 1,
                        chunk.NumberOfChunksInMessage,
                        chunk.OldestRecoverableMessage), this.GetType().ToString());
                    remove = true;
                    message = null;
                    done = false;
                    complete = false;
                }
                else {
                    remove = false;
                    message = null;
                    done = false;
                    complete = false;
                }

                // If the assembler is no longer useful, remove it from the linked list.
                // (There are a couple of conditions, above, under which this might happen.)
                if (remove) {
                    if (previous == null) {
                        this.NewestMessageAssember = assembler.NextOldestAssembler;
                    }
                    else {
                        previous.NextOldestAssembler = assembler.NextOldestAssembler;
                    }
                }

                // If an assembler was found which accepted the chunk, we're done.
                // (There are a couple of conditions, above, under which this might happen.)
                if (done) {
                    if (complete) {
                        yield return message;
                    }
                    yield break;
                }
                else {
                    // Get the next assembler.  Do not break from the loop if there
                    // is no "next" assembler, since one will be created.
                    previous = assembler;
                    assembler = assembler.NextOldestAssembler;
                }
            }
        }

        /// <summary>
        /// Assembles a single message from its chunks, and keeps track of which
        /// chunks are still needed.
        /// </summary>
        /// <remarks>
        /// Also forms a linked list with other <see cref="MessageAssembler">MessageAssemblers</see>.
        /// </remarks>
        protected class MessageAssembler {
            private readonly BinaryFormatter m_Formatter;

            private readonly ulong m_MessageSequence;
            private readonly byte[][] m_Data;
            private ulong m_Remaining;

            /// <summary>
            /// The next entry in the linked list used by <see cref="ChunkAssembler"/>.
            /// </summary>
            public MessageAssembler NextOldestAssembler;

            /// <summary>
            /// Gets the message sequence number of the chunks comprising this message.
            /// </summary>
            public ulong MessageSequence {
                get { return this.m_MessageSequence; }
            }

            /// <summary>
            /// Creates a new <see cref="MessageAssembler"/>
            /// covering the specified range.
            /// </summary>
            /// <param name="message">
            /// The message chunk sequence number of the chunks comprising the full message.
            /// <seealso cref="Chunk.MessageSequence"/>
            /// </param>
            /// <param name="count">
            /// The number of chunks in the full message.
            /// <seealso cref="Chunk.NumberOfChunksInMessage"/>
            /// </param>
            /// <param name="deserializer">
            /// A deserializer which will be used to decode the completed message,
            /// once all chunks have been added.
            /// </param>
            public MessageAssembler(ulong message, ulong count, BinaryFormatter deserializer) {
                this.m_MessageSequence = message;
                this.m_Formatter = deserializer;
                this.m_Data = new byte[count][];
                this.m_Remaining = count;
            }

            /// <summary>
            /// Gets whether all chunks in the message have been received.
            /// </summary>
            public bool IsComplete {
                get {
                    return this.m_Remaining == 0;
                }
            }

            /// <summary>
            /// Gets whether the given chunk is part of the message
            /// being assembled by this <see cref="MessageAssembler"/>.
            /// </summary>
            /// <param name="chunk">
            /// The chunk to test.
            /// </param>
            /// <returns>
            /// Whether the chunk's sequence number is in range.
            /// </returns>
            public bool IsInRange(Chunk chunk) {
                return chunk.MessageSequence == this.m_MessageSequence;
            }

            /// <summary>
            /// Adds a chunk to the message.
            /// The chunk must be part of the message;
            /// that is, <see cref="IsInRange">IsInRange(<paramref name="chunk"/>)</see>
            /// must return <c>true</c>.
            /// </summary>
            /// <param name="chunk">
            /// The chunk to add to the message.
            /// </param>
            public void Add(Chunk chunk) {
                ulong index = chunk.ChunkSequenceInMessage;
                ulong chunks = ((ulong)this.m_Data.LongLength);
                if (index < 0 || index >= chunks)
                    throw new ArgumentException("Chunk is not part of the message being assembled by this MessageAssembler.", "chunk");

                // If the chunk is not a duplicate, insert its contents into the data array.
                // (The chunked message cannot be deserialized until all chunks have been received.)
                if (this.m_Data[index] == null) {
                    Debug.Assert(this.m_Remaining >= 1);

                    // This chunk has not been received before.
                    this.m_Data[index] = chunk.Data;
                    this.m_Remaining--;

                    Debug.WriteLine(string.Format("Received message #{0}, chunk #{0} of {1} ({2} bytes); {3} chunks remaining.",
                        chunk.MessageSequence,
                        chunk.ChunkSequenceInMessage + 1,
                        chunk.NumberOfChunksInMessage,
                        chunk.Data.LongLength,
                        this.m_Remaining),
                        this.GetType().ToString());
                }
            }

            /// <summary>
            /// Once a message is complete, deserializes the message from its chunks.
            /// </summary>
            /// <returns>The deserialized message</returns>
            public object DeserializeMessage() {
                if (!this.IsComplete)
                    throw new InvalidOperationException("Cannot deserialize the chunked message until all chunks have been received.");

                // First count the total size of the concatenated data.
                long total = 0;
                foreach (byte[] chunk in this.m_Data)
                    total += chunk.LongLength;

                // Concatenate all of the data into a single array.
                // TODO: Make a new "MemoryStream" class which can read directly from the jagged 2D array.
                byte[] serialized = new byte[total];
                total = 0;
                foreach (byte[] chunk in this.m_Data) {
                    chunk.CopyTo(serialized, total);
                    total += chunk.LongLength;
                }

                using (MemoryStream ms = new MemoryStream(serialized)) {
                    return this.m_Formatter.Deserialize(ms);
                }
            }
        }

    }
}
