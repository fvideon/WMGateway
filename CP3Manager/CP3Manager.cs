using System;
using System.Collections.Generic;
using System.Text;
using CP3=UW.ClassroomPresenter;
using ArchiveRTNav;
using System.Diagnostics;
using CP3Msgs = UW.ClassroomPresenter.Network.Messages.Presentation;
using System.IO;
using System.Runtime.Serialization.Formatters.Binary;

namespace CP3Manager {
    /// <summary>
    /// Interpret a CP3 message stream, and return a ArchiveRtNav message stream.
    /// </summary>
    public class CP3Manager {
        private Guid m_CurrentDeck = Guid.Empty;
        private Guid m_CurrentSlide = Guid.Empty;
        private CP3StateCache m_Cache;
        private List<string> warningLog;
        private ChunkAssembler m_ChunkAssembler;

        /// <summary>
        /// Any errors or warnings that we need to show the user.
        /// </summary>
        public List<string> WarningLog {
            get {
                if (warningLog.Count == 0) {
                    return null;
                }
                return warningLog;
            }
        }

        public CP3Manager() {
            m_ChunkAssembler = new ChunkAssembler();
            m_Cache = new CP3StateCache();
            warningLog = new List<string>();
        }

        /// <summary>
        /// Process one inbound Chunk, returning a list of equivalent ArchiveRtNav objects, or null.
        /// </summary>
        /// <param name="rtobj"></param>
        /// <returns></returns>
        public List<object> Accept(object rtobj) {
            List<object> rtObjects = new List<object>();
            if (rtobj is CP3.Network.Chunking.Chunk) {
                CP3.Network.Chunking.Chunk chunk = (CP3.Network.Chunking.Chunk)rtobj;
                Debug.WriteLine("Receiving chunk: " + chunk.FrameSequence.ToString());
                object message = m_ChunkAssembler.Assemble(chunk);
                if (message is IEnumerable<object> ) {
                    foreach (CP3.Network.Messages.Message m in  ((IEnumerable<object>)message)) {
                        //Debug.WriteLine("Process Message Graph: " + m.ToString());
                        ProcessMessageGraph(m, rtObjects);
                        string s = m_Cache.GetWarnings();
                        if (s != null) {
                            warningLog.Add(s);
                        }
                    }
                }
                else {
                    return null;
                }
            }
            else {
                string s = "CP3Manager: Input object is not a Chunk (ignoring): " + rtobj.ToString();
                warningLog.Add(s);
                return null;
            }
            return rtObjects;
        }


        /// <summary>
        /// CP3 messages can have a Predecessor and a Child, each a message in its own right.  
        /// Here we recurse through the message graph, processing
        /// the parts in order.
        /// </summary>
        /// <param name="m"></param>
        /// <param name="outList"></param>
        /// <returns></returns>
        private void ProcessMessageGraph(UW.ClassroomPresenter.Network.Messages.Message m, List<object> outList) {
            if (m.Predecessor != null) {
                ProcessMessageGraph(m.Predecessor, outList);
            }

            Debug.WriteLine("Processing message: " + m.GetType().ToString());
            object o = ProcessMessage(m);
            if (o != null) {
                if (o is List<object>) {
                    List<object> lo = (List<object>)o;
                    foreach (object oo in lo) {
                        outList.Add(oo);
                    }
                }
                else {
                    outList.Add(o);
                }
            }

            Debug.Indent();
            
            if (m.Child != null) {
                ProcessMessageGraph(m.Child, outList);
            }

            Debug.Unindent();

        }


        /// <summary>
        /// Interpret a subset of CP3 message types
        /// May return null, a single RTObject, or a List<object> containing multiple RTObjects
        /// </summary>
        /// <param name="m"></param>
        /// <returns></returns>
        private object ProcessMessage(UW.ClassroomPresenter.Network.Messages.Message m) {
            if (m is CP3Msgs.InkSheetStrokesAddedMessage) {
                return m_Cache.AddInkSheetStrokesAdded((CP3Msgs.InkSheetStrokesAddedMessage)m);
            }
            else if (m is CP3Msgs.TableOfContentsEntryMessage) {
                return m_Cache.AddTableOfContentsEntry((CP3Msgs.TableOfContentsEntryMessage)m);
            }
            else if (m is CP3Msgs.InkSheetStrokesDeletingMessage) {
                return m_Cache.AddInkSheetStrokesDeleting((CP3Msgs.InkSheetStrokesDeletingMessage)m);
            }
            else if (m is CP3Msgs.SlideDeckTraversalMessage) {
                return m_Cache.AddSlideDeckTraversal((CP3Msgs.SlideDeckTraversalMessage)m);
            }
            else if (m is CP3.Network.Messages.Network.InstructorCurrentDeckTraversalChangedMessage) {
                return m_Cache.AddInstructorCurrentDeckTraversalChanged((CP3.Network.Messages.Network.InstructorCurrentDeckTraversalChangedMessage)m);
            }
            else if (m is CP3Msgs.RealTimeInkSheetInformationMessage) {
                m_Cache.AddRealTimeInkSheetInformation((CP3Msgs.RealTimeInkSheetInformationMessage)m);
            }
            else if (m is CP3Msgs.RealTimeInkSheetPacketsMessage) {
                return m_Cache.AddRealTimeInkSheetPackets((CP3Msgs.RealTimeInkSheetPacketsMessage)m);
            }
            else if (m is CP3Msgs.RealTimeInkSheetStylusDownMessage) {
                m_Cache.AddRealTimeInkSheetStylusDown((CP3Msgs.RealTimeInkSheetStylusDownMessage)m);
            }
            else if (m is CP3Msgs.RealTimeInkSheetStylusUpMessage) {
                return m_Cache.AddRealTimeInkSheetStylusUp((CP3Msgs.RealTimeInkSheetStylusUpMessage)m);
            }
            else if (m is CP3Msgs.SlideInformationMessage) {
                return m_Cache.UpdateSlideInformation((CP3Msgs.SlideInformationMessage)m);
            }
            else if (m is CP3Msgs.DeckInformationMessage) {
                return m_Cache.UpdateDeckInformation((CP3Msgs.DeckInformationMessage)m);
            }
            else if (m is CP3Msgs.TextSheetMessage) {
                return m_Cache.AddTextSheet((CP3Msgs.TextSheetMessage)m);
            }
            else if (m is CP3Msgs.SheetRemovedMessage) {
                return m_Cache.AddSheetRemoved((CP3Msgs.SheetRemovedMessage)m);
            }
            else if (m is CP3Msgs.PresentationMessage) {
                return m_Cache.UpdatePresentaton((CP3Msgs.PresentationMessage)m);
            }
            else if (m is CP3Msgs.QuickPollSheetMessage) {
                //When a new quickpoll is started we get this with parents: QuickPollInformationMessage, Slide..,Deck..,Presentation..
                //The SheetMessage base class has dimensions, but they appear to all be zeros.
                return m_Cache.AddQuickPollSheet((CP3Msgs.QuickPollSheetMessage)m);
            }
            else if (m is CP3Msgs.QuickPollResultInformationMessage) {
                //When there is a vote we get this with parents: QuickPollInformationMessage, Presentation..
                //Contains a owner ID and a result string such as "C" or "Yes".
                //Presumably the owner ID is the id of the client, so this is how we would know if a client changed his vote.
                return m_Cache.AddQuickResultInformation((CP3Msgs.QuickPollResultInformationMessage)m);
            }
            else if (m is CP3Msgs.ImageSheetMessage) {
                CP3Msgs.ImageSheetMessage ism = (CP3Msgs.ImageSheetMessage)m;
                if (ism.SheetCollectionSelector == 
                    UW.ClassroomPresenter.Network.Messages.Presentation.SheetMessage.SheetCollection.AnnotationSheets) {
                    //Annotation sheets are the ones added on-the-fly.
                    return m_Cache.AddImageAnnotation(ism);
                }
                else {
                    //Content sheets: These are found in slide broadcasts.
                }
            }
            else if (m is CP3Msgs.QuickPollInformationMessage) {
                //We see one of these with a PresentationInformationMessage parent at various times.  It also appears in
                //the heirarchy along with some other messages.  It's not clear if we need to pay attention to this
                //because we have the QuickPollInformationMessage in the heirarchy with QuickPollSheetMessage.
                //Debug.WriteLine("QuickPollInformationMessage");
            }
            else if (m is CP3Msgs.QuickPollResultRemovedMessage) {
                //Appears to be unused?
                //Debug.WriteLine("QuickPollResultRemovedMessage");
            }
            else if (m is CP3Msgs.XPSPageSheetMessage) {
                //Debug.WriteLine("XPSPageSheetMessage");
            }

            return null;
        }

        /// <summary>
        /// After a message stream has been processed, this will return a formatted list of slide identifiers and titles.
        /// </summary>
        /// <returns></returns>
        public string GetTitles() {
            return m_Cache.GetSlideTitles();
        }

        /// <summary>
        /// if the chunk identifies the role, return the numeric value.  Also look for the human name of the presenter.
        /// 1:instructor;2:shared display;3:student;other vaules:unknown.  
        /// </summary>
        /// <param name="chunk"></param>
        /// <param name="presenterName"></param>
        /// <returns></returns>
        public static int AnalyzeChunk(UW.ClassroomPresenter.Network.Chunking.Chunk chunk, out string presenterName) {
            presenterName = "";

            if (chunk.NumberOfChunksInMessage == 1) {
                MemoryStream ms = new MemoryStream(chunk.Data);
                BinaryFormatter formatter = new BinaryFormatter();
                object decoded = null;
                try {
                    decoded = formatter.Deserialize(ms);
                }
                catch (Exception e)  
                { // Most likely a new or unknown message type 
                    Debug.WriteLine(e.ToString());
                }
                if (decoded is CP3.Network.Messages.Message) {
                    CP3.Network.Messages.Message m = (CP3.Network.Messages.Message)decoded;
                    if (m is CP3Msgs.PresentationInformationMessage) {
                        CP3Msgs.PresentationInformationMessage pim = (CP3Msgs.PresentationInformationMessage)m;
                        return 1;
                    }
                    else if (m is CP3.Network.Messages.Network.ParticipantGroupAddedMessage) {
                        CP3.Network.Messages.Network.ParticipantGroupAddedMessage gim = (CP3.Network.Messages.Network.ParticipantGroupAddedMessage)m;
                        if (gim.Singleton)
                            presenterName = gim.FriendlyName;
                        return 0;
                    }
                    else if (m is UW.ClassroomPresenter.Network.Messages.Network.InstructorMessage) {
                        Debug.WriteLine(m.ToString());
                        return 1;
                    }
                    else if (m is UW.ClassroomPresenter.Network.Messages.Network.StudentMessage) {
                        Debug.WriteLine(m.ToString());
                        return 3;
                    }
                    else if (m is UW.ClassroomPresenter.Network.Messages.Network.PublicMessage) {
                        Debug.WriteLine(m.ToString());
                        return 2;
                    }
                }
            }

            return 0;
        }
    }

}
