using System;
using System.Collections.Generic;
using System.Text;
using CP3 = UW.ClassroomPresenter;
using System.Collections;
using CP3Msgs = UW.ClassroomPresenter.Network.Messages.Presentation;
using ArchiveRTNav;
using System.Diagnostics;
using Microsoft.Ink;
using System.Text.RegularExpressions;
using System.Security;
using System.Drawing;

namespace CP3Manager {

    /// <summary>
    /// Accept a subset of CP3 messages and return ArchiveRTNav messages, maintaining CP3 state
    /// and interpreting CP3 message semantics as we go.
    /// </summary>
    /// <remarks>
    /// synopsis of messages that correspond to slide transition:
    /// create initial whiteboard when there are no other decks:
    /// ***InstructorMessage;child={InstructorCurrentDeckTraversalChangedMessage;pred={SlideInformationMessage;child={TableOfContentsEntryMessage;};};};
    /// create a new whiteboard sheet:
    /// ***PresentationInformationMessage;child={DeckInformationMessage;child={SlideDeckTraversalMessage;pred={SlideInformationMessage;child={TableOfContentsEntryMessage;};};};};
    /// navigate to a slide in a deck (when there is already another deck opened) two messages:
    /// ***PresentationInformationMessage;child={DeckInformationMessage;child={SlideDeckTraversalMessage;pred={SlideInformationMessage;child={TableOfContentsEntryMessage;};};};};
    /// ***InstructorMessage;child={InstructorCurrentDeckTraversalChangedMessage;pred={SlideInformationMessage;child={TableOfContentsEntryMessage;};};};
    /// navigate to a slide in an existing deck:
    /// ***PresentationInformationMessage;child={DeckInformationMessage;child={SlideDeckTraversalMessage;pred={SlideInformationMessage;child={TableOfContentsEntryMessage;};};};};
    /// This is the beacon message (when there is a deck opened):
    /// ***InstructorMessage;child={InstructorCurrentDeckTraversalChangedMessage;pred={SlideInformationMessage;pred={InstructorCurrentPresentationChangedMessage;};child={TableOfContentsEntryMessage;};};};
    /// </remarks>
    class CP3StateCache {

        /// <summary>
        /// The ID found in CP3 ink
        /// </summary>
        public static readonly Guid StrokeIdExtendedProperty = new Guid("fa8aebeb-55f3-4f98-a743-a3a6e0e6dad9");
        /// <summary>
        /// The ID used for CP2 and WebViewer ink
        /// </summary>
        public static readonly Guid CP2StrokeIdExtendedProperty = new Guid("{179222D6-BCC1-4570-8D8F-7E8834C1DD2A}");

        private TableOfContents toc;                          //Contains a map of all the slides we know about, indexed by TocId and SlideId.
        private Guid currentPresentationId;
        private Guid currentDeckId; 
        private Guid currentSlideId;
        private Hashtable sheetToSlideLookup;                 //Map of sheetID to slideID -- some messages use the former.
        private Hashtable sheetToDrawingAttributesLookup;     //TabletPC SDK attributes needed to use real-time Ink.  One set per sheet.
        private Dictionary<Guid, int> strokeCountsBySlideId;  //Counters used to optimize the "delete all strokes" operation.
        private int[] previousRealTimePackets;                //collection of raw ink packets for the *current* real-time stroke
        private int previousRealTimeStroke;                   //stroke Id of the previous real-time stroke.
        private TabletPropertyDescriptionCollection previousTabletProperties; //TabletPC SDK settings needed to use real-time ink.
        private Dictionary<int, RTStrokeData> realTimeStrokesPending;  //Mapping of real-time stroke int identifiers to ID, Deck and slide.
        private string warning = "";                          //Diagnostics to report to the user.
        private Dictionary<Guid,List<Ink>> pendingInk;        //Sometimes we receive ink before TOC entry.  Use this to cache it temporarily.  
        private QuickPollAggregator m_QuickPollAggregator;    //Maintain QuickPoll vote counts
        private Dictionary<Guid, SizeF> customSlideBounds;  //XPS decks use non-standard slide bounds.  Map deckID to bounds.

        public CP3StateCache() {
            currentPresentationId = Guid.Empty;
            currentDeckId = Guid.Empty;
            previousTabletProperties = null;
            currentSlideId = Guid.Empty;
            realTimeStrokesPending = new Dictionary<int, RTStrokeData>();
            sheetToSlideLookup = new Hashtable();
            sheetToDrawingAttributesLookup = new Hashtable();
            strokeCountsBySlideId = new Dictionary<Guid,int>();
            toc = new TableOfContents();
            pendingInk = new Dictionary<Guid, List<Ink>>();
            m_QuickPollAggregator = new QuickPollAggregator();
            customSlideBounds = new Dictionary<Guid, SizeF>();
        }

        internal string GetSlideTitles() {
            return toc.GetSlideTitles();
        }

        /// <summary>
        /// These messages give us the structure of the decks used.  They don't cause any
        /// navigation themselves, but the information contained is important later.
        /// </summary>
        /// <param name="tocem"></param>
        internal List<object> AddTableOfContentsEntry(CP3Msgs.TableOfContentsEntryMessage tocem) {
            string w;
            Guid slideId = toc.AddTableOfContentsEntry(tocem, Guid.Empty, CP3.Model.Presentation.DeckDisposition.Whiteboard, out w);
            if ((w != null) && (w != "")) {
                warning += w + "  ";
            }
            else if (!slideId.Equals(Guid.Empty)) {
                return getCachedStrokes(slideId);
            }
            return null;
        }

        /// <summary>
        /// return a list of rtDrawStroke messages if ink has been cached for this slide, else null.
        /// The expectation is that the toc entry for slideId does exist before this is called.
        /// </summary>
        /// <param name="slideId"></param>
        private List<object> getCachedStrokes(Guid slideId) {
            List<object> outputMessages = null;

            TableOfContents.TocEntry tocEntry = toc.LookupBySlideId(slideId);
            if (tocEntry == null) {
                Debug.WriteLine("Warning: getCachedStrokes failed to find TOC entry.");
                return null;
            }

            if (this.pendingInk.ContainsKey(slideId)) {
                foreach (Ink ink in pendingInk[slideId]) {
                    if (ink.Strokes.Count <= 0) {
                        continue;
                    }

                    Guid strokeId = Guid.NewGuid();
                    //Pull out the identifier which is used if we need to delete the stroke later:
                    if (ink.Strokes[0].ExtendedProperties.DoesPropertyExist(StrokeIdExtendedProperty)) {
                        strokeId = new Guid((string)ink.Strokes[0].ExtendedProperties[StrokeIdExtendedProperty].Data);
                    }
                    else {
                        Debug.WriteLine("Warning: Failed to find stroke Id.");
                    }
                    //WebViewer looks for the CP2 extended property, so add it too.
                    ink.Strokes[0].ExtendedProperties.Add(CP2StrokeIdExtendedProperty, (object)strokeId.ToString());
                    //WebViewer wants ink to be scaled to 500x500
                    ink.Strokes.Scale(500f / getCurrentSlideWidth(), 500f / getCurrentSlideHeight());
                    RTDrawStroke rtds = new RTDrawStroke(ink, strokeId, true, tocEntry.DeckId, tocEntry.SlideIndex);

                    //Add the stroke to our list to optimize deletes
                    if (!strokeCountsBySlideId.ContainsKey(slideId)) {
                        strokeCountsBySlideId.Add(slideId, 1);
                    }
                    else {
                        strokeCountsBySlideId[slideId]++;
                    }

                    if (outputMessages == null) {
                        outputMessages = new List<object>();
                    }
                    outputMessages.Add(rtds);
                    Debug.WriteLine("***** getCachedStrokes:Adding Stroke ID=" + strokeId.ToString());
                }

                pendingInk.Remove(slideId);
            }
            return outputMessages;
        }

        /// <summary>
        /// We receive this message when an instructor navigates between slides in a deck.  There's also one that we 
        /// want to ignore that occurs when the instructor opens a new deck but before navigating to a slide in the deck.
        /// </summary>
        /// <param name="stdm"></param>
        /// <returns></returns>
        internal object AddSlideDeckTraversal(CP3Msgs.SlideDeckTraversalMessage stdm) {
            //If m.Predecessor.Child is a TOC entry, look up info for RTUPdate there.
            if ((stdm.Predecessor != null) && (stdm.Predecessor.Child != null) &&
                (stdm.Predecessor is CP3Msgs.SlideInformationMessage) &&
                (stdm.Predecessor.Child is CP3Msgs.TableOfContentsEntryMessage) &&
                (stdm.Parent !=null) && (stdm.Parent is CP3Msgs.DeckInformationMessage)) {
                //Debug.WriteLine(stdm.Parent.Parent.ToString(), "*****");
                //We get one of these when a deck is first opened, but before the instructor navigates to it.  Filter it out
                //by remembering the current deck ID and ignoring messages for decks other than the current.
                if ((currentDeckId == Guid.Empty) || (currentDeckId.Equals((Guid)stdm.Parent.TargetId))) {
                    currentSlideId = (Guid)stdm.Predecessor.TargetId;
                    currentDeckId = (Guid)stdm.Parent.TargetId;
                    RTUpdate rtu = this.toc.GetRtUpdate((Guid)stdm.Predecessor.Child.TargetId);
                    return rtu;
                }
            }
            else {
                //No warning because this happens when a new SS deck is created upon receipt of the first submission.
                Debug.WriteLine("A SlideDeckTraversal is being ignored because it lacks the expected message graph.");
            }
            return null;
        }

        /// <summary>
        /// This is a message used in the beacon, and it is also the message that indicates when
        /// an instructor navigates to an initial slide in a newly opened deck.
        /// </summary>
        /// <param name="icdtcm"></param>
        /// <returns></returns>
        /// This is the beacon message graph we expect: 	
        /// {InstructorMessage;
        ///     child={InstructorCurrentDeckTraversalChangedMessage;
        ///         pred={SlideInformationMessage;
        ///             pred={InstructorCurrentPresentationChangedMessage;};
        ///             child={TableOfContentsEntryMessage;};};};}
        internal List<object> AddInstructorCurrentDeckTraversalChanged(UW.ClassroomPresenter.Network.Messages.Network.InstructorCurrentDeckTraversalChangedMessage icdtcm) {
            //If m.Predecessor.Child is a TOC entry, return a RTUPdate.
            List<object> outputMessages = null;
            if ((icdtcm.Predecessor != null) && (icdtcm.Predecessor.Child != null) &&
                (icdtcm.Predecessor is CP3Msgs.SlideInformationMessage) &&
                (icdtcm.Predecessor.Child is CP3Msgs.TableOfContentsEntryMessage)) {
                if (icdtcm.Predecessor.Predecessor == null) { //This effectively filters out the beacon messages.
                    //In some late-joiner scenarios, we may not have the TOC entry.
                    if (!toc.ContainsEntry((Guid)icdtcm.Predecessor.Child.TargetId)) {
                        string err;
                        Guid slideId = toc.AddTableOfContentsEntry((CP3Msgs.TableOfContentsEntryMessage)icdtcm.Predecessor.Child,
                            icdtcm.DeckId, icdtcm.Dispositon, out err);
                        if (err != null) {
                            Debug.WriteLine(err);
                        }
                        else if (!slideId.Equals(Guid.Empty)) {
                            outputMessages = this.getCachedStrokes(slideId); 
                        }
                    }
                    if (currentDeckId.Equals(icdtcm.DeckId) && currentSlideId.Equals((Guid)icdtcm.Predecessor.TargetId)) {
                        Debug.WriteLine("***Ignoring InstructorCurrentDeckTraversalChanged because it matches the current slide and deck");
                        return outputMessages;
                    }
                    RTUpdate rtu = this.toc.GetRtUpdate((Guid)icdtcm.Predecessor.Child.TargetId);
                    if (rtu != null) {
                        currentDeckId = icdtcm.DeckId;
                        currentSlideId = (Guid)icdtcm.Predecessor.TargetId;
                    }
                    else {
                        Debug.WriteLine("Warning: Navigation failure.");
                    }
                    if (outputMessages == null) {
                        outputMessages = new List<object>();
                    }
                    outputMessages.Add(rtu);
                    return outputMessages;
                }
                else {
                    //The beacon also causes navigation in some cases, eg. the initial slide after we join.
                    //If the beacon has a toc entry we don't already have, add it.
                    if (!toc.ContainsEntry((Guid)icdtcm.Predecessor.Child.TargetId)) {
                        string err;
                        Guid slideId = toc.AddTableOfContentsEntry((CP3Msgs.TableOfContentsEntryMessage)icdtcm.Predecessor.Child,
                            icdtcm.DeckId, icdtcm.Dispositon, out err);
                        if (err != null) {
                            Debug.WriteLine(err);
                        }
                        else if (!slideId.Equals(Guid.Empty)) {
                            outputMessages = this.getCachedStrokes(slideId);
                        }
                    }
                    //if the beacon indicates a slide other than the current slide, navigate there.
                    if ((!currentSlideId.Equals((Guid)icdtcm.Predecessor.TargetId)) ||
                        (!currentDeckId.Equals(icdtcm.DeckId))) {
                        currentSlideId = (Guid)icdtcm.Predecessor.TargetId;
                        RTUpdate rtu = this.toc.GetRtUpdate((Guid)icdtcm.Predecessor.Child.TargetId);
                        currentDeckId = (Guid)icdtcm.DeckId;
                        currentSlideId = (Guid)icdtcm.Predecessor.TargetId;
                        if (outputMessages == null) {
                            outputMessages = new List<object>();
                        }
                        outputMessages.Add(rtu);
                        return outputMessages;
                    }
                }
            }
            else {
                warning += "Warning: Found InstructorCurrentDeckTraversalChangedMessage message without a TOC Entry.  ";
            }
            return outputMessages;
        }

        /// <summary>
        /// This is the message received when there is a completed stroke. Translate to RTDrawStroke.
        /// </summary>
        /// <param name="issam"></param>
        /// <returns></returns>
        internal RTDrawStroke AddInkSheetStrokesAdded(CP3Msgs.InkSheetStrokesAddedMessage issam) {
            //Notice that we tend to get a fair number of these messages that have nothing in the SavedInks property.. presenter bug?
            byte[][] saved = issam.SavedInks;
            if (saved.Length == 0)
                return null;
            if (saved[0].Length == 0)
                return null;
            if (saved.Length > 1) {
                //This does not seem to occur in practice.  If it ever does, we need to generate multiple RTDrawStroke messages:
                warning += "Warning: Valid ink may be ignored because we only support one byte[] per ink message.  ";
            }
            Ink ink = new Ink();
            ink.Load(saved[0]);
            if (ink.Strokes.Count <= 0) {
                return null;
            }

            //This message has a targetID identifying a Sheet which we use to look up a toc entry.
            Debug.WriteLine("***** InkSheetStrokesAdded targetid=" + issam.TargetId.ToString());

            if (!sheetToSlideLookup.ContainsKey(issam.TargetId)) {
                if (issam.SlideId.Equals(Guid.Empty)) {
                    //Don't think this should ever happen.
                    warning += "Warning: InkSheetStrokesAdded does not match a known sheet.  Ignoring ink.  ";
                    return null;
                }
                sheetToSlideLookup.Add(issam.TargetId, issam.SlideId);
            }

            Guid slideId = (Guid)sheetToSlideLookup[issam.TargetId];
            //Get DeckID and Slide index from toc.  Return RTDrawStroke.
            TableOfContents.TocEntry tocEntry = toc.LookupBySlideId(slideId);
            if (tocEntry == null) {
                //In some cases ink arrives before the TOC entry.
                //    Save the ink to send later when the TOC entry is available.
                if (!pendingInk.ContainsKey(slideId)) {
                    pendingInk.Add(slideId, new List<Ink>());
                }
                pendingInk[slideId].Add(ink);
                Debug.WriteLine("InkSheetStrokesAdded does not have a Toc entry.  Caching for later.");
                return null;
            }

            Guid strokeId = Guid.NewGuid();
            //Pull out the identifier which is used if we need to delete the stroke later:
            if (ink.Strokes[0].ExtendedProperties.DoesPropertyExist(StrokeIdExtendedProperty)) {
                strokeId = new Guid((string)ink.Strokes[0].ExtendedProperties[StrokeIdExtendedProperty].Data);
            }
            else {
                warning += "Warning: Failed to find stroke Id.  ";
            }
            //WebViewer looks for the CP2 extended property, so add it too.
            ink.Strokes[0].ExtendedProperties.Add(CP2StrokeIdExtendedProperty, (object)strokeId.ToString());
            //WebViewer wants ink to be scaled to 500x500
            ink.Strokes.Scale(500f / getCurrentSlideWidth(), 500f / getCurrentSlideHeight());
            //Debug.WriteLine("***** Adding Stroke ID=" + strokeId.ToString());
            RTDrawStroke rtds = new RTDrawStroke(ink, strokeId, true, tocEntry.DeckId, tocEntry.SlideIndex);
            
            //Add the stroke to our list to optimize deletes
            if (!strokeCountsBySlideId.ContainsKey(slideId)) {
                strokeCountsBySlideId.Add(slideId, 1);
            }
            else {
                strokeCountsBySlideId[slideId]++;
            }

            return rtds;
        }


        /// <summary>
        /// Use this to track which slide a sheet belongs to.  We need this information because the ink messages only
        /// contain the id of the sheet.  The message also contains the Drawing Attributes for the sheet which we need to store.
        /// </summary>
        /// <param name="rtisim"></param>
        internal void AddRealTimeInkSheetInformation(UW.ClassroomPresenter.Network.Messages.Presentation.RealTimeInkSheetInformationMessage rtisim) {
            // The parent of rtisim is a SlideInformationMessage.  
            if (rtisim.Parent != null) {
                if (sheetToSlideLookup.ContainsKey(rtisim.TargetId)) {
                    sheetToSlideLookup.Remove(rtisim.TargetId);
                }
                sheetToSlideLookup.Add(rtisim.TargetId, rtisim.Parent.TargetId);
                Debug.WriteLine("*** Adding sheetToSlideLookup: sheet:" + rtisim.TargetId.ToString() + ";slide:" +  rtisim.Parent.TargetId.ToString());
            }

            if (rtisim.CurrentDrawingAttributes != null) {
                DrawingAttributes da = rtisim.CurrentDrawingAttributes.CreateDrawingAttributes();
                if (sheetToDrawingAttributesLookup.ContainsKey(rtisim.TargetId)) {
                    sheetToDrawingAttributesLookup.Remove(rtisim.TargetId);
                }
                sheetToDrawingAttributesLookup.Add(rtisim.TargetId, da);
            }
        }

 
        /// <summary>
        /// Return one or more RTDeleteStroke messages.
        /// </summary>
        /// <param name="issdm"></param>
        /// <returns></returns>
        internal List<object> AddInkSheetStrokesDeleting(UW.ClassroomPresenter.Network.Messages.Presentation.InkSheetStrokesDeletingMessage issdm) {
            //Resolve the SheetId to a slideId
            if (!sheetToSlideLookup.ContainsKey(issdm.TargetId)) {
                if (currentSlideId.Equals(Guid.Empty)) {
                    warning += "Warning: Failed to lookup slide from sheet during ink erase operation.";
                    return null;
                }
                //Can we assume current slide??  Probably..
                sheetToSlideLookup.Add(issdm.TargetId, currentSlideId);
            }
            //Use the slideId to get DeckID and Slide index from toc.
            Guid slideId = (Guid)sheetToSlideLookup[issdm.TargetId];
            TableOfContents.TocEntry tocEntry = toc.LookupBySlideId(slideId);
            if (tocEntry == null) {
                warning += "Warning: InkSheetStrokesDeleted does not have a Toc entry.  Ignoring erase. ";
                return null;
            }
            if (issdm.StrokeIds.Length == 0) {
                return null;
            }

            List<object> outputMessages = new List<object>();

            //If more than one stroke, and count matches the total we have recorded for this slide, send one 
            // message to erase all strokes.
            if (issdm.StrokeIds.Length > 1) {
                if (strokeCountsBySlideId.ContainsKey(slideId)) {
                    if (strokeCountsBySlideId[slideId] == issdm.StrokeIds.Length) {
                        strokeCountsBySlideId[slideId] = 0;
                        RTEraseLayer rtel = new RTEraseLayer(tocEntry.DeckId, tocEntry.SlideIndex);
                        Trace.WriteLine("*****Returning RTEraseLayer deck=" + tocEntry.DeckId.ToString() + ";slide=" + tocEntry.SlideIndex.ToString());
                        outputMessages.Add(rtel);
                        //note: this message also takes care of any stray RT strokes, so clear this list:
                        this.realTimeStrokesPending.Clear();
                        return outputMessages;
                    }
                }
            }

            //If there are any stray real-time strokes, delete them here.
            foreach (RTStrokeData rtsd in this.realTimeStrokesPending.Values) {
                outputMessages.Add(rtsd.GetRTDeleteStroke());
                Debug.WriteLine("***** Deleting stray real-time stroke id=" + rtsd.StrokeId.ToString());
            }
            this.realTimeStrokesPending.Clear();

            //Delete individual strokes as indicated
            foreach (string s in issdm.StrokeIds) {
                Guid g = new Guid(s);
                RTDeleteStroke rtds = new RTDeleteStroke(g, tocEntry.DeckId, tocEntry.SlideIndex);
                outputMessages.Add(rtds);
                int strokesRemaining = -1;
                if ((strokeCountsBySlideId.ContainsKey(slideId)) && 
                    (strokeCountsBySlideId[slideId] > 0)) {
                    strokeCountsBySlideId[slideId]--;
                    strokesRemaining = strokeCountsBySlideId[slideId];
                }
                Debug.WriteLine("***** Deleting static stroke id=" + g.ToString() + ";strokes remaining=" + strokesRemaining.ToString());
            }
            return outputMessages;
        }

        /// <summary>
        /// If the slide size (Zoom) or background color changed, return a new RTUpdate
        /// </summary>
        /// <param name="sim"></param>
        /// <returns></returns>
        internal object UpdateSlideInformation(UW.ClassroomPresenter.Network.Messages.Presentation.SlideInformationMessage sim) {
            //if (!sim.SubmissionSlideGuid.Equals(Guid.Empty)) {
            //    Debug.WriteLine("SubmissionSlideGuid: " + sim.SubmissionSlideGuid.ToString());
            //}
            if ((sim.Parent != null) && (sim.Parent.Parent != null) &&
                (sim.Parent is CP3Msgs.DeckInformationMessage) &&
                (sim.Parent.Parent is CP3Msgs.PresentationInformationMessage)) {
                string w;
                object o = toc.UpdateZoomAndColorForSlide(sim, out w);
                if ((w != null) && (w != "")) {
                    warning += w;
                }
                return o;
            }

            // Normal slides are 720x540, but XPS slides are larger.  We need to know this so we can scale the ink correctly.
            if (this.customSlideBounds.ContainsKey((Guid)sim.TargetId)) {
                this.customSlideBounds.Remove((Guid)sim.TargetId);
            }
            this.customSlideBounds.Add((Guid)sim.TargetId, new SizeF((float)sim.Bounds.Width, (float)sim.Bounds.Height));

            return null;
        }

        internal string GetWarnings() {
            if (warning != "") {
                string ret = warning;
                warning = "";
                return ret;
            }
            return null;
        }

        /// <summary>
        /// On stylus-down we record initial ink packets, stroke ID and Tablet properties.  Don't return any ink messages yet.
        /// </summary>
        /// <param name="rtissd"></param>
        /// <remarks>
        /// By definition CP3 real-time ink is ink that only exists during the act of inking, then is promptly deleted.  The static 
        /// completed strokes are created and deleted by separate messages (InkSheetStrokesAddedMessage/...DeletedMessage).
        /// CP3 generates three types of real-time ink messages: stylus down, packets, and stylus up.  We translate the accumulated 
        /// packets into ink strokes (using a constant ID, so that each RT ink message will replace the previous one on WebViewer), 
        /// then on stylus up, we delete the last RT stroke, and a completed static ink stroke is added by InkSheetStrokesAddedMessage.
        /// By definition, real-time messages may be dropped by the CP3 sender, so we need to design with this expectation.
        /// The only serious impact of lost RT messages is that they may cause stray RT ink to remain after
        /// the static ink is deleted.  To work around this, we will keep a list of the RT ink strokes which have been
        /// added, but not yet deleted, then on InkSheetStrokesDeleted, we will examine the list, and generate deletes for any strays.
        /// </remarks>
        internal void AddRealTimeInkSheetStylusDown(UW.ClassroomPresenter.Network.Messages.Presentation.RealTimeInkSheetStylusDownMessage rtissd) {
            //Debug.WriteLine("***** Realtime Ink stylus down StrokeID=" + rtissd.StrokeId.ToString() + "; stylusId=" + rtissd.StylusId.ToString());
            // Store the packets array. In CP3 they use a hashtable keyed on the stylusId, but we can probably just assume one int[].
            // Also store the current stroke id so that we won't apply the wrong packets if a message is lost.
            this.previousRealTimePackets = rtissd.Packets;
            this.previousRealTimeStroke = rtissd.StrokeId;
            this.previousTabletProperties = rtissd.TabletProperties.CreateTabletPropertyDescriptionCollection();
            //For now we assume only one stylus.
        }

        /// <summary>
        /// Translate real-time ink packets to a stroke and return RTStrokeAdded.
        /// </summary>
        /// <param name="rtispm"></param>
        /// <returns></returns>
        internal object AddRealTimeInkSheetPackets(UW.ClassroomPresenter.Network.Messages.Presentation.RealTimeInkSheetPacketsMessage rtispm) {
            //Resolve the sheetId to a slideId, and use it to look up a TOC entry.
            if (!sheetToSlideLookup.ContainsKey(rtispm.TargetId)) {
                if (this.currentSlideId.Equals(Guid.Empty)) {
                    warning += "Warning: found real-time ink on an unknown sheet.  Ignoring the ink.  ";
                    return null;
                }
                //Can we assume current slide??  Probably..
                sheetToSlideLookup.Add(rtispm.TargetId, currentSlideId);
            }
            
            TableOfContents.TocEntry tocEntry = toc.LookupBySlideId((Guid)sheetToSlideLookup[rtispm.TargetId]);
            if (tocEntry == null) {
                warning += "Warning: Failed to find a TOC entry for a slide when applying real-time ink.  Ignoring the ink.  ";
                return null;
            }

            //Tablet Properties should have been received in a StylusDown message.
            if (previousTabletProperties == null) {
                warning += "Warning: Received real-time ink without tablet properties.  Ignoring the ink.  ";
                return null;
            }

            //Debug.WriteLine("***** Realtime Ink packets StrokeID=" + rtispm.StrokeId.ToString() + "; stylusId=" + rtispm.StylusId.ToString());

            // Verify that the stroke we're about to render matches the StrokeId
            // from the most recent StylusDown event.  (If not, then something 
            // probably got lost over the network.)
            if (this.previousRealTimeStroke != rtispm.StrokeId) {
                previousRealTimeStroke = rtispm.StrokeId;
                previousRealTimePackets = new int[] { };
            }

            // Get the DrawingAttributes which were in effect on StylusDown.  We should have received this in a
            // RealTimeInkSheetInformationMessage previously.
            if (!this.sheetToDrawingAttributesLookup.ContainsKey(rtispm.TargetId)) {
                //Note: this seems to happen all the time, but I don't notice any ill effects.  Ignore the ink but leave out the warning.
                //this.warning += "Warning: Real-time ink was found that lacks DrawingAttributes.  The ink will be ignored.  ";
                return null;
            }
            DrawingAttributes atts = (DrawingAttributes)this.sheetToDrawingAttributesLookup[rtispm.TargetId];

            // Ink packets for this stroke so far.  Initial packets should have been received in the Stylus Down message.
            if (this.previousRealTimePackets == null) {
                this.warning += "Warning: Failed to find previous real-time ink packets. The ink will be ignored.  ";
                return null;
            }

            // Assemble the completed information we'll need to create the mini-stroke.
            int[] combinedPackets = new int[this.previousRealTimePackets.Length + rtispm.Packets.Length];
            this.previousRealTimePackets.CopyTo(combinedPackets, 0);
            rtispm.Packets.CopyTo(combinedPackets, this.previousRealTimePackets.Length);

            // Store the new data.
            this.previousRealTimePackets = combinedPackets;

            // Now that we have the data, we're ready to create the temporary stroke.
            Ink ink = new Ink();
            Stroke stroke = ink.CreateStroke(combinedPackets, previousTabletProperties);
            stroke.DrawingAttributes = atts;

            //Look up the data for this stroke, or assign a new Guid if needed.
            RTStrokeData rtsData;
            if (!realTimeStrokesPending.TryGetValue(rtispm.StrokeId, out rtsData)) {
                rtsData = new RTStrokeData(Guid.NewGuid(),tocEntry.DeckId,tocEntry.SlideIndex);
                realTimeStrokesPending.Add(rtispm.StrokeId, rtsData);
            }
            Guid strokeId = rtsData.StrokeId;

            //WebViewer requires the CP2 extended property to allow deletion of the stroke
            ink.Strokes[0].ExtendedProperties.Add(CP2StrokeIdExtendedProperty, (object)strokeId.ToString());
            //WebViewer wants ink to be scaled to 500x500
            ink.Strokes.Scale(500f / getCurrentSlideWidth(), 500f / getCurrentSlideHeight());
            
            
            Debug.WriteLine("***** Adding Real-time Stroke ID=" + strokeId.ToString());
            RTDrawStroke rtds = new RTDrawStroke(ink, strokeId, false, tocEntry.DeckId, tocEntry.SlideIndex);
            return rtds;

        }

        /// <summary>
        /// Helper class to temporarily hold on to the bits necessary to delete a real-time stroke.
        /// </summary>
        private class RTStrokeData {
            private Guid m_StrokeId;
            private Guid m_DeckId;
            private int m_SlideIndex;

            public Guid StrokeId {
                get { return m_StrokeId; }
            }

            public RTStrokeData(Guid id, Guid deckId, int slideIndex) {
                this.m_DeckId = deckId;
                this.m_SlideIndex = slideIndex;
                this.m_StrokeId = id;
            }

            public RTDeleteStroke GetRTDeleteStroke() {
                return new RTDeleteStroke(m_StrokeId, m_DeckId, m_SlideIndex);
            }
        }

        /// <summary>
        /// On stylus-up we send a message to delete real-time ink.  Note we wouldn't need to do this if we could map real-time ink
        /// to completed strokes.
        /// </summary>
        /// <param name="rtissu"></param>
        /// <returns></returns>
        internal object AddRealTimeInkSheetStylusUp(UW.ClassroomPresenter.Network.Messages.Presentation.RealTimeInkSheetStylusUpMessage rtissu) {
            //Debug.WriteLine("***** Realtime Ink stylus Up StrokeID=" + rtissu.StrokeId.ToString() + "; stylusId=" + rtissu.StylusId.ToString());

            //Resolve sheetId to slideID, then use slideId to get the TOC entry.
            if (!this.sheetToSlideLookup.ContainsKey(rtissu.TargetId)) {
                if (currentSlideId.Equals(Guid.Empty)) {
                    warning += "Warning: Failed to find slide for a sheet which was the target of a stylus-up message.  May result in stray ink.  ";
                    return null;
                }
                //Can we assume current slide?? Probably..
                sheetToSlideLookup.Add(rtissu.TargetId, currentSlideId);
            }

            Guid slideId = (Guid)this.sheetToSlideLookup[rtissu.TargetId];

            TableOfContents.TocEntry tocEntry = toc.LookupBySlideId(slideId);
            if (tocEntry == null) {
                warning += "Warning: Failed to find table of contents entry for sheet which was the target of a stylus-up message.  May result in stray ink.  ";
                return null;
            }

            RTStrokeData rtsData;
            if (!this.realTimeStrokesPending.TryGetValue(rtissu.StrokeId,out rtsData)) {
                //warning += "Warning: Failed to find stroke ID for a real-time ink stylus-up message.  May result in stray ink.  ";
                //Note that this seems to happen fairly frequently when using text annotations.  I suspect CP3 is sending stylus up
                //when the annotations are moved, etc.  This case has no consequences for stray ink, so we'll just remove the warning for now.
                Debug.WriteLine("Warning: Failed to find stroke ID for a real-time ink stylus-up message.  Could result in stray ink.  The warning could be bogus if text annotations were used.");
                return null;
            }

            Debug.WriteLine("***** Removing Real-time stroke in response to stylus-up.  Stroke ID=" + rtsData.StrokeId.ToString());
            RTDeleteStroke rtds = rtsData.GetRTDeleteStroke();
            this.realTimeStrokesPending.Remove(rtissu.StrokeId);

            return rtds;
        }

        ///// <summary>
        ///// These messages allow us to create a map of slides and md5 hashes.  Unused.
        ///// </summary>
        ///// <param name="ism"></param>
        //internal void AddImageSheetMessage(UW.ClassroomPresenter.Network.Messages.Presentation.ImageSheetMessage ism) {
        //    if ((ism.Parent != null) && (ism.Parent.Parent != null) &&
        //        (ism.Parent is CP3Msgs.SlideInformationMessage) &&
        //        (ism.Parent.Parent is CP3Msgs.DeckInformationMessage)) {

        //        Debug.WriteLine("ImageSheetMessage: sheet=" + ism.TargetId.ToString() + ";slide=" + ism.Parent.TargetId.ToString() +
        //            ";deck=" + ism.Parent.Parent.TargetId.ToString() + ";hash=" + ism.MD5.ToString());
        //    }
        //}

        /// <summary>
        /// Text annotation add or update operation.
        /// </summary>
        /// <param name="textSheetMessage"></param>
        /// <returns></returns>
        internal object AddTextSheet(UW.ClassroomPresenter.Network.Messages.Presentation.TextSheetMessage tsm) {
            if ((tsm.Parent == null) || !(tsm.Parent is CP3Msgs.SlideInformationMessage)) {
                warning += "Failed to locate slide for a text sheet.  Ignoring Text Annotation.  ";
                return null;
            }

            Guid slideId = (Guid)tsm.Parent.TargetId;
            TableOfContents.TocEntry tocEntry = toc.LookupBySlideId(slideId);
            if (tocEntry == null) {
                warning += "Warning: Failed to find table of contents entry for a text annotation.  Ignoring the annotation.  ";
                return null;
            }

            //WebViewer wants things scaled to 500x500 (this was a CP2 convention).
            Rectangle r = ((CP3Msgs.SheetMessage)tsm).Bounds;
            float fX = (float)r.X * 500F / getCurrentSlideWidth();
            float fY = (float)r.Y * 500F / getCurrentSlideHeight();
            Point scaledOrigin = new Point((int)Math.Round(fX),(int)Math.Round(fY));
            Font scaledFont = new Font(tsm.font_.FontFamily, tsm.font_.Size * 500F / getCurrentSlideWidth(), tsm.font_.Style);
            int scaledWidth = r.Width * 500 / (int)getCurrentSlideWidth();
            int scaledHeight = r.Height * 500 / (int)getCurrentSlideHeight();
            RTTextAnnotation rtta = new RTTextAnnotation(scaledOrigin, scaledFont, tsm.color_, tsm.Text, (Guid)tsm.TargetId, tocEntry.DeckId, tocEntry.SlideIndex, scaledWidth, scaledHeight);

            return rtta;
        }

        /// <summary>
        /// This is used when deleting annotation sheets: text or image
        /// </summary>
        /// <param name="sheetRemovedMessage"></param>
        /// <returns></returns>
        internal object AddSheetRemoved(UW.ClassroomPresenter.Network.Messages.Presentation.SheetRemovedMessage srm) {
            if ((srm.Parent == null) || !(srm.Parent is CP3Msgs.SlideInformationMessage)) {
                warning += "Failed to locate slide for a annotation sheet.  Ignoring Text/image deletion ";
                return null;
            }

            Guid slideId = (Guid)srm.Parent.TargetId;
            TableOfContents.TocEntry tocEntry = toc.LookupBySlideId(slideId);
            if (tocEntry == null) {
                warning += "Warning: Failed to find table of contents entry for a text annotation.  Ignoring the annotation.  ";
                return null;
            }
            
            RTDeleteAnnotation rtdta = new RTDeleteAnnotation((Guid)srm.TargetId, tocEntry.DeckId, tocEntry.SlideIndex);
            return rtdta;
        }

        /// <summary>
        /// If we detect a presentation changed, iterate over the existing decks and erase all ink and text.
        /// We also need to clear the StudentSubmission associations here.
        /// </summary>
        /// <param name="pm"></param>
        /// <returns></returns>
        internal List<object> UpdatePresentaton(UW.ClassroomPresenter.Network.Messages.Presentation.PresentationMessage pm) {
            if (currentPresentationId.Equals(Guid.Empty)) { 
                //initial message
                currentPresentationId = (Guid)pm.TargetId;
                return null;
            }

            if (!currentPresentationId.Equals((Guid)pm.TargetId)) {
                Debug.WriteLine("Detected a new presentation");
                currentPresentationId = (Guid)pm.TargetId;
                List<object> eraseMessages = new List<object>();
                foreach (Guid deckId in toc.DeckIds) {
                    eraseMessages.Add(new RTEraseAllLayers(deckId));
                }
                toc.ClearSSAssociations();
                if (eraseMessages.Count > 0) {
                    return eraseMessages;
                }
            }
            return null;
        }

        /// <summary>
        /// When a new quickpoll is started we get this with parents: QuickPollInformationMessage, Slide..,Deck..,Presentation..
        /// The SheetMessage base class has dimensions, but they appear to all be zeros.
        /// </summary>
        /// <param name="quickPollSheetMessage"></param>
        /// <returns></returns>
        internal object AddQuickPollSheet(UW.ClassroomPresenter.Network.Messages.Presentation.QuickPollSheetMessage qpsm) {
            if ((qpsm.Parent is CP3Msgs.QuickPollInformationMessage) &&
                (qpsm.Parent.Parent is CP3Msgs.SlideInformationMessage) &&
                (qpsm.Parent.Parent.Parent is CP3Msgs.DeckInformationMessage) &&
                (qpsm.Parent.Parent.Parent.Parent is CP3Msgs.PresentationInformationMessage)) {

                CP3Msgs.QuickPollInformationMessage qpim = (CP3Msgs.QuickPollInformationMessage)qpsm.Parent;
                CP3Msgs.SlideInformationMessage sim = (CP3Msgs.SlideInformationMessage)qpsm.Parent.Parent;
                CP3Msgs.DeckInformationMessage dim = (CP3Msgs.DeckInformationMessage)qpsm.Parent.Parent.Parent;
                CP3Msgs.QuickPollMessage qpm = (CP3Msgs.QuickPollMessage)qpim;

                // Note: OriginalSlideId is not in the TOC.  What is that??
                //TableOfContents.TocEntry te = toc.LookupBySlideId(qpModel.OriginalSlideId);

                /// sim.TargetID seems to give us a good TOC entry for the quickpoll 
                /// slide with association information filled in correctly:
                TableOfContents.TocEntry qptoc = toc.LookupBySlideId((Guid)sim.TargetId);
                if (qptoc == null) {
                    Debug.WriteLine("***Failed to find slide for QuickPoll Sheet!");
                    return null;
                }

                m_QuickPollAggregator.AddQuickPoll(qpm.Model);
                toc.AddQuickPollIdForSlide((Guid)sim.TargetId, qpm.Model.Id);
                
                //Send the initial RtQuickPoll with empty results
                int[] results = new int[0];
                ArchiveRTNav.RTQuickPoll rtqp = new ArchiveRTNav.RTQuickPoll((ArchiveRTNav.QuickPollStyle)qpm.Model.PollStyle ,results, qptoc.DeckId, qptoc.SlideIndex);
                return rtqp;
            }
            else {
                Debug.WriteLine("****Unexpected QuickPollSheetMessage: " + qpsm.ToString());
            }
            return null;
        }

        /// <summary>
        /// When there is a vote we get this with parents: QuickPollInformationMessage, Presentation..
        /// Contains a owner ID and a result string such as "C" or "Yes".
        /// Presumably the owner ID is the id of the client, so this is how we would know if a client changed his vote.
        /// </summary>
        /// <param name="quickPollResultInformationMessage"></param>
        /// <returns></returns>
        internal object AddQuickResultInformation(UW.ClassroomPresenter.Network.Messages.Presentation.QuickPollResultInformationMessage qprim) {
            if (qprim.Parent is CP3Msgs.QuickPollInformationMessage) {
                CP3Msgs.QuickPollInformationMessage qpim = (CP3Msgs.QuickPollInformationMessage)qprim.Parent;
                TableOfContents.TocEntry qptoc = toc.LookupByQuickPollId((Guid)qpim.TargetId);
                if (qptoc == null) {
                    Debug.WriteLine("***QuickPoll Result received for unknown QuickPoll!!");
                    return null;
                }

                int[] currentvotes = m_QuickPollAggregator.AcceptResult(qprim.Result, (Guid)qpim.TargetId);

                ArchiveRTNav.RTQuickPoll rtqp = new ArchiveRTNav.RTQuickPoll((ArchiveRTNav.QuickPollStyle)qpim.Model.PollStyle, currentvotes, qptoc.DeckId, qptoc.SlideIndex);
                return rtqp;
            }
            else { 
                Debug.WriteLine("****Unexpected QuickPollResultInformation Message.");
            }
            return null;
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="ism"></param>
        /// <returns></returns>
        internal object AddImageAnnotation(UW.ClassroomPresenter.Network.Messages.Presentation.ImageSheetMessage ism) {
            if (ism.SheetCollectionSelector != UW.ClassroomPresenter.Network.Messages.Presentation.SheetMessage.SheetCollection.AnnotationSheets) { 
                //We only support annotation sheets, not content sheets
                return null;
            }

            if ((ism.Parent == null) || !(ism.Parent is CP3Msgs.SlideInformationMessage)) {
                warning += "Failed to locate slide for a image sheet.  Ignoring Image Annotation.  ";
                return null;
            }

            Guid slideId = (Guid)ism.Parent.TargetId;
            TableOfContents.TocEntry tocEntry = toc.LookupBySlideId(slideId);
            if (tocEntry == null) {
                warning += "Warning: Failed to find table of contents entry for a image annotation.  Ignoring the annotation.  ";
                return null;
            }

            //WebViewer wants things scaled to 500x500 (this was a CP2 convention).
            Rectangle r = ((CP3Msgs.SheetMessage)ism).Bounds;
            float fX = (float)r.X * 500F / getCurrentSlideWidth();
            float fY = (float)r.Y * 500F / getCurrentSlideHeight();
            Point scaledOrigin = new Point((int)Math.Round(fX), (int)Math.Round(fY));
            int scaledWidth = r.Width * 500 / (int)getCurrentSlideWidth();
            int scaledHeight = r.Height * 500 / (int)getCurrentSlideHeight();
            RTImageAnnotation rtia = new RTImageAnnotation(scaledOrigin, (Guid)ism.TargetId, tocEntry.DeckId, 
                                                tocEntry.SlideIndex, scaledWidth, scaledHeight,ism.Img);

            return rtia;
        }

 
        
        /// <summary>
        /// The only thing in this message that we might care about is the background color.
        /// If the color changed and the current slide has no explicit background color set, 
        /// then we want to send a RTUpdate.  Otherwise, just note the new background color.
        /// </summary>
        /// <param name="dim"></param>
        /// <returns></returns>  
        internal object UpdateDeckInformation(CP3Msgs.DeckInformationMessage dim) {
            bool sendRTUpdate = false;
            if (!toc.DeckBackgroundColors.ContainsKey((Guid)dim.TargetId)) {
                toc.DeckBackgroundColors.Add((Guid)dim.TargetId, dim.DeckBackgroundColor);
                //If set and non-white we need to issue a RTUpdate for the current slide.
                if ((!dim.DeckBackgroundColor.Equals(Color.White)) &&
                    (!dim.DeckBackgroundColor.Equals(Color.Empty))) {
                    sendRTUpdate = true;
                }
            }
            else {
                if (!toc.DeckBackgroundColors[(Guid)dim.TargetId].Equals(dim.DeckBackgroundColor)) { 
                    toc.DeckBackgroundColors[(Guid)dim.TargetId] = dim.DeckBackgroundColor;
                    //Color change, issue a RTUpdate for current slide.
                    sendRTUpdate = true;
                }
            }
            if (sendRTUpdate) {
                return toc.GetRtUpdateForSlideId(this.currentSlideId); 
            }
            return null;
        }


        internal float getCurrentSlideWidth() {
            if (!this.currentSlideId.Equals(Guid.Empty)) {
                if (customSlideBounds.ContainsKey(currentSlideId)) {
                    return customSlideBounds[currentSlideId].Width;
                }
            }
            return 720f;
        }

        internal float getCurrentSlideHeight() {
            if (!this.currentSlideId.Equals(Guid.Empty)) {
                if (customSlideBounds.ContainsKey(currentSlideId)) {
                    return customSlideBounds[currentSlideId].Height;
                }
            }
            return 540f;
        }
    }

}
