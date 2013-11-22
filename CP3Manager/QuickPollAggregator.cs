using System;
using System.Collections.Generic;
using System.Text;
using UW.ClassroomPresenter.Model.Presentation;
using System.Diagnostics;

namespace CP3Manager {
    class QuickPollAggregator {

        Dictionary<Guid, VoteCounter> m_VoteCounts;

        public QuickPollAggregator() {
            m_VoteCounts = new Dictionary<Guid, VoteCounter>();
        }

        /// <summary>
        /// Add a new QuickPoll.
        /// </summary>
        /// <param name="id"></param>
        public void AddQuickPoll(QuickPollModel model) {
            if (m_VoteCounts.ContainsKey(model.Id)) {
                m_VoteCounts.Remove(model.Id);
            }
            VoteCounter vc = new VoteCounter(model.PollStyle);
            m_VoteCounts.Add(model.Id, vc);
        }

        /// <summary>
        /// Accept a new result, aggreate it, and return the current array.
        /// </summary>
        /// <param name="result"></param>
        /// <param name="id"></param>
        /// <returns></returns>
        public int[] AcceptResult(QuickPollResultModel result, Guid id) {
            if (m_VoteCounts.ContainsKey(id)) {
                using (Synchronizer.Lock(result)) {
                    m_VoteCounts[id].AddVote(result.ResultString, result.OwnerId);
                }
                return m_VoteCounts[id].GetCurrentCount();
            }
            else {
                Debug.WriteLine("***QuickPoll Result for non-existant Poll!");
                return new int[0];
            }
        }

        private class VoteCounter {
            QuickPollModel.QuickPollStyle m_Style;
            Dictionary<Guid, string> m_Votes;

            public VoteCounter(QuickPollModel.QuickPollStyle style) {
                m_Style = style;
                m_Votes = new Dictionary<Guid, string>();
            }
            
            public int[] GetCurrentCount() { 
                List<string> voteKeys = QuickPollAggregator.GetVoteStringsFromStyle(m_Style);
                Dictionary<string,int> voteCounts = new Dictionary<string,int>();
                
                foreach (string k in voteKeys) {
                    voteCounts.Add(k,0);
                }

                foreach(string v in m_Votes.Values) {
                    if (voteCounts.ContainsKey(v)) {
                        voteCounts[v]++;
                    }
                    else {
                        Debug.WriteLine("**Vote does not match style! " + v);
                    }
                }

                int[] ret = new int[voteCounts.Count];
                voteCounts.Values.CopyTo(ret,0);
                return ret;
            }

            public void AddVote(string vote, Guid ownerId) {
                if (m_Votes.ContainsKey(ownerId)) {
                    m_Votes.Remove(ownerId);
                }
                m_Votes.Add(ownerId, vote);
            }
        }

        /// <summary>
        /// Code copied from CP3
        /// </summary>
        /// <param name="style"></param>
        /// <returns></returns>
        public static List<string> GetVoteStringsFromStyle(QuickPollModel.QuickPollStyle style) {
            List<string> strings = new List<string>();
            switch (style) {
                case QuickPollModel.QuickPollStyle.YesNo:
                    strings.Add("Yes");
                    strings.Add("No");
                    break;
                case QuickPollModel.QuickPollStyle.YesNoBoth:
                    strings.Add("Yes");
                    strings.Add("No");
                    strings.Add("Both");
                    break;
                case QuickPollModel.QuickPollStyle.YesNoNeither:
                    strings.Add("Yes");
                    strings.Add("No");
                    strings.Add("Neither");
                    break;
                case QuickPollModel.QuickPollStyle.ABC:
                    strings.Add("A");
                    strings.Add("B");
                    strings.Add("C");
                    break;
                case QuickPollModel.QuickPollStyle.ABCD:
                    strings.Add("A");
                    strings.Add("B");
                    strings.Add("C");
                    strings.Add("D");
                    break;
                case QuickPollModel.QuickPollStyle.ABCDE:
                    strings.Add("A");
                    strings.Add("B");
                    strings.Add("C");
                    strings.Add("D");
                    strings.Add("E");
                    break;
                case QuickPollModel.QuickPollStyle.ABCDEF:
                    strings.Add("A");
                    strings.Add("B");
                    strings.Add("C");
                    strings.Add("D");
                    strings.Add("E");
                    strings.Add("F");
                    break;
                case QuickPollModel.QuickPollStyle.Custom:
                    // Do Nothing for now
                    break;
            }
            return strings;
        }
    }
}
