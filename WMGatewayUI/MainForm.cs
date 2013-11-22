using System;
using System.Drawing;
using System.ComponentModel;
using System.Windows.Forms;
using System.Data;
using Microsoft.Win32;
using System.Collections;
using System.Diagnostics;
using System.Threading;
using UW.CSE.DISC.net.pnw_gigapop.confxp.venues;
//using UW.CSE.DISC.edu.washington.cs.disc1;

namespace UW.CSE.DISC
{
	/// <summary>
	/// The main form for the Windows Media Gateway application.
	/// </summary>
	
	public class MainForm : System.Windows.Forms.Form
	{
		#region Declarations
		private WMGateway wmg;
		private bool running;
		private bool ExitAfterStop;
		private uint MAX_AUDIO_STREAMS = 10;
		private bool ignoreACLBIndexChange = false;
		private bool ignoreVCLBIndexChange = false;
		private object aclbItemChanged = null;
		private bool aclbItemOldState = false;
		private object vclbItemAdded = null;
		private object vclbItemRemoved = null;
        private int previousVenuesCBIndex = -1;
        private int previousPVenuesCBIndex = -1;

		#endregion

		#region Forms designer declarations

		private	System.Windows.Forms.Button btnStart;
		private	System.Windows.Forms.Label lblStatus;
		private	System.Windows.Forms.Button btnConfig;
		private	System.Windows.Forms.Label lblConfig;
		private System.Windows.Forms.Label label1;
		private System.Windows.Forms.Button btnfind_ssrcs;
		public System.Windows.Forms.TextBox txtDiagnostics;
		private System.Windows.Forms.Label label2;
		public System.Windows.Forms.CheckedListBox clbASSRC;
		public System.Windows.Forms.CheckedListBox clbVSSRC;
		private System.Windows.Forms.Label label3;
		private System.Windows.Forms.CheckBox checkMute;
		private System.Windows.Forms.ComboBox comboBoxVenues;
		private System.Windows.Forms.GroupBox groupBox1;
		private System.Windows.Forms.ComboBox comboBoxPVenues;
		private System.Windows.Forms.Label lblPresenterStatus;
		private System.Windows.Forms.CheckBox checkPresenter;
		private System.Windows.Forms.TextBox textBox1;
		private System.Windows.Forms.Label label6;
		private System.Windows.Forms.GroupBox groupBox2;
		private System.Windows.Forms.Button btnConfigPVenue;
		private System.Windows.Forms.Label lblChooseVenue;
		private System.Windows.Forms.Label lblChoosePVenue;
		private System.Windows.Forms.Label lblPOnLineStatus;
		private System.Windows.Forms.Button buttonTest;
		private System.Windows.Forms.MainMenu mainMenu1;
		private System.Windows.Forms.MenuItem menuItem1;
		private System.Windows.Forms.MenuItem menuItem2;
		private System.Windows.Forms.MenuItem menuItem3;
		private System.Windows.Forms.MenuItem menuItem4;
		private System.Windows.Forms.Label lblLoggingStatus;
		private System.Windows.Forms.CheckBox checkShowVid;
		private System.Windows.Forms.Button btnSelectSSRC;
		private System.Windows.Forms.Label label4;
		private System.Windows.Forms.Label lblScriptCount;
		private System.Windows.Forms.MenuItem menuItem5;
		private System.Windows.Forms.MenuItem menuItem6;
        private MenuItem menuItemDiagnostics;
		private System.ComponentModel.IContainer components;
		#endregion

		#region Installation
		private static void Install()
		{

			bool installed = false;

			// Get the installed state out of the registry -- if we're already installed, 
			// we don't have to reinstall
			// The installer project creates the WMGatewayInstalled string value with value False.
			// This way the uninstall will clean up the registry entry.  For now we are not unregistering
			// any shared components on uninstall.
			RegistryKey pcaKey = Registry.LocalMachine.OpenSubKey("SOFTWARE\\UWCSE\\WMGATEWAY");
			if (pcaKey != null)
			{
				object o = pcaKey.GetValue("WMGatewayInstalled");
				if (o != null)
				{
					installed = Convert.ToBoolean(o);
				}
			}

			if (installed == false)
			{
				// Install myself
				IDictionary state = new Hashtable();
				state.Clear();
				Installation inst = new Installation();
				try 
				{
					inst.Install(state);
					inst.Commit(state);
				}
				catch (Exception e){
					MessageBox.Show("Installation failure: " + e.ToString());
				}
			}

		}
		#endregion

		#region Constructor and Dispose

		public MainForm()
		{
			Install();
			InitializeComponent();
		}



		/// <summary>
		/// Do most of the startup tasks after the Window handle has been created.
		/// </summary>
		/// <param name="ea"></param>
		/// Threads in various application objects cause various invokes on the thread
		/// owning the window handle.  These can cause exceptions if invokes occur before
		/// the handle exists.  To work around, delay creating these objects until then.
		/// This also seems to cause the application window to pop up more quickly.
		protected override void OnHandleCreated( EventArgs ea)
		{
			//Debug.WriteLine("OnHandleCreated");

			WMGateway.OnStreamAddRemove += new WMGateway.streamAddRemoveHandler(StreamAddRemove);
			wmg = new WMGateway(this);
			wmg.OnStartCompleted += new WMGateway.startCompletedHandler(StartCompletedHandler);
			wmg.OnStopCompleted += new WMGateway.stopCompletedHandler(StopCompletedHandler);
			wmg.OnChangeVideoCompleted += new WMGateway.changeVideoCompletedHandler(ChangeVideoCompletedHandler);
			wmg.OnAddRemoveAudioCompleted += new WMGateway.addRemoveAudioCompletedHandler(AddRemoveAudioCompletedHandler);
			wmg.OnPresenterFrameCountUpdate += new WMGateway.presenterFrameCountUpdateHandler(FrameCountUpdateHandler);
			wmg.OnPresenterSourceUpdate += new WMGateway.presenterSourceUpdateHandler(SourceUpdateHandler);

			FillVenueCombos();

            if (wmg.DiagnosticServiceUri != null) {
                menuItemDiagnostics.Enabled = true;
            }

			lblConfig.Text = "Selected Venue: " + wmg.ConfVenue.ToAddrPort();
			if (wmg.ReflectorEnabled)
				lblConfig.Text += " (Reflector enabled)";

			lblStatus.Text = "Status: Stopped";

			checkShowVid.Checked = wmg.VideoVisible;
			checkMute.Checked = wmg.AudioMuted;

			SetInitialPresenterState(wmg.PresenterEnabled);

			running = false;
			ExitAfterStop = false;

			base.OnHandleCreated(ea);
		}		
		
		
		/// <summary>
		/// Clean up any resources being used.
		/// </summary>
		protected override void Dispose( bool disposing )
		{
			this.Cursor = Cursors.WaitCursor;
			
			//wmg stops encoding if necessary.
			wmg.Dispose(); 
			wmg = null;

			if( disposing )
			{
				if (components != null) 
				{
					components.Dispose();
				}
			}

			base.Dispose( disposing );
		}


		#endregion

		#region Windows Form Designer generated code
		/// <summary>
		/// Required method for Designer support - do not modify
		/// the contents of this method with the code editor.
		/// </summary>
		private void InitializeComponent()
		{
            this.components = new System.ComponentModel.Container();
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(MainForm));
            this.btnStart = new System.Windows.Forms.Button();
            this.lblStatus = new System.Windows.Forms.Label();
            this.btnConfig = new System.Windows.Forms.Button();
            this.lblConfig = new System.Windows.Forms.Label();
            this.clbASSRC = new System.Windows.Forms.CheckedListBox();
            this.label1 = new System.Windows.Forms.Label();
            this.btnfind_ssrcs = new System.Windows.Forms.Button();
            this.txtDiagnostics = new System.Windows.Forms.TextBox();
            this.label2 = new System.Windows.Forms.Label();
            this.clbVSSRC = new System.Windows.Forms.CheckedListBox();
            this.label3 = new System.Windows.Forms.Label();
            this.checkMute = new System.Windows.Forms.CheckBox();
            this.comboBoxVenues = new System.Windows.Forms.ComboBox();
            this.lblChooseVenue = new System.Windows.Forms.Label();
            this.groupBox1 = new System.Windows.Forms.GroupBox();
            this.lblScriptCount = new System.Windows.Forms.Label();
            this.label4 = new System.Windows.Forms.Label();
            this.btnSelectSSRC = new System.Windows.Forms.Button();
            this.lblLoggingStatus = new System.Windows.Forms.Label();
            this.lblPOnLineStatus = new System.Windows.Forms.Label();
            this.btnConfigPVenue = new System.Windows.Forms.Button();
            this.checkPresenter = new System.Windows.Forms.CheckBox();
            this.lblPresenterStatus = new System.Windows.Forms.Label();
            this.comboBoxPVenues = new System.Windows.Forms.ComboBox();
            this.lblChoosePVenue = new System.Windows.Forms.Label();
            this.textBox1 = new System.Windows.Forms.TextBox();
            this.label6 = new System.Windows.Forms.Label();
            this.groupBox2 = new System.Windows.Forms.GroupBox();
            this.buttonTest = new System.Windows.Forms.Button();
            this.mainMenu1 = new System.Windows.Forms.MainMenu(this.components);
            this.menuItem1 = new System.Windows.Forms.MenuItem();
            this.menuItem4 = new System.Windows.Forms.MenuItem();
            this.menuItem5 = new System.Windows.Forms.MenuItem();
            this.menuItem6 = new System.Windows.Forms.MenuItem();
            this.menuItem2 = new System.Windows.Forms.MenuItem();
            this.menuItemDiagnostics = new System.Windows.Forms.MenuItem();
            this.menuItem3 = new System.Windows.Forms.MenuItem();
            this.checkShowVid = new System.Windows.Forms.CheckBox();
            this.groupBox1.SuspendLayout();
            this.groupBox2.SuspendLayout();
            this.SuspendLayout();
            // 
            // btnStart
            // 
            this.btnStart.Location = new System.Drawing.Point(296, 8);
            this.btnStart.Name = "btnStart";
            this.btnStart.Size = new System.Drawing.Size(104, 24);
            this.btnStart.TabIndex = 0;
            this.btnStart.Text = "Start Encoding";
            this.btnStart.Click += new System.EventHandler(this.btnStart_click);
            // 
            // lblStatus
            // 
            this.lblStatus.Location = new System.Drawing.Point(16, 16);
            this.lblStatus.Name = "lblStatus";
            this.lblStatus.Size = new System.Drawing.Size(256, 16);
            this.lblStatus.TabIndex = 2;
            this.lblStatus.Text = "Status: undefined";
            // 
            // btnConfig
            // 
            this.btnConfig.Location = new System.Drawing.Point(424, 19);
            this.btnConfig.Name = "btnConfig";
            this.btnConfig.Size = new System.Drawing.Size(64, 24);
            this.btnConfig.TabIndex = 3;
            this.btnConfig.Text = "Configure";
            this.btnConfig.Click += new System.EventHandler(this.btnConfig_click);
            // 
            // lblConfig
            // 
            this.lblConfig.Location = new System.Drawing.Point(136, 60);
            this.lblConfig.Name = "lblConfig";
            this.lblConfig.Size = new System.Drawing.Size(344, 16);
            this.lblConfig.TabIndex = 4;
            this.lblConfig.Text = "No Config";
            // 
            // clbASSRC
            // 
            this.clbASSRC.CheckOnClick = true;
            this.clbASSRC.HorizontalScrollbar = true;
            this.clbASSRC.Location = new System.Drawing.Point(24, 160);
            this.clbASSRC.Name = "clbASSRC";
            this.clbASSRC.Size = new System.Drawing.Size(232, 109);
            this.clbASSRC.TabIndex = 5;
            this.clbASSRC.SelectedIndexChanged += new System.EventHandler(this.clbASSRC_SelectedIndexChanged);
            this.clbASSRC.DoubleClick += new System.EventHandler(this.clbASSRC_DoubleClick);
            // 
            // label1
            // 
            this.label1.Location = new System.Drawing.Point(32, 144);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(216, 16);
            this.label1.TabIndex = 6;
            this.label1.Text = "Select at least one audio source:";
            // 
            // btnfind_ssrcs
            // 
            this.btnfind_ssrcs.Location = new System.Drawing.Point(16, 56);
            this.btnfind_ssrcs.Name = "btnfind_ssrcs";
            this.btnfind_ssrcs.Size = new System.Drawing.Size(96, 24);
            this.btnfind_ssrcs.TabIndex = 7;
            this.btnfind_ssrcs.Text = "Refresh Sources";
            this.btnfind_ssrcs.Click += new System.EventHandler(this.btnfind_ssrcs_Click);
            // 
            // txtDiagnostics
            // 
            this.txtDiagnostics.Location = new System.Drawing.Point(16, 400);
            this.txtDiagnostics.Multiline = true;
            this.txtDiagnostics.Name = "txtDiagnostics";
            this.txtDiagnostics.ReadOnly = true;
            this.txtDiagnostics.ScrollBars = System.Windows.Forms.ScrollBars.Vertical;
            this.txtDiagnostics.Size = new System.Drawing.Size(496, 160);
            this.txtDiagnostics.TabIndex = 8;
            this.txtDiagnostics.Text = "textBox1";
            this.txtDiagnostics.WordWrap = false;
            // 
            // label2
            // 
            this.label2.Location = new System.Drawing.Point(16, 384);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(216, 16);
            this.label2.TabIndex = 9;
            this.label2.Text = "Log:";
            // 
            // clbVSSRC
            // 
            this.clbVSSRC.CheckOnClick = true;
            this.clbVSSRC.HorizontalScrollbar = true;
            this.clbVSSRC.Location = new System.Drawing.Point(272, 160);
            this.clbVSSRC.Name = "clbVSSRC";
            this.clbVSSRC.Size = new System.Drawing.Size(232, 109);
            this.clbVSSRC.TabIndex = 6;
            this.clbVSSRC.SelectedIndexChanged += new System.EventHandler(this.clbVSSRC_SelectedIndexChanged);
            this.clbVSSRC.DoubleClick += new System.EventHandler(this.clbVSSRC_DoubleClick);
            // 
            // label3
            // 
            this.label3.Location = new System.Drawing.Point(280, 144);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(216, 16);
            this.label3.TabIndex = 11;
            this.label3.Text = "Select one video source:";
            // 
            // checkMute
            // 
            this.checkMute.CheckAlign = System.Drawing.ContentAlignment.MiddleRight;
            this.checkMute.Checked = true;
            this.checkMute.CheckState = System.Windows.Forms.CheckState.Checked;
            this.checkMute.Location = new System.Drawing.Point(400, 40);
            this.checkMute.Name = "checkMute";
            this.checkMute.Size = new System.Drawing.Size(112, 16);
            this.checkMute.TabIndex = 12;
            this.checkMute.Text = "Mute Local Audio:";
            this.checkMute.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            this.checkMute.CheckedChanged += new System.EventHandler(this.checkMute_CheckedChanged);
            // 
            // comboBoxVenues
            // 
            this.comboBoxVenues.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.comboBoxVenues.Location = new System.Drawing.Point(168, 21);
            this.comboBoxVenues.Name = "comboBoxVenues";
            this.comboBoxVenues.Size = new System.Drawing.Size(248, 21);
            this.comboBoxVenues.TabIndex = 14;
            this.comboBoxVenues.SelectedIndexChanged += new System.EventHandler(this.comboBoxVenues_SelectedIndexChanged);
            // 
            // lblChooseVenue
            // 
            this.lblChooseVenue.Location = new System.Drawing.Point(24, 80);
            this.lblChooseVenue.Name = "lblChooseVenue";
            this.lblChooseVenue.Size = new System.Drawing.Size(160, 16);
            this.lblChooseVenue.TabIndex = 15;
            this.lblChooseVenue.Text = "Choose Conferencing Venue:";
            this.lblChooseVenue.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            // 
            // groupBox1
            // 
            this.groupBox1.Controls.Add(this.lblScriptCount);
            this.groupBox1.Controls.Add(this.label4);
            this.groupBox1.Controls.Add(this.btnSelectSSRC);
            this.groupBox1.Controls.Add(this.lblLoggingStatus);
            this.groupBox1.Controls.Add(this.lblPOnLineStatus);
            this.groupBox1.Controls.Add(this.btnConfigPVenue);
            this.groupBox1.Controls.Add(this.checkPresenter);
            this.groupBox1.Controls.Add(this.lblPresenterStatus);
            this.groupBox1.Controls.Add(this.comboBoxPVenues);
            this.groupBox1.Controls.Add(this.lblChoosePVenue);
            this.groupBox1.Location = new System.Drawing.Point(16, 288);
            this.groupBox1.Name = "groupBox1";
            this.groupBox1.Size = new System.Drawing.Size(496, 88);
            this.groupBox1.TabIndex = 16;
            this.groupBox1.TabStop = false;
            this.groupBox1.Text = "PowerPoint Presenter Integration";
            // 
            // lblScriptCount
            // 
            this.lblScriptCount.Location = new System.Drawing.Point(440, 67);
            this.lblScriptCount.Name = "lblScriptCount";
            this.lblScriptCount.Size = new System.Drawing.Size(48, 16);
            this.lblScriptCount.TabIndex = 10;
            this.lblScriptCount.Text = "0";
            // 
            // label4
            // 
            this.label4.Location = new System.Drawing.Point(384, 67);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(48, 16);
            this.label4.TabIndex = 9;
            this.label4.Text = "Packets:";
            // 
            // btnSelectSSRC
            // 
            this.btnSelectSSRC.Location = new System.Drawing.Point(402, 39);
            this.btnSelectSSRC.Name = "btnSelectSSRC";
            this.btnSelectSSRC.Size = new System.Drawing.Size(88, 24);
            this.btnSelectSSRC.TabIndex = 7;
            this.btnSelectSSRC.Text = "Select Source";
            this.btnSelectSSRC.Click += new System.EventHandler(this.btnSelectSSRC_Click);
            // 
            // lblLoggingStatus
            // 
            this.lblLoggingStatus.Location = new System.Drawing.Point(176, 17);
            this.lblLoggingStatus.Name = "lblLoggingStatus";
            this.lblLoggingStatus.Size = new System.Drawing.Size(240, 16);
            this.lblLoggingStatus.TabIndex = 6;
            this.lblLoggingStatus.Text = "Logging: None";
            // 
            // lblPOnLineStatus
            // 
            this.lblPOnLineStatus.Location = new System.Drawing.Point(232, 67);
            this.lblPOnLineStatus.Name = "lblPOnLineStatus";
            this.lblPOnLineStatus.Size = new System.Drawing.Size(144, 16);
            this.lblPOnLineStatus.TabIndex = 5;
            this.lblPOnLineStatus.Text = "No active presenter status.";
            // 
            // btnConfigPVenue
            // 
            this.btnConfigPVenue.Location = new System.Drawing.Point(426, 10);
            this.btnConfigPVenue.Name = "btnConfigPVenue";
            this.btnConfigPVenue.Size = new System.Drawing.Size(64, 24);
            this.btnConfigPVenue.TabIndex = 4;
            this.btnConfigPVenue.Text = "Configure";
            this.btnConfigPVenue.Click += new System.EventHandler(this.btnConfigPVenue_Click);
            // 
            // checkPresenter
            // 
            this.checkPresenter.CheckAlign = System.Drawing.ContentAlignment.MiddleRight;
            this.checkPresenter.Location = new System.Drawing.Point(8, 17);
            this.checkPresenter.Name = "checkPresenter";
            this.checkPresenter.Size = new System.Drawing.Size(152, 16);
            this.checkPresenter.TabIndex = 3;
            this.checkPresenter.Text = "Use Presenter Integration";
            this.checkPresenter.CheckedChanged += new System.EventHandler(this.checkPresenter_CheckedChanged);
            // 
            // lblPresenterStatus
            // 
            this.lblPresenterStatus.Location = new System.Drawing.Point(8, 67);
            this.lblPresenterStatus.Name = "lblPresenterStatus";
            this.lblPresenterStatus.Size = new System.Drawing.Size(216, 16);
            this.lblPresenterStatus.TabIndex = 2;
            this.lblPresenterStatus.Text = "No Status";
            // 
            // comboBoxPVenues
            // 
            this.comboBoxPVenues.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.comboBoxPVenues.Location = new System.Drawing.Point(144, 40);
            this.comboBoxPVenues.Name = "comboBoxPVenues";
            this.comboBoxPVenues.Size = new System.Drawing.Size(256, 21);
            this.comboBoxPVenues.TabIndex = 1;
            this.comboBoxPVenues.SelectedIndexChanged += new System.EventHandler(this.comboBoxPVenues_SelectedIndexChanged);
            // 
            // lblChoosePVenue
            // 
            this.lblChoosePVenue.Location = new System.Drawing.Point(8, 43);
            this.lblChoosePVenue.Name = "lblChoosePVenue";
            this.lblChoosePVenue.Size = new System.Drawing.Size(136, 16);
            this.lblChoosePVenue.TabIndex = 0;
            this.lblChoosePVenue.Text = "Choose Presenter Venue:";
            // 
            // textBox1
            // 
            this.textBox1.Location = new System.Drawing.Point(16, 400);
            this.textBox1.Multiline = true;
            this.textBox1.Name = "textBox1";
            this.textBox1.ReadOnly = true;
            this.textBox1.ScrollBars = System.Windows.Forms.ScrollBars.Vertical;
            this.textBox1.Size = new System.Drawing.Size(496, 136);
            this.textBox1.TabIndex = 8;
            this.textBox1.Text = "textBox1";
            this.textBox1.WordWrap = false;
            // 
            // label6
            // 
            this.label6.Location = new System.Drawing.Point(24, 360);
            this.label6.Name = "label6";
            this.label6.Size = new System.Drawing.Size(216, 16);
            this.label6.TabIndex = 9;
            this.label6.Text = "Log:";
            // 
            // groupBox2
            // 
            this.groupBox2.Controls.Add(this.comboBoxVenues);
            this.groupBox2.Controls.Add(this.btnConfig);
            this.groupBox2.Controls.Add(this.btnfind_ssrcs);
            this.groupBox2.Controls.Add(this.lblConfig);
            this.groupBox2.Location = new System.Drawing.Point(16, 56);
            this.groupBox2.Name = "groupBox2";
            this.groupBox2.Size = new System.Drawing.Size(496, 224);
            this.groupBox2.TabIndex = 17;
            this.groupBox2.TabStop = false;
            this.groupBox2.Text = "Audio and Video Conference";
            // 
            // buttonTest
            // 
            this.buttonTest.Location = new System.Drawing.Point(416, 8);
            this.buttonTest.Name = "buttonTest";
            this.buttonTest.Size = new System.Drawing.Size(104, 24);
            this.buttonTest.TabIndex = 18;
            this.buttonTest.Text = "Encode Statistics";
            this.buttonTest.Click += new System.EventHandler(this.buttonEncodeStatistics_Click);
            // 
            // mainMenu1
            // 
            this.mainMenu1.MenuItems.AddRange(new System.Windows.Forms.MenuItem[] {
            this.menuItem1,
            this.menuItem5,
            this.menuItem2});
            // 
            // menuItem1
            // 
            this.menuItem1.Index = 0;
            this.menuItem1.MenuItems.AddRange(new System.Windows.Forms.MenuItem[] {
            this.menuItem4});
            this.menuItem1.Text = "File";
            // 
            // menuItem4
            // 
            this.menuItem4.Index = 0;
            this.menuItem4.Text = "Exit";
            this.menuItem4.Click += new System.EventHandler(this.menuItem4_Click);
            // 
            // menuItem5
            // 
            this.menuItem5.Index = 1;
            this.menuItem5.MenuItems.AddRange(new System.Windows.Forms.MenuItem[] {
            this.menuItem6});
            this.menuItem5.Text = "Options";
            // 
            // menuItem6
            // 
            this.menuItem6.Index = 0;
            this.menuItem6.Text = "Reflector...";
            this.menuItem6.Click += new System.EventHandler(this.menuItem6_Click);
            // 
            // menuItem2
            // 
            this.menuItem2.Index = 2;
            this.menuItem2.MenuItems.AddRange(new System.Windows.Forms.MenuItem[] {
            this.menuItemDiagnostics,
            this.menuItem3});
            this.menuItem2.Text = "Help";
            // 
            // menuItemDiagnostics
            // 
            this.menuItemDiagnostics.Enabled = false;
            this.menuItemDiagnostics.Index = 0;
            this.menuItemDiagnostics.Text = "Show Conference Diagnostics ...";
            this.menuItemDiagnostics.Click += new System.EventHandler(this.menuItemDiagnostics_Click);
            // 
            // menuItem3
            // 
            this.menuItem3.Index = 1;
            this.menuItem3.Text = "About";
            this.menuItem3.Click += new System.EventHandler(this.menuItem3_Click);
            // 
            // checkShowVid
            // 
            this.checkShowVid.CheckAlign = System.Drawing.ContentAlignment.MiddleRight;
            this.checkShowVid.Location = new System.Drawing.Point(184, 40);
            this.checkShowVid.Name = "checkShowVid";
            this.checkShowVid.Size = new System.Drawing.Size(208, 16);
            this.checkShowVid.TabIndex = 19;
            this.checkShowVid.Text = "Show Video Preview when Encoding:";
            this.checkShowVid.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            this.checkShowVid.CheckedChanged += new System.EventHandler(this.checkShowVid_CheckedChanged);
            // 
            // MainForm
            // 
            this.AutoScaleBaseSize = new System.Drawing.Size(5, 13);
            this.ClientSize = new System.Drawing.Size(528, 572);
            this.Controls.Add(this.checkShowVid);
            this.Controls.Add(this.buttonTest);
            this.Controls.Add(this.groupBox1);
            this.Controls.Add(this.checkMute);
            this.Controls.Add(this.txtDiagnostics);
            this.Controls.Add(this.textBox1);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.clbVSSRC);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.clbASSRC);
            this.Controls.Add(this.btnStart);
            this.Controls.Add(this.label6);
            this.Controls.Add(this.lblChooseVenue);
            this.Controls.Add(this.groupBox2);
            this.Controls.Add(this.lblStatus);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.Fixed3D;
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.MaximizeBox = false;
            this.Menu = this.mainMenu1;
            this.Name = "MainForm";
            this.Text = "ConferenceXP to Windows Media Gateway";
            this.groupBox1.ResumeLayout(false);
            this.groupBox2.ResumeLayout(false);
            this.ResumeLayout(false);
            this.PerformLayout();

		}
		#endregion

		#region Main
		/// <summary>
		/// The main entry point for the application.
		/// </summary>
		[STAThread]
		static void Main() 
		{	
			UnhandledExceptionHandler.Register();
			Application.Run(new MainForm());
		}


		#endregion

		#region UI Buttons and check boxes

		/// <summary>
		/// Encode statistics button.  Just give the operator a way to show some current status.
		/// </summary>
		/// <param name="sender"></param>
		/// <param name="e"></param>
		private void buttonEncodeStatistics_Click(object sender, System.EventArgs e)
		{
			wmg.GetEncodeStatus();
		}

		/// <summary>
		/// Start/stop encoding
		/// </summary>
		/// <param name="sender"></param>
		/// <param name="e"></param>
		private void btnStart_click(object sender, System.EventArgs e)
		{
			if (running) 
			{
				this.Cursor = Cursors.WaitCursor;
				btnStart.Text = "Stopping..";
				lblStatus.Text = "Status: Stopping..";
				btnStart.Enabled = false;
				btnfind_ssrcs.Enabled = false;
				clbASSRC.Enabled = false;
				clbVSSRC.Enabled = false;
				wmg.AsyncStop();
			} 
			else 
			{
				//Toggle UI controls to disable, change status/button text.
				toggleControls(false);
				this.Cursor = Cursors.WaitCursor;
				lblStatus.Text = "Status: Encoder Starting..";
				btnStart.Enabled = false;
				btnfind_ssrcs.Enabled = false;

				ArrayList selectedAudioCnames = GetSelectedAudioCnames();
				ArrayList selectedVideoCname = GetSelectedVideoCname();
				if ((selectedAudioCnames!=null) && (selectedVideoCname!=null))
				{
					if (!wmg.AsyncStart(selectedAudioCnames,selectedVideoCname))
						MessageBox.Show("One or more of the selected streams were not found.  Please refresh and try again.");
					else
						return;
				}
				else
				{
					MessageBox.Show("Please select one video source, and at least one but no more than " 
						+ Convert.ToString(MAX_AUDIO_STREAMS) + " audio sources.");
				}
				toggleControls(true);
				this.Cursor = Cursors.Default;
				lblStatus.Text = "Status: Stopped";
				btnStart.Enabled = true;
				btnfind_ssrcs.Enabled = true;
			}

		}

		/// <summary>
		/// Update running count of Presenter frames received.
		/// </summary>
		private delegate void FrameCountUpdateDelegate(NumericEventArgs ea);
		private void FrameCountUpdateHandler(NumericEventArgs ea)
		{
			try
			{
				this.Invoke(new FrameCountUpdateDelegate(FrameCountUpdate),new object[] {ea});
			}
			catch (Exception e)
			{
				Debug.WriteLine("MainForm.FrameCountUpdateHandler couldn't invoke: " + e.ToString());
			}
		}
	
		private void FrameCountUpdate(NumericEventArgs ea)
		{
			lblScriptCount.Text = ea.N.ToString();
		}

		/// <summary>
		/// Update count of presenter nodes on-line.
		/// </summary>
		private delegate void SourceUpdateDelegate(NumericEventArgs ea);
		private void SourceUpdateHandler(NumericEventArgs ea)
		{
			try
			{
				this.Invoke(new SourceUpdateDelegate(SourceUpdate),new object[] {ea});
			}
			catch (Exception e)
			{
				Debug.WriteLine("MainForm.SourceUpdateHandler couldn't invoke: " + e.ToString());
			}
	
		}

		private void SourceUpdate(NumericEventArgs ea)
		{
			lblPOnLineStatus.Text = "Active Presenters on-line: " + ea.N.ToString();
		}


		/// <summary>
		/// Callback when start encoding is finished.
		/// </summary>
		private delegate void StartCompletedDelegate();
		private void StartCompletedHandler()
		{				
			try
			{
				this.Invoke(new StartCompletedDelegate(StartCompleted));
			}
			catch (Exception e)
			{
				Debug.WriteLine("MainForm.StartCompletedHandler couldn't invoke: " + e.ToString());
			}
		}

		private void StartCompleted()
		{
			if (wmg.Running)
			{
				if (wmg.Archiving)
					lblStatus.Text = "Status: Encoding and Archiving";
				else
					lblStatus.Text = "Status: Encoding";
				btnStart.Text = "Stop Encoding";
				btnStart.Enabled = true;
				btnfind_ssrcs.Enabled = true;
				running = true;

				//Leave enabled to permit changing sources while encoding.
				clbASSRC.Enabled = true;
				clbVSSRC.Enabled = true;
				
				this.Cursor = Cursors.Default;

			}
			else //start failed.
			{
				toggleControls(true);
				lblStatus.Text = "Status: Stopped";
				btnStart.Enabled = true;
				btnfind_ssrcs.Enabled = true;			
				this.Cursor = Cursors.Default;
				MessageBox.Show("Encoding failed to start: " + wmg.ErrorMsg);
			}
		}


		/// <summary>
		/// Callback when stop encoding is finished.
		/// </summary>
		private delegate void StopCompletedDelegate();
		private void StopCompletedHandler()
		{
			try
			{
				this.Invoke(new StopCompletedDelegate(StopCompleted));
			}
			catch (Exception e)
			{
				Debug.WriteLine("MainForm.StopCompletedHandler couldn't invoke: " + e.ToString());
			}

		}
		private void StopCompleted()
		{
			if (ExitAfterStop) //user exits while encoding
			{
				Application.Exit();
			}
			else
			{
				this.Cursor = Cursors.Default;
				btnStart.Text = "Start Encoding";
				lblStatus.Text = "Status: Stopped";
				btnStart.Enabled = true;
				btnfind_ssrcs.Enabled = true;
				toggleControls(true);
				running = false;
			}
		}

		/// <summary>
		/// Callback when change video is finished.
		/// </summary>
		private delegate void ChangeVideoCompletedDelegate(StringEventArgs ea);
		private void ChangeVideoCompletedHandler(StringEventArgs ea)
		{
			try
			{
				this.Invoke(new ChangeVideoCompletedDelegate(ChangeVideoCompleted),new object[] {ea});
			}
			catch (Exception e)
			{
				Debug.WriteLine("MainForm.ChangeVideoCompletedHandler couldn't invoke: " + e.ToString());
			}

		}
		private void ChangeVideoCompleted(StringEventArgs ea)
		{
			//If there was an error, undo the CLB change
			if (ea.S != "")
			{
				for(int i=0;i<clbVSSRC.Items.Count;i++)
				{
					if(clbVSSRC.Items[i]==vclbItemAdded)
					{
						clbVSSRC.SetItemChecked(i,false);
					}
					else if (clbVSSRC.Items[i]==vclbItemRemoved)
					{
						clbVSSRC.SetItemChecked(i,true);
					}
				}
			}
			// enable controls.
			btnStart.Enabled = true;
			btnfind_ssrcs.Enabled = true;
			clbASSRC.Enabled = true;
			clbVSSRC.Enabled = true;				
			this.Cursor = Cursors.Default;
		}

		/// <summary>
		/// Callback when add/remove audio source is finished.
		/// </summary>
		private delegate void AddRemoveAudioCompletedDelegate(StringEventArgs ea);
		private void AddRemoveAudioCompletedHandler(StringEventArgs ea)
		{
			try
			{
				this.Invoke(new AddRemoveAudioCompletedDelegate(AddRemoveAudioCompleted),new object[] {ea});
			}
			catch (Exception e)
			{
				Debug.WriteLine("MainForm.AddRemoveAudioCompletedHandler couldn't invoke: " + e.ToString());
			}

		}
		private void AddRemoveAudioCompleted(StringEventArgs ea)
		{
			//If there was an error, undo the CLB change
			if (ea.S != "")
			{
				for(int i=0;i<clbASSRC.Items.Count;i++)
				{
					if(clbASSRC.Items[i]==this.aclbItemChanged)
					{
						clbASSRC.SetItemChecked(i,this.aclbItemOldState);
					}
				}
			}
			//enable controls
			btnStart.Enabled = true;
			btnfind_ssrcs.Enabled = true;
			clbASSRC.Enabled = true;
			clbVSSRC.Enabled = true;		
			this.Cursor = Cursors.Default;
		}

		/// <summary>
		/// Enable/disable controls when we start and stop encoding
		/// </summary>
		/// <param name="enable"></param>
		private void toggleControls(bool enable)
		{
			comboBoxVenues.Enabled = enable;
			if (wmg.PresenterEnabled)
			{
				comboBoxPVenues.Enabled = enable;
			}
			else
			{
				comboBoxPVenues.Enabled = false;		
			}
			btnConfig.Enabled = enable;
			btnConfigPVenue.Enabled = enable;
			checkPresenter.Enabled = enable;
			clbASSRC.Enabled = enable;
			clbVSSRC.Enabled = enable;
			lblChooseVenue.Enabled = enable;
			lblChoosePVenue.Enabled = enable;
			this.menuItem6.Enabled = enable;
		}

		
		/// <summary>
		/// Show conferencing configuration dialog
		/// </summary>
		/// <param name="sender"></param>
		/// <param name="e"></param>
		private void btnConfig_click(object sender, System.EventArgs e)
		{
			UWVenue newVenue = wmg.ConfigConferencing(); //returns the venue only if it changed.
			if (newVenue != null)
			{
				/// If the "custom" venue is in the combo list, the combo's indexChanged 
				/// handler changes the venue.  Otherwise, do it here.
				if (!SyncCombo(comboBoxVenues,newVenue))
				{
					lblConfig.Text = "Selected Venue: " + newVenue.ToAddrPort();
					if (wmg.ReflectorEnabled)
						lblConfig.Text += " (Reflector enabled)";
					clbASSRC.Items.Clear();
					clbVSSRC.Items.Clear();
					wmg.ChangeConferencingVenue(newVenue);
				}
			}
		}

		/// <summary>
		/// Show configure presenter integration dialog
		/// </summary>
		/// <param name="sender"></param>
		/// <param name="e"></param>

		private void btnConfigPVenue_Click(object sender, System.EventArgs e)
		{
			UWVenue newVenue = wmg.ConfigPresenter();
			if (newVenue != null)
			{
				/// If the "custom" venue is in the combo list, the combo's indexChanged 
				/// handler changes the venue.  Otherwise, do it here.
				if (!SyncCombo(comboBoxPVenues,newVenue))
				{
					lblPresenterStatus.Text = "Custom Venue: " + newVenue.ToAddrPort(); 
					wmg.ChangePresenterVenue(newVenue);
				}
			}
			showLoggingStatus(true);
		}

		/// <summary>
		///	Refresh Sources button.   Restart the conference listener.  If encoding, the 
		///	auto restart feature should cause streams to be restored in such a way that the
		///	WM stream is continuous.
		/// </summary>
		/// <param name="sender"></param>
		/// <param name="e"></param>
		private void btnfind_ssrcs_Click(object sender, System.EventArgs e)
		{
			this.Cursor = Cursors.WaitCursor; 
			btnfind_ssrcs.Enabled = false;
			//PRI2: If encoding we should find a way to keep the CLBs disabled until all the sources have returned.
			clbASSRC.Enabled = false;
			clbVSSRC.Enabled = false;
			clbASSRC.Items.Clear();
			clbVSSRC.Items.Clear();
			wmg.RestartListeners();
			btnfind_ssrcs.Enabled = true;
			clbASSRC.Enabled = true;
			clbVSSRC.Enabled = true;
			this.Cursor = Cursors.Default; 
		}
	

		/// <summary>
		/// mute/play local audio
		/// </summary>
		/// <param name="sender"></param>
		/// <param name="e"></param>
		private void checkMute_CheckedChanged(object sender, System.EventArgs e)
		{
			wmg.MuteAudio(checkMute.Checked);
		}


		/// <summary>
		/// Enable/disable presenter integration
		/// </summary>
		/// <param name="sender"></param>
		/// <param name="e"></param>
		private void checkPresenter_CheckedChanged(object sender, System.EventArgs e)
		{
			EnablePresenterControls(checkPresenter.Checked);
		}

		private void SetInitialPresenterState(bool enable)
		{
			if (checkPresenter.Checked != enable) 
			{
				// Just set the value of the checkbox which will cause the 
				// checkedchanged handler to do all the work.
				checkPresenter.Checked = enable;
			}
			else
			{
				EnablePresenterControls(enable);
			}
		}
		
		/// <summary>
		/// Turn on/off presenter controls.
		/// </summary>
		/// <param name="enable"></param>
		private void EnablePresenterControls(bool enable)
		{			
			this.Cursor = Cursors.WaitCursor;
			comboBoxPVenues.Enabled = enable;
			btnConfigPVenue.Enabled = enable;
			btnSelectSSRC.Enabled = enable;
			if (enable)
			{
				lblPresenterStatus.Text = "Selected Venue: " + wmg.PresenterVenue.ToAddrPort();
			}
			else
			{
				lblPresenterStatus.Text = "Disabled";
			}
			wmg.SetPresenterIntegration(enable);
			showLoggingStatus(enable);
			this.Cursor = Cursors.Default;
		}

		/// <summary>
		/// Show/hide video preview window.
		/// </summary>
		/// <param name="sender"></param>
		/// <param name="e"></param>
		private void checkShowVid_CheckedChanged(object sender, System.EventArgs e)
		{
			wmg.ShowVideo(checkShowVid.Checked);
		}


		/// <summary>
		/// User clicked Select Presenter SSRC button
		/// </summary>
		/// <param name="sender"></param>
		/// <param name="e"></param>
		private void btnSelectSSRC_Click(object sender, System.EventArgs e)
		{
			wmg.SelectPresenter();
		}
		#endregion

		#region UI Menus

		/// <summary>
		/// File->Exit
		/// </summary>
		/// <param name="sender"></param>
		/// <param name="e"></param>
		private void menuItem4_Click(object sender, System.EventArgs e)
		{
			if (running)
			{
				this.Cursor = Cursors.WaitCursor;
				btnStart.Text = "Stopping..";
				lblStatus.Text = "Status: Stopping..";
				btnStart.Enabled = false;
				btnfind_ssrcs.Enabled = false;
				ExitAfterStop = true;
				wmg.AsyncStop();
			}
			else
			{
				this.Cursor = Cursors.WaitCursor;
				Application.Exit();
			}
		}

		/// <summary>
		/// Help->About
		/// </summary>
		/// <param name="sender"></param>
		/// <param name="e"></param>
		private void menuItem3_Click(object sender, System.EventArgs e)
		{
			frmAbout AboutForm = new frmAbout();	
			AboutForm.ShowDialog(this);
		}

		/// <summary>
		/// Configure reflector
		/// </summary>
		/// <param name="sender"></param>
		/// <param name="e"></param>
		private void menuItem6_Click(object sender, System.EventArgs e)
		{
			frmServices services = new frmServices(wmg.ReflectorsRegKey);
			if ( services.ShowDialog() == DialogResult.OK) 
			{
				this.Cursor = Cursors.WaitCursor; 
				btnfind_ssrcs.Enabled = false;
				clbASSRC.Enabled = false;
				clbVSSRC.Enabled = false;
				clbASSRC.Items.Clear();
				clbVSSRC.Items.Clear();
				wmg.ChangeReflectorService();
				btnfind_ssrcs.Enabled = true;
				clbASSRC.Enabled = true;
				clbVSSRC.Enabled = true;

				lblConfig.Text = "Selected Venue: " + wmg.ConfVenue.ToAddrPort();
				if (wmg.ReflectorEnabled)
					lblConfig.Text += " (Reflector enabled)";

				this.Cursor = Cursors.Default; 

			}

		}

       private void menuItemDiagnostics_Click(object sender, EventArgs e) {
            string webQuery = wmg.GetDiagnosticWebQuery();
            if (webQuery == null) {
                MessageBox.Show("Diagnostic Service not configured.", "Diagnostic Service Not Configured", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return;
            }
            try {
                Process.Start(webQuery);
            }
            catch {
                MessageBox.Show("Failed to open: " + webQuery + "\r\nPlease check your configuration.", "Failed to Open Web Service", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

		#endregion menus

		#region UI Venue Combos

		/// <summary>
		/// The user chose a new conferencing venue
		/// </summary>
		/// <param name="sender"></param>
		/// <param name="e"></param>
		private void comboBoxVenues_SelectedIndexChanged(object sender, System.EventArgs e)
		{
			if (comboBoxVenues.SelectedItem != null) //null means a custom venue.
			{
				this.Cursor = Cursors.WaitCursor;
				UWVenue newVenue = (UWVenue)comboBoxVenues.SelectedItem;

                if (newVenue.PWStatus == PasswordStatus.STRONG_PASSWORD) {
                    MessageBox.Show("Encrypted venues are not supported by this version of Windows Media Gateway.", "Encrypted Venue", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    comboBoxVenues.SelectedIndex = previousVenuesCBIndex;
                    return;
                }
                else if (newVenue.PWStatus == PasswordStatus.WEAK_PASSWORD) {
                    if (!resolvePassword(newVenue)) {
                        comboBoxVenues.SelectedIndex = previousVenuesCBIndex;
                        return;
                    }
                }

				if (!wmg.ConfVenue.Equals(newVenue))
				{
					clbASSRC.Items.Clear();
					clbVSSRC.Items.Clear();
				}

				wmg.ChangeConferencingVenue(newVenue);
				
				lblConfig.Text = "Selected Venue: " + wmg.ConfVenue.ToAddrPort();
				if (wmg.ReflectorEnabled)
					lblConfig.Text += " (Reflector enabled)";

                previousVenuesCBIndex = comboBoxVenues.SelectedIndex;
				this.Cursor = Cursors.Default;
			}
		}

        private bool resolvePassword(UWVenue newVenue) {
            if (newVenue.PasswordResolved) {
                return true;
            }

            frmPassword passwordForm = new frmPassword();
            passwordForm.SetVenueName(newVenue.Name);
            DialogResult dr = passwordForm.ShowDialog();

            if (dr == DialogResult.OK) {
                String password = passwordForm.Password;
                if (password != null) {
                    password.Trim();
                    if (password.Length != 0) {
                        if (wmg.ResolvePassword(password, newVenue)) {
                            return true;
                        }
                    }
                }
                MessageBox.Show("Incorrect password.", "Incorrect Password", MessageBoxButtons.OK, MessageBoxIcon.Error);                        
            }
            return false;
        }	
		
		
		/// <summary>
		/// The user chose a new presenter venue
		/// </summary>
		/// <param name="sender"></param>
		/// <param name="e"></param>
		private void comboBoxPVenues_SelectedIndexChanged(object sender, System.EventArgs e)
		{
			if (comboBoxPVenues.SelectedItem != null) //null means a custom venue.
			{
				this.Cursor = Cursors.WaitCursor;

                UWVenue newVenue = (UWVenue)comboBoxPVenues.SelectedItem;

                if (newVenue.PWStatus == PasswordStatus.STRONG_PASSWORD) {
                    MessageBox.Show("Encrypted venues are not supported by this version of Windows Media Gateway.", "Encrypted Venue", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    comboBoxPVenues.SelectedIndex = previousPVenuesCBIndex;
                    return;
                }
                else if (newVenue.PWStatus == PasswordStatus.WEAK_PASSWORD) {
                    if (!resolvePassword(newVenue)) {
                        comboBoxPVenues.SelectedIndex = previousPVenuesCBIndex;
                        return;
                    }
                }

				wmg.ChangePresenterVenue(newVenue);
				lblPresenterStatus.Text = "Selected Venue: " + wmg.PresenterVenue.ToAddrPort();
                previousPVenuesCBIndex = comboBoxPVenues.SelectedIndex;
				this.Cursor = Cursors.Default;
			}
		}

		
		/// <summary>
		/// If the user chose a "custom" venue see if it matches any venues in the combo.
		/// Set the SelectedItem as appropriate.
		/// </summary>
		/// <param name="cb"></param>
		/// <param name="newVenue"></param>
		/// <returns>true if the venue was in the combo box</returns>
		private bool SyncCombo(ComboBox cb, UWVenue newVenue)
		{
			foreach(UWVenue uwv in cb.Items)
			{
				if (uwv.Equals(newVenue))
				{
					cb.SelectedItem = uwv;
					return true;
				}
			}
			cb.SelectedItem = null;
			
			return false;
		}
	

		/// <summary>
		/// Get the venues lists and fill the two combo boxes
		/// </summary>
		private void FillVenueCombos()
		{
			foreach(UWVenue uwv in wmg.ConfVenues)
			{
				comboBoxVenues.Items.Add(uwv);
				if (uwv.Equals(wmg.ConfVenue))
				{
					comboBoxVenues.SelectedIndex = comboBoxVenues.Items.Count-1;
				}
			}

			foreach(UWVenue uwv in wmg.PresenterVenues)
			{
				comboBoxPVenues.Items.Add(uwv);
				if (uwv.Equals(wmg.PresenterVenue))
				{
					comboBoxPVenues.SelectedIndex = comboBoxPVenues.Items.Count-1;
				}
			}
		}

		/// <summary>
		/// Update label to reflect presenter logging status
		/// </summary>
		/// <param name="enabled"></param>
		private void showLoggingStatus(bool enabled)
		{
			string strStatus = "None";
			if (enabled)
			{
				if (wmg.LogSlides)
				{
					strStatus = "Slide transitions";
					if (wmg.LogScripts)
					{
						strStatus = strStatus+ " and all scripts";
					}
				}
				else
				{
					if (wmg.LogScripts)
					{
						strStatus = "All scripts";
					}
				}
			} 
			
			lblLoggingStatus.Text = "Logging: " + strStatus;
		}
		#endregion

		#region UI CheckedListBoxes

		/// <summary>
		/// Received StreamAddRemove event.  Invoke on form thread.
		/// </summary>
		private delegate void StreamAddRemoveDelegate(StreamAddRemoveEventArgs ea);
		private void StreamAddRemove(StreamAddRemoveEventArgs ea)
		{
			/// There should be no threads causing invokes before the Window handle is created.
			if (this.IsHandleCreated)
			{
				try
				{
					this.Invoke(new StreamAddRemoveDelegate(ClbChange), new object[] {ea});
				}
				catch (Exception e)
				{
					Debug.WriteLine("MainForm.StreamAddRemove couldn't invoke: " + e.ToString());
				}
			}
			else
			{
				Debug.WriteLine("MainForm.StreamAddRemove IsHandleCreated is false!");
			}
		}


		/// <summary>
		/// Change one of the Checked ListBoxes in response to stream add/remove event 
		/// </summary>
		private void ClbChange(StreamAddRemoveEventArgs ea)
		{
			if (ea.Payload == MSR.LST.Net.Rtp.PayloadType.dynamicVideo)
			{
				clbVSSRC.Enabled = false;
				this.ignoreVCLBIndexChange = true;
				if (ea.Add)
				{
					if (!clbVSSRC.Items.Contains(ea.Name))
						clbVSSRC.Items.Add(ea.Name,ea.Selected);
				}
				else
				{
					if (clbVSSRC.Items.Contains(ea.Name))
						clbVSSRC.Items.Remove(ea.Name);
				}
				this.ignoreVCLBIndexChange = false;
				clbVSSRC.Enabled = true;
			}
			else if (ea.Payload == MSR.LST.Net.Rtp.PayloadType.dynamicAudio)
			{
				clbASSRC.Enabled = false;
				ignoreACLBIndexChange = true;
				if (ea.Add)
				{			
					if (!clbASSRC.Items.Contains(ea.Name))
						clbASSRC.Items.Add(ea.Name,ea.Selected);
				}
				else
				{
					if (clbASSRC.Items.Contains(ea.Name))
						clbASSRC.Items.Remove(ea.Name);	
				}
				ignoreACLBIndexChange = false;
				clbASSRC.Enabled = true;
			}
		}

		private ArrayList GetSelectedAudioCnames()
		{
			ArrayList ret = new ArrayList();
			foreach (String cname in clbASSRC.CheckedItems)
			{
				ret.Add(cname);
			}

			if ((ret.Count>0) && (ret.Count<=MAX_AUDIO_STREAMS))
				return ret;
			else
				return null;
		}

		private ArrayList GetSelectedVideoCname()
		{
			ArrayList ret = new ArrayList();
			if (clbVSSRC.CheckedItems.Count == 1)
			{
				ret.Add((String)clbVSSRC.CheckedItems[0]);
				return ret;
			}
			return null;
		}


		//CLB event handlers///

		//At least one item in the audio CLB should be checked.
		private void clbASSRC_SelectedIndexChanged(object sender, System.EventArgs e)
		{
			Debug.WriteLine("clbASSRC_SelectedIndexChanged");

			//This can be called as the result of an added or removed stream.  If so, ignore.
			if (this.ignoreACLBIndexChange)
				return;

			int selectedIndex = clbASSRC.SelectedIndex;
			if ((clbASSRC.CheckedItems.Count == 0) && 
				(!clbASSRC.GetItemChecked(selectedIndex)))
			{
				clbASSRC.SetItemChecked(selectedIndex,true);
			}

			if (running)
			{
				//Note the item changed and original state so that we can undo the change in case of failure.
				aclbItemChanged = clbASSRC.SelectedItem;
				aclbItemOldState = (!clbASSRC.GetItemChecked(selectedIndex));
				if (wmg.AsyncAddRemoveAudioSource(clbASSRC.SelectedItem.ToString(),clbASSRC.GetItemChecked(selectedIndex)))
				{
					//disable contols
					btnStart.Enabled = false;
					btnfind_ssrcs.Enabled = false;
					clbASSRC.Enabled = false;
					clbVSSRC.Enabled = false;				
					this.Cursor = Cursors.WaitCursor;
				}
				else
				{
					//this means the user clicked on the only one that was already selected.  No need to do anything.
				}
			}
		}

		//Ignore double-clicks
		private void clbASSRC_DoubleClick(object sender, System.EventArgs e)
		{
			if (clbASSRC.SelectedIndex != -1)
				clbASSRC.SetItemChecked(clbASSRC.SelectedIndex,true);		
		}

		//Double-clicks on the CLB need to be ignored.
		private void clbVSSRC_DoubleClick(object sender, System.EventArgs e)
		{
			if (clbVSSRC.SelectedIndex != -1)
				clbVSSRC.SetItemChecked(clbVSSRC.SelectedIndex,true);
		}

		//Make the video checkedlistbox behave somewhat like radio buttons.
		private void clbVSSRC_SelectedIndexChanged(object sender, System.EventArgs e)
		{
			Debug.WriteLine("clbVSSRC_SelectedIndexChanged");
			//This can be called as the result of an added or removed stream.  If so, ignore.
			if (this.ignoreVCLBIndexChange)
				return;

			//String selectedItem = clbVSSRC.SelectedItem.ToString();
			int selectedIndex = clbVSSRC.SelectedIndex;
			int previousIndex = 0;
			//Note this assumes checkOnClick is true.
			foreach (int i in clbVSSRC.CheckedIndices)
			{
				if (i != selectedIndex)
				{
					previousIndex = i;
					clbVSSRC.SetItemChecked(i,false);
				}
			}

			if (!clbVSSRC.GetItemChecked(selectedIndex))
			{
				clbVSSRC.SetItemChecked(selectedIndex,true);
			}
			if (running)
			{
				//Note new and old video streams so that we can undo the CLB in case the change fails.
				vclbItemAdded = clbVSSRC.SelectedItem;
				vclbItemRemoved = clbVSSRC.Items[previousIndex];
				if (wmg.AsyncChangeVideoSource(clbVSSRC.SelectedItem.ToString()))
				{
					//disable controls.
					btnStart.Enabled = false;
					btnfind_ssrcs.Enabled = false;
					clbASSRC.Enabled = false;
					clbVSSRC.Enabled = false;				
					this.Cursor = Cursors.WaitCursor;
				}
				else
				{
					//The user clicked on one that was already selected.  do nothing.
				}
			}
		}

		#endregion

	}
}
