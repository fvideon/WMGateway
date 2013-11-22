using System;
using System.IO;
using System.Windows.Forms;

namespace UW.CSE.DISC
{
	/// <summary>
	/// Writes messages to a TextBox and/or a file
	/// </summary>
	public class Logger
	{
		private String[]		sa;						//content of the textbox
		private int				maxlines = 100;			//max number of lines in textbox
		private int				cline = 0;				//next line to write into sa
		private int				displayLines = 0;		//current number of lines in textbox
		private TextBox			logTextBox = null;		//The textbox itself
		private string			logFileName = null;		//file name
		private StreamWriter	logStreamWriter = null;	//for file logging 

		/// <summary>
		/// Construct
		/// </summary>
		/// <param name="txtBox">null indicates don't write to textBox</param>
		/// <param name="filename">null indicates don't write to file</param>
		public Logger(TextBox txtBox, String filename)
		{
			logTextBox = txtBox;
			logFileName = filename;
			if (logFileName != null)
			{
				CreateOpenLogFile();
				sa = new String[maxlines];
			}
		}


		public void Close()
		{
			logTextBox = null;
			if (logStreamWriter != null)
			{
				CloseLogFile();
			}
		}

		public void Flush()
		{
			FlushLogFile();
		}

		private void CreateOpenLogFile() 
		{
			logStreamWriter = null;

			FileStream dLogFileStream = new FileStream(logFileName,
				FileMode.Append, FileAccess.Write, FileShare.None);
         
			logStreamWriter = new StreamWriter(dLogFileStream);
		}

		private void CloseLogFile()
		{
			if (logStreamWriter != null)
			{
				logStreamWriter.Flush();
				logStreamWriter.Close();
				logStreamWriter = null;
			}
		}

		private void FlushLogFile()
		{
			if (logStreamWriter != null)
			{
				logStreamWriter.Flush();
			}
		}

		/// <summary>
		/// Write to diagnostic log and textbox
		/// </summary>
		/// <param name="s">String to add to log</param>
		/// Can we redo this with an ArrayList?  Would that be easier?
		public void Write(String s)
		{
			string timeNow = DateTime.Now.ToString("HH:mm:ss");
			lock (this) 
			{
				int	oldest;	//index to oldest item in sa.			

				if (logTextBox != null)
				{
					if (cline==maxlines)
					{
						cline=0;
					}

					displayLines++; // how many lines to display
					
					if (displayLines>maxlines) 
					{
						oldest=cline+1;
						if (oldest == maxlines)
						{
							oldest = 0;
						}
						displayLines = maxlines;
					}
					else
					{
						oldest = 0;
					}

					sa[cline] = timeNow + " " + s;

					String [] tmpsa = new String[displayLines];
					
					if (oldest == 0)
					{
						Array.Copy(sa,tmpsa,displayLines);
					}
					else
					{
						Array.Copy(sa,oldest,tmpsa,0,maxlines-oldest);
						Array.Copy(sa,0,tmpsa,maxlines-oldest,oldest);	
					}

					cline++;

					logTextBox.Lines = tmpsa;		
					logTextBox.Select(logTextBox.TextLength - tmpsa[displayLines-1].Length,0);
					logTextBox.ScrollToCaret();		
				}

				if (logStreamWriter != null) 
				{
					logStreamWriter.WriteLine(timeNow + " " + s);
				}
			}	
		}

	}
}
