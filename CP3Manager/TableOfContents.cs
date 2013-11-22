using System;
using System.Collections.Generic;
using System.Text;
using System.Collections;
using ArchiveRTNav;
using CP3Msgs = UW.ClassroomPresenter.Network.Messages.Presentation;
using CP3 = UW.ClassroomPresenter;
using System.Diagnostics;
using System.Text.RegularExpressions;
using System.Security;
using System.Drawing;

namespace CP3Manager {

    class TableOfContents {
        private Hashtable toc;
        private Hashtable tocBySlideId;
        private Dictionary<Guid, Guid> QuickPollIdToSlideId;
        private List<Guid> deckIds;
        private Guid ssDeckId;

        public static TableOfContents TheInstance;

        private Dictionary<Guid, Color> deckBackgroundColors = new Dictionary<Guid, Color>();

        public List<Guid> DeckIds {
            get { return deckIds; }
        }

        public Dictionary<Guid, Color> DeckBackgroundColors {
            get { return this.deckBackgroundColors; }
        }

        public TableOfContents() {
            TableOfContents.TheInstance = this;
            deckIds = new List<Guid>();
            toc = new Hashtable();
            tocBySlideId = new Hashtable();
            QuickPollIdToSlideId = new Dictionary<Guid, Guid>();
            ssDeckId = Guid.Empty;
            deckBackgroundColors = new Dictionary<Guid, Color>();
        }

        /// <summary>
        /// Add a TOC entry.  If message.Parent.Parent is a DeckInformationMessage, the values of
        /// deckID and Disposition contained in that message will override any values given as parameters.
        /// Return the slideId if a new entry was added, else Guid.Empty
        /// </summary>
        /// <param name="tocem"></param>
        /// <param name="deckId"></param>
        /// <param name="disposition"></param>
        /// <param name="warning"></param>
        public Guid AddTableOfContentsEntry(CP3Msgs.TableOfContentsEntryMessage tocem, 
            Guid deckId, CP3.Model.Presentation.DeckDisposition disposition, out string warning) {
            
            warning = null;
            Guid deckIdentifier = deckId;

            if ((tocem.Parent.Parent != null) && (tocem.Parent.Parent is CP3Msgs.DeckInformationMessage)) {
                deckIdentifier = (Guid)tocem.Parent.Parent.TargetId;
                disposition = ((CP3Msgs.DeckInformationMessage)tocem.Parent.Parent).Disposition;
            }

            if (deckIdentifier.Equals(Guid.Empty)) {
                //If we don't know the deckID, skip.
                //warning = "Failed to add TOC entry because deck id is Guid.Empty";
                if (tocem.Parent is CP3Msgs.SlideInformationMessage) {
                    Debug.WriteLine("*****Failed to add TOC entry because deck id is Guid.Empty.  Slide ID=" + tocem.Parent.TargetId.ToString());
                }
                else {
                    Debug.WriteLine("*****Failed to add TOC entry because deck id is Guid.Empty.");
                }
                return Guid.Empty;
            }

            if (!deckIds.Contains(deckIdentifier)) {
                deckIds.Add(deckIdentifier);
            }         

            if ((tocem.Parent is CP3Msgs.SlideInformationMessage) &&
                (tocem.PathFromRoot.Length == 1)) {
                bool added = true;
                if (toc.ContainsKey(tocem.TargetId)) {
                    Debug.WriteLine("Replacing Toc entry with id = " + tocem.TargetId.ToString());
                    toc.Remove(tocem.TargetId);
                    added = false;
                }
                if (tocBySlideId.ContainsKey(tocem.Parent.TargetId)) {
                    tocBySlideId.Remove(tocem.Parent.TargetId);
                }
                TocEntry newEntry = new TocEntry(tocem, deckIdentifier, disposition, this.ssDeckId);
                Debug.WriteLine("*** New " + newEntry.ToString());
                toc.Add(tocem.TargetId, newEntry);
                tocBySlideId.Add(tocem.Parent.TargetId, newEntry);
                if (added)
                    return (Guid)tocem.Parent.TargetId;
                return Guid.Empty;
            }
            else {
                if (tocem.PathFromRoot.Length != 1) {
                    //PathFromRoot defines the location of the Parent slide node in a tree structure.  This in turn defines the slide index.
                    string dbgstr = "";
                    for (int i = 0; i < tocem.PathFromRoot.Length; i++) {
                        dbgstr += tocem.PathFromRoot[i].ToString() + " ";
                    }
                    warning = "Warning: TOC trees of depth greater than one are not yet supported: " +
                        "TableOfContentsEntryMessage: PathFromRoot len=" + tocem.PathFromRoot.Length.ToString() +
                        "; value=" + dbgstr + "; id=" + tocem.TargetId.ToString() + "; parent id=" + tocem.Parent.TargetId.ToString() +
                        "; parent parent id=" + tocem.Parent.Parent.TargetId.ToString();
                }
            }
            return Guid.Empty;
        }

        internal class TocEntry {
            private Guid deckId;
            private Guid slideId;
            private Guid deckAssociation;
            private DeckTypeEnum deckTypeAssociation;
            private Guid associationSlideId;
            private int slideAssociation;
            private int slideIndex;
            private string title;
            private DeckTypeEnum deckType;
            private double slideSize;
            private Color backgroundColor;

            public override string ToString() {
                return ("TocEntry:DeckId=" + deckId.ToString() + ";SlideID=" + slideId.ToString() + ";SlideIndex=" + slideIndex.ToString());
            }

            public string Title {
                get { return title; }
            }

            public Guid DeckId {
                get { return deckId; }
            }

            //For Student Submission slide: This is a pointer to the original slide.  Use it
            //to resolve DeckAssociation and SlideAssociation below.
            public Guid AssociationSlideId {
                get { return associationSlideId; }
            }

            //zero-based index.
            public int SlideIndex {
                get { return slideIndex; }
            }

            public double SlideSize {
                get { return slideSize; }
                set { slideSize = value; }
            }

            public Color BackgroundColor {
                get { return backgroundColor; }
                set { backgroundColor = value; }
            }

            public Guid DeckAssociation {
                get { return deckAssociation; }
                set { deckAssociation = value; }
            }

            public DeckTypeEnum DeckTypeAssociation {
                get { return deckTypeAssociation; }
                set { deckTypeAssociation = value; }
            }

            public int SlideAssociation {
                get { return slideAssociation; }
                set { slideAssociation = value; }
            }

            public DeckTypeEnum DeckType {
                get { return deckType; }
            }

            public Guid SlideId {
                get { return slideId; }
            }

            public TocEntry(CP3Msgs.TableOfContentsEntryMessage tocem, Guid deckid, CP3.Model.Presentation.DeckDisposition disposition, Guid ssDeckId) {
                deckAssociation = Guid.Empty;
                associationSlideId = Guid.Empty;
                this.deckTypeAssociation = DeckTypeEnum.Undefined;
                slideAssociation = -1;
                deckId = deckid;

                deckType = DeckTypeEnum.Presentation;
                    
                if ((disposition & CP3.Model.Presentation.DeckDisposition.Whiteboard) != 0) {
                     deckType = DeckTypeEnum.Whiteboard;
                }
                if ((disposition & CP3.Model.Presentation.DeckDisposition.StudentSubmission) != 0) {
                    deckType = DeckTypeEnum.StudentSubmission;
                    if (!ssDeckId.Equals(Guid.Empty)) {
                        deckId = ssDeckId;
                    }
                }
                if ((disposition & CP3.Model.Presentation.DeckDisposition.QuickPoll) != 0) {
                    deckType = DeckTypeEnum.QuickPoll;
                }

                slideId = (Guid)tocem.Parent.TargetId;

                //Debug code:
                //if (slideId.Equals(new Guid("96c09fe9-f0be-4421-9cf4-7d26032382a1"))) {
                //    Debug.WriteLine("Found slide.");
                //}

                title = ((CP3Msgs.SlideInformationMessage)tocem.Parent).Title;
                slideSize = ((CP3Msgs.SlideInformationMessage)tocem.Parent).Zoom;

                ///If this is Color.Empty then the slide will use the Deck background color.  If that one is also
                ///Color.Empty, then it will default to white.
                backgroundColor = ((CP3Msgs.SlideInformationMessage)tocem.Parent).SlideBackgroundColor;

                associationSlideId = ((CP3Msgs.SlideInformationMessage)tocem.Parent).AssociationSlideId;
                if (tocem.PathFromRoot.Length == 1) {
                    slideIndex = tocem.PathFromRoot[0]; //This is a zero-based index.
                }

                if (!associationSlideId.Equals(Guid.Empty)) {
                    //About CP3 build 1603 we added a message extension to help map SS slides back to the source slide in the presentation.
                    CP3Msgs.SlideInformationMessage sim = (CP3Msgs.SlideInformationMessage)tocem.Parent;
                    if (sim.Extension != null) {
                        CP3.Misc.ExtensionWrapper extw = sim.Extension as CP3.Misc.ExtensionWrapper;
                        if (extw != null) {
                            if (extw.ExtensionType.Equals(CP3Msgs.SlideAssociationExtension.ExtensionId)) {
                                CP3Msgs.SlideAssociationExtension assnExt = (CP3Msgs.SlideAssociationExtension)(extw.ExtensionObject);
                                this.associationSlideId = assnExt.SlideID;
                                this.deckAssociation = assnExt.DeckID;
                                this.slideAssociation = assnExt.SlideIndex;
                                if ((assnExt.DeckType & CP3.Model.Presentation.DeckDisposition.StudentSubmission) != 0) {
                                    this.deckTypeAssociation = DeckTypeEnum.StudentSubmission;
                                }
                                if ((assnExt.DeckType & CP3.Model.Presentation.DeckDisposition.Whiteboard) != 0) {
                                    this.deckTypeAssociation = DeckTypeEnum.Whiteboard;
                                }
                                if ((assnExt.DeckType & CP3.Model.Presentation.DeckDisposition.QuickPoll) != 0) {
                                    this.deckTypeAssociation = DeckTypeEnum.QuickPoll;
                                }
                                if (assnExt.DeckType == CP3.Model.Presentation.DeckDisposition.Empty) {
                                    this.deckTypeAssociation = DeckTypeEnum.Presentation;
                                }
                            }
                        }
                    }
                }
            }

            internal RTUpdate ToRtUpdate() {
                RTUpdate rtu = new RTUpdate();
                rtu.DeckGuid = deckId;
                rtu.SlideIndex = slideIndex;
                rtu.DeckType = (int)deckType;
                rtu.SlideSize = slideSize;
                
                //background colors can be attached to any slide and deck, but they only show
                //on whiteboards, or on the area around a minimized slide.
                if (!backgroundColor.Equals(Color.Empty)) {
                    //Explicitly set slide color has top priority
                    rtu.BackgroundColor = backgroundColor;
                }
                else if ((TableOfContents.TheInstance.DeckBackgroundColors.ContainsKey(deckId)) &&
                        (!TableOfContents.TheInstance.DeckBackgroundColors[deckId].Equals(Color.Empty))) {
                    //DeckBackground color is checked next.
                    rtu.BackgroundColor = TableOfContents.TheInstance.DeckBackgroundColors[deckId];
                }
                else { 
                    //If none are set, default to white.
                    rtu.BackgroundColor = Color.White;            
                }

                if ((deckType == DeckTypeEnum.StudentSubmission) ||
                    (deckType == DeckTypeEnum.QuickPoll)){
                    rtu.DeckAssociation = deckAssociation;
                    rtu.SlideAssociation = slideAssociation;
                    rtu.DeckTypeAssociation = (int)deckTypeAssociation;
                }
                return rtu;
            }
        }

        /// <summary>
        /// for the given Toc key, find the entry and if the entry is for a Student Submission slide, and
        /// the slide and deck association are missing, attempt to resolve and update them.
        /// Return false if the assocation needs updating, but the update failed.  Return true in all
        /// other cases.
        /// </summary>
        /// <param name="tocKey"></param>
        /// <returns></returns>
        private bool UpdateAssociation(TocEntry entry) {
            /// StudentSubmission and QuickPoll entries should have valid deck associations.
            /// A valid association includes a deck Guid, a slide index and a association deck typ
            /// that is a presentation or whiteboard.
            if (((entry.DeckType == DeckTypeEnum.StudentSubmission) || 
                (entry.DeckType == DeckTypeEnum.QuickPoll))&&
                ((entry.DeckAssociation == Guid.Empty) ||
                 (entry.SlideAssociation < 0) ||
                 (entry.DeckTypeAssociation == DeckTypeEnum.QuickPoll) ||
                 (entry.DeckTypeAssociation == DeckTypeEnum.StudentSubmission) ||
                 (entry.DeckTypeAssociation == DeckTypeEnum.Undefined))) {

                TocEntry associationEntry = FindAssociation(entry);

                if (associationEntry != null) {
                    entry.DeckAssociation = associationEntry.DeckId;
                    entry.SlideAssociation = associationEntry.SlideIndex;
                    entry.DeckTypeAssociation = associationEntry.DeckType;
                }
                else {
                    return false;
                }
            }
            return true;
        }

        /// <summary>
        /// Recursive search for a slide association that is a presentation or whiteboard.
        /// This is needed because we can have Student Submissions on QuickPoll slides and vice-versa.
        /// </summary>
        /// <param name="thisTocEntry"></param>
        /// <returns></returns>
        private TocEntry FindAssociation(TocEntry thisTocEntry) { 
            if (thisTocEntry.AssociationSlideId == Guid.Empty) {
                Debug.WriteLine("Student submission or QuickPoll slide lacks an associationSlideId");
                return null;
            }
            if (!this.tocBySlideId.ContainsKey(thisTocEntry.AssociationSlideId)) {
                Debug.WriteLine("Failed to find TOC entry for association slide for student submission or QuickPoll.");
                return null;
            }
            TocEntry associationEntry = (TocEntry)tocBySlideId[thisTocEntry.AssociationSlideId];
            if ((associationEntry.DeckType == DeckTypeEnum.QuickPoll) ||
                (associationEntry.DeckType == DeckTypeEnum.StudentSubmission)) {
                return FindAssociation(associationEntry);
            }
            else {
                return associationEntry;
            }
        }

        internal RTUpdate GetRtUpdate(Guid tocKey) {
            if (this.toc.ContainsKey(tocKey)) {
                TocEntry entry = (TocEntry)toc[tocKey];
                if (entry.DeckType == DeckTypeEnum.QuickPoll) {
                    Debug.WriteLine("");
                }
                if (!UpdateAssociation(entry)) {
                    //If we failed to map a student submission to a deck it could be because the SS is on
                    // a whiteboard page, or it could be that we don't yet have a TOC entry for the 
                    // original slide.  For now, just treat both cases as if
                    // they were whiteboard.
                    // P2: Make a way to mark the message as SS and leave the deck association empty, and
                    // have that be understood as a SS on a WB.  I think this requires an update to WebViewer?
                    RTUpdate rtu = entry.ToRtUpdate();
                    rtu.DeckType = (int)DeckTypeEnum.Whiteboard;
                    return rtu;
                }
                return entry.ToRtUpdate();
            }
            return null;
        }

        internal Guid GetDeckId(Guid tocKey) {
            if (this.toc.ContainsKey(tocKey)) {
                return ((TocEntry)toc[tocKey]).DeckId;
            }
            return Guid.Empty;
        }

        internal TocEntry LookupBySlideId(Guid slideId) {
            if (this.tocBySlideId.ContainsKey(slideId)) {
                return (TocEntry)tocBySlideId[slideId];
            }
            return null;
        }

        internal string GetSlideTitles() {
            StringBuilder sb = new StringBuilder();
            foreach (TocEntry te in toc.Values) {
                sb.Append("<Title DeckGuid=\"" + te.DeckId.ToString() + "\" Index=\"" + te.SlideIndex.ToString() +
                    "\" Text=\"" + FixTitle(te.Title) + "\"/>  ");

            }
            return sb.ToString();
        }

        /// <summary>
        /// Make transformations on the title we're given to make a useful and XML compatible title.
        /// </summary>
        /// <param name="rawTitle"></param>
        /// <returns></returns>
        private String FixTitle(String rawTitle) {
            // The slide titles may be formed like this: "  1. Title".  Convert to "Title".
            String fixedTitle = Regex.Replace((rawTitle), @"^\s*[0-9]*\.\s", "");
            // Trim any whitespace characters from front and end
            fixedTitle = fixedTitle.Trim();
            // Replace invalid XML characters with valid equivalents.
            fixedTitle = SecurityElement.Escape(fixedTitle);
            return fixedTitle;
        }

        internal object UpdateZoomAndColorForSlide(CP3Msgs.SlideInformationMessage sim, out string warning) {
            Guid slideId = (Guid)sim.TargetId;
            float zoom = sim.Zoom;
            Color color = sim.SlideBackgroundColor;
            warning = "";
            if (!this.tocBySlideId.ContainsKey(slideId)) {
                return null;
            }
            TocEntry entry = (TocEntry)this.tocBySlideId[slideId];
            if ((entry.SlideSize != zoom) ||
                (!entry.BackgroundColor.Equals(color))) {
                if (!entry.BackgroundColor.Equals(color)) {
                    Debug.WriteLine("*****Update to slide background color.");
                }
                entry.SlideSize = zoom;
                entry.BackgroundColor = color;
                if (!UpdateAssociation(entry)) {
                    return null;
                }


                return entry.ToRtUpdate();
            }
            return null;
        }

        internal bool ContainsEntry(Guid tocId) {
            return toc.ContainsKey(tocId);
        }


        internal void ClearSSAssociations() {
            ssDeckId = Guid.NewGuid();
            foreach (TocEntry entry in toc.Values) {
                entry.SlideAssociation = -1;
                entry.DeckAssociation = Guid.Empty;
                entry.DeckTypeAssociation = DeckTypeEnum.Undefined;
            }
        }

        /// <summary>
        /// Associate a QuickPollId in the TOC with the given SlideId, so that when we get QuickPoll results later
        /// we can look up the TOC entry by this ID.
        /// </summary>
        /// <param name="slideId"></param>
        /// <param name="quickPollId"></param>
        internal void AddQuickPollIdForSlide(Guid slideId, Guid quickPollId) {
            //First make sure the SlideId exists in the TOC
            TocEntry entry = this.LookupBySlideId(slideId);
            if (entry == null) {
                Debug.WriteLine("!!!Failed to find slide to which to add QuickPoll ID!!!");
                return;
            }
            //Remove existing mapping if any.
            if (QuickPollIdToSlideId.ContainsKey(quickPollId)) {
                QuickPollIdToSlideId.Remove(quickPollId);
            }
            //Add mapping
            QuickPollIdToSlideId.Add(quickPollId, slideId);
        }

        /// <summary>
        /// Look up TOC entry by QuickPoll Id
        /// </summary>
        /// <param name="quickPollId"></param>
        /// <returns></returns>
        internal TocEntry LookupByQuickPollId(Guid quickPollId) {
            if (QuickPollIdToSlideId.ContainsKey(quickPollId)) {
                return this.LookupBySlideId(QuickPollIdToSlideId[quickPollId]);
            }
            else {
                Debug.WriteLine("***Failed to find QuickPoll ID in the TOC!!");
                return null;
            }
        }

        internal object GetRtUpdateForSlideId(Guid guid) {
            if (guid.Equals(Guid.Empty)) {
                return null;
            }
            TocEntry entry = this.LookupBySlideId(guid);
            if (entry == null) {
                return null;
            }
            return entry.ToRtUpdate();
        }
    }
}
