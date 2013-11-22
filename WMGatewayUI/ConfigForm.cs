using System;
using System.Drawing;
using System.Collections;
using System.ComponentModel;
using System.Windows.Forms;
using System.IO;
using System.Data;
using System.Net;

namespace UW.CSE.DISC
{
	/// <summary>
	/// The form used for general purpose configuration 
	/// that won't fit in the main form.
	/// </summary>
	public class ConfigForm : System.Windows.Forms.Form
	{

		// Profile ID (for system profiles), and path (for custom profiles).
		// We depend on the caller to set these before invoking.  If a custom
		// profile is used, ID should be zero.  If a system profile is used,
		// path should be the null string.
		private int m_id;
		private String m_path;
		public int ID
		{	
			get
			{
				return m_id;
			}
			set
			{
				m_id = value;
			}
		}

		public string Path
		{	
			get
			{
				return m_path;
			}
			set
			{
				m_path = value;
			}
		}

		
		public System.Windows.Forms.TextBox txtAddr;
		public System.Windows.Forms.TextBox txtPort;
		private System.Windows.Forms.Label lblAddr;
		private System.Windows.Forms.Label lblPort;
		private System.Windows.Forms.Button btnCancel;
		private System.Windows.Forms.Button btnOK;
		private System.Windows.Forms.Label label3;
		public System.Windows.Forms.CheckBox checkBoxArchive;
		public System.Windows.Forms.TextBox textBoxFile;
		private System.Windows.Forms.Label label6;
		private System.Windows.Forms.GroupBox groupBox1;
		private System.Windows.Forms.OpenFileDialog openFileDialog1;
		private System.Windows.Forms.Button buttonBrowse;
		public System.Windows.Forms.TextBox txtWMPort;
		public System.Windows.Forms.TextBox txtMaxConn;
		private System.Windows.Forms.Label label1;
		private System.Windows.Forms.Label label2;
		private System.Windows.Forms.GroupBox groupBox2;
		private System.Windows.Forms.ComboBox comboBoxProfile;
		private System.Windows.Forms.Label label5;
		/// <summary>
		/// Required designer variable.
		/// </summary>
		private System.ComponentModel.Container components = null;

		public ConfigForm()
		{
			//
			// Required for Windows Form Designer support
			//
			InitializeComponent();

			setArchiveControls();

			populateProfilesCombo();
		}


		/// <summary>
		/// Clean up any resources being used.
		/// </summary>
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
			this.txtAddr = new System.Windows.Forms.TextBox();
			this.txtPort = new System.Windows.Forms.TextBox();
			this.lblAddr = new System.Windows.Forms.Label();
			this.lblPort = new System.Windows.Forms.Label();
			this.btnCancel = new System.Windows.Forms.Button();
			this.btnOK = new System.Windows.Forms.Button();
			this.label3 = new System.Windows.Forms.Label();
			this.checkBoxArchive = new System.Windows.Forms.CheckBox();
			this.textBoxFile = new System.Windows.Forms.TextBox();
			this.label6 = new System.Windows.Forms.Label();
			this.groupBox1 = new System.Windows.Forms.GroupBox();
			this.buttonBrowse = new System.Windows.Forms.Button();
			this.openFileDialog1 = new System.Windows.Forms.OpenFileDialog();
			this.txtWMPort = new System.Windows.Forms.TextBox();
			this.txtMaxConn = new System.Windows.Forms.TextBox();
			this.label1 = new System.Windows.Forms.Label();
			this.label2 = new System.Windows.Forms.Label();
			this.groupBox2 = new System.Windows.Forms.GroupBox();
			this.label5 = new System.Windows.Forms.Label();
			this.comboBoxProfile = new System.Windows.Forms.ComboBox();
			this.groupBox1.SuspendLayout();
			this.groupBox2.SuspendLayout();
			this.SuspendLayout();
			// 
			// txtAddr
			// 
			this.txtAddr.Location = new System.Drawing.Point(152, 16);
			this.txtAddr.Name = "txtAddr";
			this.txtAddr.Size = new System.Drawing.Size(144, 20);
			this.txtAddr.TabIndex = 0;
			this.txtAddr.Text = "textBox1";
			// 
			// txtPort
			// 
			this.txtPort.Location = new System.Drawing.Point(352, 16);
			this.txtPort.Name = "txtPort";
			this.txtPort.Size = new System.Drawing.Size(56, 20);
			this.txtPort.TabIndex = 1;
			this.txtPort.Text = "textBox2";
			// 
			// lblAddr
			// 
			this.lblAddr.Location = new System.Drawing.Point(24, 16);
			this.lblAddr.Name = "lblAddr";
			this.lblAddr.Size = new System.Drawing.Size(128, 16);
			this.lblAddr.TabIndex = 2;
			this.lblAddr.Text = "Custom Venue Address";
			this.lblAddr.TextAlign = System.Drawing.ContentAlignment.BottomLeft;
			// 
			// lblPort
			// 
			this.lblPort.Location = new System.Drawing.Point(320, 16);
			this.lblPort.Name = "lblPort";
			this.lblPort.Size = new System.Drawing.Size(32, 16);
			this.lblPort.TabIndex = 3;
			this.lblPort.Text = "Port";
			this.lblPort.TextAlign = System.Drawing.ContentAlignment.BottomLeft;
			// 
			// btnCancel
			// 
			this.btnCancel.DialogResult = System.Windows.Forms.DialogResult.Cancel;
			this.btnCancel.Location = new System.Drawing.Point(16, 240);
			this.btnCancel.Name = "btnCancel";
			this.btnCancel.Size = new System.Drawing.Size(80, 24);
			this.btnCancel.TabIndex = 8;
			this.btnCancel.Text = "Cancel";
			this.btnCancel.Click += new System.EventHandler(this.btnCancel_click);
			// 
			// btnOK
			// 
			this.btnOK.Location = new System.Drawing.Point(368, 240);
			this.btnOK.Name = "btnOK";
			this.btnOK.Size = new System.Drawing.Size(80, 24);
			this.btnOK.TabIndex = 9;
			this.btnOK.Text = "OK";
			this.btnOK.Click += new System.EventHandler(this.btnOK_click);
			// 
			// label3
			// 
			this.label3.Location = new System.Drawing.Point(24, 58);
			this.label3.Name = "label3";
			this.label3.Size = new System.Drawing.Size(128, 16);
			this.label3.TabIndex = 8;
			this.label3.Text = "Windows Media Profile:";
			this.label3.TextAlign = System.Drawing.ContentAlignment.BottomLeft;
			// 
			// checkBoxArchive
			// 
			this.checkBoxArchive.Location = new System.Drawing.Point(32, 160);
			this.checkBoxArchive.Name = "checkBoxArchive";
			this.checkBoxArchive.Size = new System.Drawing.Size(128, 24);
			this.checkBoxArchive.TabIndex = 5;
			this.checkBoxArchive.Text = "Archive to WMV File";
			this.checkBoxArchive.CheckedChanged += new System.EventHandler(this.checkBoxArchive_CheckedChanged);
			// 
			// textBoxFile
			// 
			this.textBoxFile.Location = new System.Drawing.Point(56, 192);
			this.textBoxFile.Name = "textBoxFile";
			this.textBoxFile.Size = new System.Drawing.Size(376, 20);
			this.textBoxFile.TabIndex = 7;
			this.textBoxFile.Text = "C:\\archive.wmv";
			// 
			// label6
			// 
			this.label6.Location = new System.Drawing.Point(24, 192);
			this.label6.Name = "label6";
			this.label6.Size = new System.Drawing.Size(32, 16);
			this.label6.TabIndex = 14;
			this.label6.Text = "File:";
			this.label6.TextAlign = System.Drawing.ContentAlignment.BottomLeft;
			// 
			// groupBox1
			// 
			this.groupBox1.Controls.AddRange(new System.Windows.Forms.Control[] {
																					this.buttonBrowse});
			this.groupBox1.Location = new System.Drawing.Point(16, 144);
			this.groupBox1.Name = "groupBox1";
			this.groupBox1.Size = new System.Drawing.Size(432, 80);
			this.groupBox1.TabIndex = 15;
			this.groupBox1.TabStop = false;
			this.groupBox1.Text = "Archiving";
			// 
			// buttonBrowse
			// 
			this.buttonBrowse.Location = new System.Drawing.Point(336, 16);
			this.buttonBrowse.Name = "buttonBrowse";
			this.buttonBrowse.Size = new System.Drawing.Size(80, 24);
			this.buttonBrowse.TabIndex = 6;
			this.buttonBrowse.Text = "Browse";
			this.buttonBrowse.Click += new System.EventHandler(this.buttonBrowse_Click);
			// 
			// openFileDialog1
			// 
			this.openFileDialog1.CheckFileExists = false;
			this.openFileDialog1.DefaultExt = "wmv";
			this.openFileDialog1.Filter = "WMV files|*.wmv";
			this.openFileDialog1.Title = "Archive File";
			// 
			// txtWMPort
			// 
			this.txtWMPort.Location = new System.Drawing.Point(160, 104);
			this.txtWMPort.Name = "txtWMPort";
			this.txtWMPort.Size = new System.Drawing.Size(48, 20);
			this.txtWMPort.TabIndex = 3;
			this.txtWMPort.Text = "textBox1";
			// 
			// txtMaxConn
			// 
			this.txtMaxConn.Location = new System.Drawing.Point(400, 104);
			this.txtMaxConn.Name = "txtMaxConn";
			this.txtMaxConn.Size = new System.Drawing.Size(40, 20);
			this.txtMaxConn.TabIndex = 4;
			this.txtMaxConn.Text = "textBox1";
			// 
			// label1
			// 
			this.label1.Location = new System.Drawing.Point(48, 104);
			this.label1.Name = "label1";
			this.label1.Size = new System.Drawing.Size(112, 16);
			this.label1.TabIndex = 18;
			this.label1.Text = "Windows Media Port";
			this.label1.TextAlign = System.Drawing.ContentAlignment.BottomLeft;
			// 
			// label2
			// 
			this.label2.Location = new System.Drawing.Point(248, 104);
			this.label2.Name = "label2";
			this.label2.Size = new System.Drawing.Size(152, 16);
			this.label2.TabIndex = 19;
			this.label2.Text = "Maximum Client Connections";
			this.label2.TextAlign = System.Drawing.ContentAlignment.BottomLeft;
			// 
			// groupBox2
			// 
			this.groupBox2.Controls.AddRange(new System.Windows.Forms.Control[] {
																					this.label5,
																					this.comboBoxProfile});
			this.groupBox2.Location = new System.Drawing.Point(16, 40);
			this.groupBox2.Name = "groupBox2";
			this.groupBox2.Size = new System.Drawing.Size(432, 96);
			this.groupBox2.TabIndex = 20;
			this.groupBox2.TabStop = false;
			this.groupBox2.Text = "Windows Media Configuration";
			// 
			// label5
			// 
			this.label5.Location = new System.Drawing.Point(72, 40);
			this.label5.Name = "label5";
			this.label5.Size = new System.Drawing.Size(344, 16);
			this.label5.TabIndex = 1;
			this.label5.Text = "Note: Presenter Integration requires a profile with a script stream.";
			// 
			// comboBoxProfile
			// 
			this.comboBoxProfile.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
			this.comboBoxProfile.Location = new System.Drawing.Point(136, 16);
			this.comboBoxProfile.Name = "comboBoxProfile";
			this.comboBoxProfile.Size = new System.Drawing.Size(288, 21);
			this.comboBoxProfile.TabIndex = 0;
			this.comboBoxProfile.SelectedIndexChanged += new System.EventHandler(this.comboBoxProfile_SelectedIndexChanged);
			// 
			// ConfigForm
			// 
			this.AutoScaleBaseSize = new System.Drawing.Size(5, 13);
			this.ClientSize = new System.Drawing.Size(466, 280);
			this.Controls.AddRange(new System.Windows.Forms.Control[] {
																		  this.label2,
																		  this.label1,
																		  this.txtMaxConn,
																		  this.txtWMPort,
																		  this.label6,
																		  this.textBoxFile,
																		  this.checkBoxArchive,
																		  this.label3,
																		  this.btnOK,
																		  this.btnCancel,
																		  this.lblPort,
																		  this.lblAddr,
																		  this.txtPort,
																		  this.txtAddr,
																		  this.groupBox1,
																		  this.groupBox2});
			this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedDialog;
			this.MaximizeBox = false;
			this.MinimizeBox = false;
			this.Name = "ConfigForm";
			this.Text = "Windows Media Gateway Configuration";
			this.groupBox1.ResumeLayout(false);
			this.groupBox2.ResumeLayout(false);
			this.ResumeLayout(false);

		}
		#endregion

		private void btnOK_click(object sender, System.EventArgs e)
		{
			//validate:
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
			
			try
			{
				port = Convert.ToUInt32(txtWMPort.Text);
			}
			catch
			{
				MessageBox.Show ("Invalid Windows Media port.");
				return;
			}
			if ((port > IPEndPoint.MaxPort) ||
				(port < IPEndPoint.MinPort))
			{
				MessageBox.Show("Windows Media port out of range.");
				return;
			}

			try
			{
				port = Convert.ToUInt32(txtMaxConn.Text);
			}
			catch
			{
				MessageBox.Show ("Invalid maximum connections.");
				return;
			}

			this.DialogResult = DialogResult.OK;
		}

		
		private void btnCancel_click(object sender, System.EventArgs e)
		{
			
		}

		
		private void buttonBrowse_Click(object sender, System.EventArgs e)
		{
			if (DialogResult.OK == openFileDialog1.ShowDialog())
			{
				textBoxFile.Text = openFileDialog1.FileName;
			}
		}

		
		private void checkBoxArchive_CheckedChanged(object sender, System.EventArgs e)
		{
			setArchiveControls();
		}

		
		private void setArchiveControls()
		{
			if (checkBoxArchive.Checked) 
			{
				buttonBrowse.Enabled = true;
				textBoxFile.Enabled = true;
			} 
			else
			{
				buttonBrowse.Enabled = false;
				textBoxFile.Enabled = false;
			}
		}


		private void populateProfilesCombo()
		{
			//Hard-wire some of the basic system profiles:
			comboBoxProfile.Items.Add(new ProfileItem("256 Kbps Audio and Video (System Profile)","",9));
			comboBoxProfile.Items.Add(new ProfileItem("384 Kbps Audio and Video (System Profile)","",10));
			comboBoxProfile.Items.Add(new ProfileItem("768 Kbps Audio and Video (System Profile)","",11));
			
			// Add the custom profiles found in prx files in the application directory:
			string appPath = Application.ExecutablePath;
			appPath=appPath.Substring(0,appPath.LastIndexOf("\\"));
			string filter = "*.prx";
			string[] prxFiles = System.IO.Directory.GetFileSystemEntries(appPath, filter);
			DataSet ds = new DataSet();
			string pname;
			for (int i =0;i<prxFiles.Length;i++)
			{	
				try 
				{
					ds.Clear();
					ds.ReadXml(prxFiles[i]);
					// By ReadXml's inference rules, the following should get
					// the profile name from xml such as:
					//   <profile ... name="Profile Name" ... > ... </profile>
					pname = (string) ds.Tables["profile"].Rows[0]["name"];
				} 
				catch 
				{
					continue;
				}
				comboBoxProfile.Items.Add(new ProfileItem(pname  + " (Custom Profile)",prxFiles[i],0));
			}

		}


		// Discover which profile should be initially selected.
		// This obviously needs to happen after the caller has set the path and ID properties.
		public void SetDefaultProfile()
		{
			int i = 0;
			foreach (ProfileItem pi in comboBoxProfile.Items)
			{
				if ((m_id != 0) && (pi.ID == m_id)) 
				{
					break;
				}
				if ((m_path != "") && (pi.Path == m_path))
				{
					break;
				}
				i++;
			}
			if (i < comboBoxProfile.Items.Count)
			{
				comboBoxProfile.SelectedIndex = i;
			} 
			else  //Didn't find a default, so use zero.
			{
				comboBoxProfile.SelectedIndex = 0;
			}
		}

		
		private void comboBoxProfile_SelectedIndexChanged(object sender, System.EventArgs e)
		{
			ProfileItem pi = (ProfileItem) comboBoxProfile.SelectedItem;
			m_id = pi.ID;
			m_path = pi.Path;
		}

	
	}
	// Just a way to encapsulate some basic facts about the profiles in
	// the combo box.  ID is the profile ID used by Windows media for the 
	// built-in profiles.  Path is a path to a prx file for custom profiles.
	public class ProfileItem 
	{
		private int m_id;
		private String m_name;
		private String m_path;
		
		public int ID
		{	
			get
			{
				return m_id;
			}
			set
			{
				m_id = value;
			}
		}

		public string Path
		{	
			get
			{
				return m_path;
			}
			set
			{
				m_path = value;
			}
		}


		public ProfileItem(String name, String path, int id)
		{
			m_id = id;
			m_name = name;
			m_path = path;
		}

		// the override is necessary to make the comboBox show the string we want.
		public override string ToString()
		{
			return m_name;
		}

	}
}
