using System;
using System.Drawing;
using System.Collections;
using System.ComponentModel;
using System.Windows.Forms;
using System.Net;

namespace UW.CSE.DISC
{
	/// <summary>
	/// Presentation config form
	/// </summary>
	public class PConfigForm : System.Windows.Forms.Form
	{
		private System.Windows.Forms.Label lblPort;
		private System.Windows.Forms.Label lblAddr;
		public System.Windows.Forms.TextBox txtPort;
		public System.Windows.Forms.TextBox txtAddr;
		private System.Windows.Forms.Button btnOK;
		private System.Windows.Forms.Button btnCancel;
		public System.Windows.Forms.TextBox txtBaseURL;
		private System.Windows.Forms.Label label1;
		public System.Windows.Forms.CheckBox checkBoxPILog;
		public System.Windows.Forms.CheckBox checkBoxSLog;
		private System.Windows.Forms.Label label2;
		public System.Windows.Forms.TextBox txtExtent;
		private System.Windows.Forms.Button btnTest;
		/// <summary>
		/// Required designer variable.
		/// </summary>
		private System.ComponentModel.Container components = null;

		public PConfigForm()
		{
			InitializeComponent();
		}

		protected override void Dispose( bool disposing )
		{
			if( disposing )
			{
				if(components != null)
				{
					components.Dispose();
				}
			}
			base.Dispose( disposing );
		}

		#region Windows Form Designer generated code
		/// <summary>
		/// Required method for Designer support - do not modify
		/// the contents of this method with the code editor.
		/// </summary>
		private void InitializeComponent()
		{
			this.lblPort = new System.Windows.Forms.Label();
			this.lblAddr = new System.Windows.Forms.Label();
			this.txtPort = new System.Windows.Forms.TextBox();
			this.txtAddr = new System.Windows.Forms.TextBox();
			this.btnOK = new System.Windows.Forms.Button();
			this.btnCancel = new System.Windows.Forms.Button();
			this.txtBaseURL = new System.Windows.Forms.TextBox();
			this.label1 = new System.Windows.Forms.Label();
			this.checkBoxPILog = new System.Windows.Forms.CheckBox();
			this.checkBoxSLog = new System.Windows.Forms.CheckBox();
			this.label2 = new System.Windows.Forms.Label();
			this.txtExtent = new System.Windows.Forms.TextBox();
			this.btnTest = new System.Windows.Forms.Button();
			this.SuspendLayout();
			// 
			// lblPort
			// 
			this.lblPort.Location = new System.Drawing.Point(456, 16);
			this.lblPort.Name = "lblPort";
			this.lblPort.Size = new System.Drawing.Size(32, 16);
			this.lblPort.TabIndex = 7;
			this.lblPort.Text = "Port";
			// 
			// lblAddr
			// 
			this.lblAddr.Location = new System.Drawing.Point(16, 17);
			this.lblAddr.Name = "lblAddr";
			this.lblAddr.Size = new System.Drawing.Size(136, 16);
			this.lblAddr.TabIndex = 6;
			this.lblAddr.Text = "Custom Presenter Venue:";
			// 
			// txtPort
			// 
			this.txtPort.Location = new System.Drawing.Point(488, 14);
			this.txtPort.Name = "txtPort";
			this.txtPort.Size = new System.Drawing.Size(56, 20);
			this.txtPort.TabIndex = 5;
			this.txtPort.Text = "txtPort";
			// 
			// txtAddr
			// 
			this.txtAddr.Location = new System.Drawing.Point(152, 14);
			this.txtAddr.Name = "txtAddr";
			this.txtAddr.Size = new System.Drawing.Size(144, 20);
			this.txtAddr.TabIndex = 4;
			this.txtAddr.Text = "txtAddr";
			// 
			// btnOK
			// 
			this.btnOK.Location = new System.Drawing.Point(464, 104);
			this.btnOK.Name = "btnOK";
			this.btnOK.Size = new System.Drawing.Size(80, 24);
			this.btnOK.TabIndex = 11;
			this.btnOK.Text = "OK";
			this.btnOK.Click += new System.EventHandler(this.btnOK_Click);
			// 
			// btnCancel
			// 
			this.btnCancel.DialogResult = System.Windows.Forms.DialogResult.Cancel;
			this.btnCancel.Location = new System.Drawing.Point(312, 104);
			this.btnCancel.Name = "btnCancel";
			this.btnCancel.Size = new System.Drawing.Size(80, 24);
			this.btnCancel.TabIndex = 10;
			this.btnCancel.Text = "Cancel";
			// 
			// txtBaseURL
			// 
			this.txtBaseURL.Location = new System.Drawing.Point(152, 43);
			this.txtBaseURL.Name = "txtBaseURL";
			this.txtBaseURL.Size = new System.Drawing.Size(392, 20);
			this.txtBaseURL.TabIndex = 12;
			this.txtBaseURL.Text = "txtBaseURL";
			// 
			// label1
			// 
			this.label1.Location = new System.Drawing.Point(38, 43);
			this.label1.Name = "label1";
			this.label1.Size = new System.Drawing.Size(112, 16);
			this.label1.TabIndex = 13;
			this.label1.Text = "Base URL for Slides:";
			this.label1.TextAlign = System.Drawing.ContentAlignment.BottomLeft;
			// 
			// checkBoxPILog
			// 
			this.checkBoxPILog.CheckAlign = System.Drawing.ContentAlignment.MiddleRight;
			this.checkBoxPILog.Location = new System.Drawing.Point(288, 75);
			this.checkBoxPILog.Name = "checkBoxPILog";
			this.checkBoxPILog.Size = new System.Drawing.Size(136, 16);
			this.checkBoxPILog.TabIndex = 14;
			this.checkBoxPILog.Text = "Log Slide Transitions:";
			// 
			// checkBoxSLog
			// 
			this.checkBoxSLog.CheckAlign = System.Drawing.ContentAlignment.MiddleRight;
			this.checkBoxSLog.Location = new System.Drawing.Point(440, 75);
			this.checkBoxSLog.Name = "checkBoxSLog";
			this.checkBoxSLog.Size = new System.Drawing.Size(104, 16);
			this.checkBoxSLog.TabIndex = 15;
			this.checkBoxSLog.Text = "Log All Scripts:";
			// 
			// label2
			// 
			this.label2.Location = new System.Drawing.Point(16, 74);
			this.label2.Name = "label2";
			this.label2.Size = new System.Drawing.Size(192, 16);
			this.label2.TabIndex = 16;
			this.label2.Text = "File name extension for slide images:";
			// 
			// txtExtent
			// 
			this.txtExtent.Location = new System.Drawing.Point(216, 72);
			this.txtExtent.Name = "txtExtent";
			this.txtExtent.Size = new System.Drawing.Size(48, 20);
			this.txtExtent.TabIndex = 17;
			this.txtExtent.Text = "txtExtent";
			// 
			// btnTest
			// 
			this.btnTest.Location = new System.Drawing.Point(152, 105);
			this.btnTest.Name = "btnTest";
			this.btnTest.Size = new System.Drawing.Size(104, 23);
			this.btnTest.TabIndex = 18;
			this.btnTest.Text = "Check Base URL";
			this.btnTest.Click += new System.EventHandler(this.btnTest_Click);
			// 
			// PConfigForm
			// 
			this.AutoScaleBaseSize = new System.Drawing.Size(5, 13);
			this.ClientSize = new System.Drawing.Size(554, 144);
			this.Controls.Add(this.btnTest);
			this.Controls.Add(this.txtExtent);
			this.Controls.Add(this.txtBaseURL);
			this.Controls.Add(this.txtPort);
			this.Controls.Add(this.txtAddr);
			this.Controls.Add(this.label2);
			this.Controls.Add(this.checkBoxSLog);
			this.Controls.Add(this.checkBoxPILog);
			this.Controls.Add(this.label1);
			this.Controls.Add(this.btnOK);
			this.Controls.Add(this.btnCancel);
			this.Controls.Add(this.lblPort);
			this.Controls.Add(this.lblAddr);
			this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedDialog;
			this.MaximizeBox = false;
			this.MinimizeBox = false;
			this.Name = "PConfigForm";
			this.Text = "Presenter Integration Configuration";
			this.ResumeLayout(false);

		}
		#endregion

		private void btnOK_Click(object sender, System.EventArgs e)
		{
			IPAddress ipa;
			try
			{
				ipa = IPAddress.Parse(txtAddr.Text);
			}
			catch
			{
				MessageBox.Show("Invalid IP Address.");
				return;
			}

			uint port;
			try
			{
				port = Convert.ToUInt32(txtPort.Text);
			}
			catch
			{
				MessageBox.Show ("Invalid port.");
				return;
			}
			if ((port > IPEndPoint.MaxPort) ||
				(port < IPEndPoint.MinPort))
			{
				MessageBox.Show("Port out of range.");
				return;
			}

			this.DialogResult = DialogResult.OK;
		}

		/// <summary>
		/// Test Slide path
		/// </summary>
		/// <param name="sender"></param>
		/// <param name="e"></param>
		private void btnTest_Click(object sender, System.EventArgs e)
		{	
			try 
			{
				WebClient webClient = new WebClient();
				//Image tmpImage = System.Drawing.Image.FromStream(webClient.OpenRead(imgURL));
				webClient.OpenRead(txtBaseURL.Text);
				MessageBox.Show("Successfully opened: " + txtBaseURL.Text);
			}
			catch (WebException ex)
			{
				if(ex.Status == WebExceptionStatus.ProtocolError) 
				{
					if (((HttpWebResponse)ex.Response).StatusCode == HttpStatusCode.NotFound)
					{
						MessageBox.Show("Base URL path not found: " + txtBaseURL.Text);
					}
					else if (((HttpWebResponse)ex.Response).StatusCode == HttpStatusCode.Forbidden)
					{
						MessageBox.Show("Base URL exists (403): " + txtBaseURL.Text);					
					}
					else
					{
						MessageBox.Show("Could not verify base URL.  Response Status Code: " + 
							((HttpWebResponse)ex.Response).StatusCode.ToString());					
					}
				}
				else
				{
						MessageBox.Show("Could not verify URL.  Exception text: " + ex.ToString());
				}		
			}
		}


	}
}
