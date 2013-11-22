using System;
using System.Drawing;
using System.Collections;
using System.ComponentModel;
using System.Windows.Forms;
using Microsoft.Win32;
using System.Configuration;

namespace UW.CSE.DISC
{
	/// <summary>
	/// Let the user configure a reflector service.
	/// </summary>
	public class frmServices : System.Windows.Forms.Form
	{

		private static string txtReflectorsForm =  "Configure Reflector Services";
		private static string txtReflectorsServices = "My Reflector Services";
		private static string txtReflectorsAdd = "Add Reflector Service (ipaddress:port)";
		private static string txtReflectorsExample = "For example: 131.107.151.1:7004";

		public static bool autoSendAudio = true;
		public static bool autoSendVideo = true;
		private System.Windows.Forms.GroupBox grpReflector;
		private System.Windows.Forms.Button btnOK;
		private System.Windows.Forms.Button btnReflectorServices;
		private System.Windows.Forms.ComboBox cmbReflectorServices;
		private RegistryKey reflectorsRegKey = null;
		private bool bInitService = false;
		private System.Windows.Forms.CheckBox chkEnableReflector;
		private System.Windows.Forms.Label label1;

		/// <summary>
		/// Required designer variable.
		/// </summary>
		private System.ComponentModel.Container components = null;

		public frmServices(RegistryKey rkey)
		{
			//
			// Required for Windows Form Designer support
			//
			InitializeComponent();

			reflectorsRegKey = rkey;
			InitServices(reflectorsRegKey, this.cmbReflectorServices, this.chkEnableReflector);
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
			System.Resources.ResourceManager resources = new System.Resources.ResourceManager(typeof(frmServices));
			this.grpReflector = new System.Windows.Forms.GroupBox();
			this.cmbReflectorServices = new System.Windows.Forms.ComboBox();
			this.chkEnableReflector = new System.Windows.Forms.CheckBox();
			this.btnReflectorServices = new System.Windows.Forms.Button();
			this.btnOK = new System.Windows.Forms.Button();
			this.label1 = new System.Windows.Forms.Label();
			this.grpReflector.SuspendLayout();
			this.SuspendLayout();
			// 
			// grpReflector
			// 
			this.grpReflector.Controls.Add(this.cmbReflectorServices);
			this.grpReflector.Controls.Add(this.chkEnableReflector);
			this.grpReflector.Controls.Add(this.btnReflectorServices);
			this.grpReflector.Location = new System.Drawing.Point(8, 32);
			this.grpReflector.Name = "grpReflector";
			this.grpReflector.Size = new System.Drawing.Size(368, 88);
			this.grpReflector.TabIndex = 2;
			this.grpReflector.TabStop = false;
			this.grpReflector.Text = "Reflector Service";
			// 
			// cmbReflectorServices
			// 
			this.cmbReflectorServices.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
			this.cmbReflectorServices.Enabled = false;
			this.cmbReflectorServices.Location = new System.Drawing.Point(8, 24);
			this.cmbReflectorServices.Name = "cmbReflectorServices";
			this.cmbReflectorServices.Size = new System.Drawing.Size(352, 21);
			this.cmbReflectorServices.TabIndex = 31;
			this.cmbReflectorServices.SelectedIndexChanged += new System.EventHandler(this.cmbReflectorServices_SelectedIndexChanged);
			// 
			// chkEnableReflector
			// 
			this.chkEnableReflector.Enabled = false;
			this.chkEnableReflector.Location = new System.Drawing.Point(8, 48);
			this.chkEnableReflector.Name = "chkEnableReflector";
			this.chkEnableReflector.Size = new System.Drawing.Size(160, 24);
			this.chkEnableReflector.TabIndex = 32;
			this.chkEnableReflector.Text = "Enable &Reflector Service";
			this.chkEnableReflector.CheckedChanged += new System.EventHandler(this.chkEnableReflector_CheckedChanged);
			// 
			// btnReflectorServices
			// 
			this.btnReflectorServices.FlatStyle = System.Windows.Forms.FlatStyle.System;
			this.btnReflectorServices.Location = new System.Drawing.Point(240, 48);
			this.btnReflectorServices.Name = "btnReflectorServices";
			this.btnReflectorServices.Size = new System.Drawing.Size(120, 23);
			this.btnReflectorServices.TabIndex = 68;
			this.btnReflectorServices.Text = "Configure Reflectors...";
			this.btnReflectorServices.Click += new System.EventHandler(this.btnReflectorServices_Click);
			// 
			// btnOK
			// 
			this.btnOK.FlatStyle = System.Windows.Forms.FlatStyle.System;
			this.btnOK.Font = new System.Drawing.Font("Microsoft Sans Serif", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((System.Byte)(0)));
			this.btnOK.Location = new System.Drawing.Point(280, 128);
			this.btnOK.Name = "btnOK";
			this.btnOK.Size = new System.Drawing.Size(95, 23);
			this.btnOK.TabIndex = 38;
			this.btnOK.Text = "OK";
			this.btnOK.Click += new System.EventHandler(this.btnOK_Click);
			// 
			// label1
			// 
			this.label1.ForeColor = System.Drawing.Color.Red;
			this.label1.Location = new System.Drawing.Point(16, 8);
			this.label1.Name = "label1";
			this.label1.Size = new System.Drawing.Size(344, 16);
			this.label1.TabIndex = 39;
			this.label1.Text = "Note: Before using Reflector, you must disable Presenter Itegration.";
			// 
			// frmServices
			// 
			this.AutoScaleBaseSize = new System.Drawing.Size(5, 13);
			this.ClientSize = new System.Drawing.Size(386, 160);
			this.ControlBox = false;
			this.Controls.Add(this.label1);
			this.Controls.Add(this.btnOK);
			this.Controls.Add(this.grpReflector);
			this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedDialog;
			this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
			this.MaximizeBox = false;
			this.MinimizeBox = false;
			this.Name = "frmServices";
			this.ShowInTaskbar = false;
			this.Text = "ConferenceXP Services";
			this.grpReflector.ResumeLayout(false);
			this.ResumeLayout(false);

		}
		#endregion

		private void InitServices(RegistryKey regkey, 
			System.Windows.Forms.ComboBox serviceComboBox,
			System.Windows.Forms.CheckBox enableCheckBox)
		{
			// set a flag to prevent checkbox events from firing when we are in this method
			bInitService = true;
			serviceComboBox.Text = "";
			serviceComboBox.Items.Clear();
          
			if (regkey.ValueCount == 0)
			{
				serviceComboBox.Enabled = false;          
				if (enableCheckBox != null)
				{
					enableCheckBox.Checked = false;
					enableCheckBox.Enabled = false;
				}
			}
			else
			{
				// Enable checkbox
				if (enableCheckBox != null)
				{
					enableCheckBox.Enabled = true;                
				}

				// Get the list of services from the registry
				string[] names = regkey.GetValueNames();
				bool bSelectedFound = false;
				foreach (string service in names)
				{                
					serviceComboBox.Items.Add(service);

					// and if there is a selected service and update fields accordingly
					object servicestate = regkey.GetValue(service);
					if (Boolean.Parse((string) servicestate))
					{                        
						// We have a selected service, so enable the combo box and update the text field
						serviceComboBox.Enabled = true; 
						serviceComboBox.Text = service;
						if (enableCheckBox != null)
						{
							enableCheckBox.Checked = true;                
						}
						bSelectedFound = true;
					}  
				}
                
				// If no selected service was found during initialization, 
				// display the 1st one listed with unchecked checkbox
				if (!bSelectedFound) 
				{
					serviceComboBox.Text = names[0];
					serviceComboBox.Enabled = false;
					if (enableCheckBox != null)
					{
						enableCheckBox.Checked = false;               
					}
				}                
			}            
			bInitService = false;
		}
   
     
		private void EnableService(RegistryKey regkey, System.Windows.Forms.ComboBox serviceComboBox)
		{
			// Combo list has already been populated, so just enable           
			serviceComboBox.Enabled = true;

			// Check if the service displayed in the text is in fact the selected one, and set it if it is not
			object servicestate = regkey.GetValue(serviceComboBox.Text);
			if (!Boolean.Parse((string) servicestate))
			{ 
				regkey.SetValue(serviceComboBox.Text, "True");
			}
		}
      
		private void ChangeService(RegistryKey regkey, 
			System.Windows.Forms.ComboBox serviceComboBox,
			System.Windows.Forms.CheckBox enableCheckBox)            
		{
			if (enableCheckBox == null  || enableCheckBox.Checked)
			{
				string[] names = regkey.GetValueNames();
				foreach (string service in names)
				{
					if (service == serviceComboBox.Text)
					{
						regkey.SetValue(service, "True");
					}
					else
					{
						regkey.SetValue(service, "False");
					}
				}
			}
		}

		private void DisableService(RegistryKey regkey, 
			System.Windows.Forms.ComboBox serviceComboBox,
			System.Windows.Forms.CheckBox enableCheckBox)
		{
			serviceComboBox.Enabled = false; 

			if (regkey.ValueCount > 0)
			{
				string[] names = regkey.GetValueNames(); 
				serviceComboBox.Text = names[0];
				foreach (string service in names)
				{     
					regkey.SetValue(service, "False");
				}  
			}
		}
       
		private void btnOK_Click(object sender, System.EventArgs e)
		{
			this.DialogResult = DialogResult.OK;
			this.Close();
		}

		private void btnReflectorServices_Click(object sender, System.EventArgs e)
		{
			frmServices2 services = new frmServices2("Reflector Service", reflectorsRegKey, txtReflectorsForm, 
				txtReflectorsServices, txtReflectorsAdd, txtReflectorsExample);
			if ( services.ShowDialog() == DialogResult.OK) 
			{
				InitServices(reflectorsRegKey, this.cmbReflectorServices, this.chkEnableReflector);
			}
		}

		private void chkEnableReflector_CheckedChanged(object sender, System.EventArgs e)
		{
			if (!bInitService)
			{
				if (chkEnableReflector.Checked == false)
				{
					DisableService(reflectorsRegKey, this.cmbReflectorServices, this.chkEnableReflector);
				}
				else
				{
					EnableService(reflectorsRegKey, this.cmbReflectorServices);
				}
			}
		}

		private void cmbReflectorServices_SelectedIndexChanged(object sender, System.EventArgs e)
		{
			if (!bInitService)
			{
				ChangeService(reflectorsRegKey, this.cmbReflectorServices, this.chkEnableReflector);
			}
		}
	}
}
