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
	/// Let the user add or remove a service host or URL.
	/// </summary>
	public class frmServices2 : System.Windows.Forms.Form
	{
		private System.Windows.Forms.Button buttonOK;
		private System.Windows.Forms.Button buttonDelete;
		private System.Windows.Forms.Button buttonAdd;

		private System.ComponentModel.Container components = null;
		private System.Windows.Forms.Button buttonEdit;
		public static string editService = null;
		private string[] currentServices;
        private ArrayList deletedServiceList;
        private ArrayList addedServiceList;
        private string service;
        private RegistryKey serviceRegKey = null;

        private System.Windows.Forms.Button buttonCancel;
        private System.Windows.Forms.Label labelServiceList;
        private System.Windows.Forms.ListBox listBoxServices;
        private System.Windows.Forms.Label lblAddService;
        private System.Windows.Forms.TextBox textAddService;
        private System.Windows.Forms.Label lblExample;

		public frmServices2(string svc, RegistryKey key, string txtForm, string txtService, 
            string txtAdd, string txtExample)
		{
			//
			// Required for Windows Form Designer support
			//
			InitializeComponent();

            service = svc;
            serviceRegKey = key; 
           
            this.Text = txtForm;
            this.labelServiceList.Text = txtService;
            this.lblAddService.Text = txtAdd;
            this.lblExample.Text = txtExample;
            
            // Need this to support Cancel button
            currentServices = serviceRegKey.GetValueNames();
            deletedServiceList = new ArrayList();
            addedServiceList = new ArrayList();

            DisplayServices(serviceRegKey, currentServices , deletedServiceList, addedServiceList);            
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
			System.Resources.ResourceManager resources = new System.Resources.ResourceManager(typeof(frmServices2));
			this.labelServiceList = new System.Windows.Forms.Label();
			this.lblAddService = new System.Windows.Forms.Label();
			this.lblExample = new System.Windows.Forms.Label();
			this.listBoxServices = new System.Windows.Forms.ListBox();
			this.buttonOK = new System.Windows.Forms.Button();
			this.buttonDelete = new System.Windows.Forms.Button();
			this.textAddService = new System.Windows.Forms.TextBox();
			this.buttonAdd = new System.Windows.Forms.Button();
			this.buttonEdit = new System.Windows.Forms.Button();
			this.buttonCancel = new System.Windows.Forms.Button();
			this.SuspendLayout();
			// 
			// labelServiceList
			// 
			this.labelServiceList.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F);
			this.labelServiceList.Location = new System.Drawing.Point(8, 8);
			this.labelServiceList.Name = "labelServiceList";
			this.labelServiceList.Size = new System.Drawing.Size(166, 23);
			this.labelServiceList.TabIndex = 33;
			this.labelServiceList.Text = "My Venue Services:";
			// 
			// lblAddService
			// 
			this.lblAddService.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((System.Byte)(0)));
			this.lblAddService.Location = new System.Drawing.Point(8, 184);
			this.lblAddService.Name = "lblAddService";
			this.lblAddService.Size = new System.Drawing.Size(360, 23);
			this.lblAddService.TabIndex = 34;
			this.lblAddService.Text = "Add Service:";
			// 
			// lblExample
			// 
			this.lblExample.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F);
			this.lblExample.Location = new System.Drawing.Point(8, 224);
			this.lblExample.Name = "lblExample";
			this.lblExample.Size = new System.Drawing.Size(368, 23);
			this.lblExample.TabIndex = 35;
			this.lblExample.Text = "For example: ";
			// 
			// listBoxServices
			// 
			this.listBoxServices.HorizontalScrollbar = true;
			this.listBoxServices.Location = new System.Drawing.Point(8, 32);
			this.listBoxServices.Name = "listBoxServices";
			this.listBoxServices.Size = new System.Drawing.Size(312, 108);
			this.listBoxServices.TabIndex = 36;
			this.listBoxServices.SelectedIndexChanged += new System.EventHandler(this.listBoxServices_SelectedIndexChanged);
			// 
			// buttonOK
			// 
			this.buttonOK.FlatStyle = System.Windows.Forms.FlatStyle.System;
			this.buttonOK.Font = new System.Drawing.Font("Microsoft Sans Serif", 9F);
			this.buttonOK.Location = new System.Drawing.Point(120, 272);
			this.buttonOK.Name = "buttonOK";
			this.buttonOK.Size = new System.Drawing.Size(96, 23);
			this.buttonOK.TabIndex = 39;
			this.buttonOK.Text = "&OK";
			this.buttonOK.Click += new System.EventHandler(this.buttonOK_Click);
			// 
			// buttonDelete
			// 
			this.buttonDelete.FlatStyle = System.Windows.Forms.FlatStyle.System;
			this.buttonDelete.Font = new System.Drawing.Font("Microsoft Sans Serif", 9F);
			this.buttonDelete.Location = new System.Drawing.Point(224, 152);
			this.buttonDelete.Name = "buttonDelete";
			this.buttonDelete.Size = new System.Drawing.Size(96, 23);
			this.buttonDelete.TabIndex = 41;
			this.buttonDelete.Text = "&Delete";
			this.buttonDelete.Click += new System.EventHandler(this.buttonDelete_Click);
			// 
			// textAddService
			// 
			this.textAddService.AcceptsReturn = true;
			this.textAddService.Location = new System.Drawing.Point(8, 200);
			this.textAddService.Name = "textAddService";
			this.textAddService.Size = new System.Drawing.Size(312, 20);
			this.textAddService.TabIndex = 42;
			this.textAddService.Text = "";
			this.textAddService.TextChanged += new System.EventHandler(this.textAddService_TextChanged);
			// 
			// buttonAdd
			// 
			this.buttonAdd.FlatStyle = System.Windows.Forms.FlatStyle.System;
			this.buttonAdd.Font = new System.Drawing.Font("Microsoft Sans Serif", 9F);
			this.buttonAdd.Location = new System.Drawing.Point(224, 240);
			this.buttonAdd.Name = "buttonAdd";
			this.buttonAdd.Size = new System.Drawing.Size(96, 23);
			this.buttonAdd.TabIndex = 43;
			this.buttonAdd.Text = "&Add";
			this.buttonAdd.Click += new System.EventHandler(this.buttonAdd_Click);
			// 
			// buttonEdit
			// 
			this.buttonEdit.FlatStyle = System.Windows.Forms.FlatStyle.System;
			this.buttonEdit.Font = new System.Drawing.Font("Microsoft Sans Serif", 9F);
			this.buttonEdit.Location = new System.Drawing.Point(120, 152);
			this.buttonEdit.Name = "buttonEdit";
			this.buttonEdit.Size = new System.Drawing.Size(96, 23);
			this.buttonEdit.TabIndex = 44;
			this.buttonEdit.Text = "&Edit";
			this.buttonEdit.Visible = false;
			this.buttonEdit.Click += new System.EventHandler(this.buttonEdit_Click);
			// 
			// buttonCancel
			// 
			this.buttonCancel.DialogResult = System.Windows.Forms.DialogResult.Cancel;
			this.buttonCancel.FlatStyle = System.Windows.Forms.FlatStyle.System;
			this.buttonCancel.Font = new System.Drawing.Font("Microsoft Sans Serif", 9F);
			this.buttonCancel.Location = new System.Drawing.Point(224, 272);
			this.buttonCancel.Name = "buttonCancel";
			this.buttonCancel.Size = new System.Drawing.Size(96, 23);
			this.buttonCancel.TabIndex = 45;
			this.buttonCancel.Text = "&Cancel";
			this.buttonCancel.Click += new System.EventHandler(this.buttonCancel_Click);
			// 
			// frmServices2
			// 
			this.AcceptButton = this.buttonOK;
			this.AutoScaleBaseSize = new System.Drawing.Size(5, 13);
			this.CancelButton = this.buttonCancel;
			this.ClientSize = new System.Drawing.Size(330, 304);
			this.ControlBox = false;
			this.Controls.Add(this.buttonCancel);
			this.Controls.Add(this.buttonEdit);
			this.Controls.Add(this.buttonAdd);
			this.Controls.Add(this.textAddService);
			this.Controls.Add(this.buttonDelete);
			this.Controls.Add(this.buttonOK);
			this.Controls.Add(this.listBoxServices);
			this.Controls.Add(this.lblExample);
			this.Controls.Add(this.lblAddService);
			this.Controls.Add(this.labelServiceList);
			this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedDialog;
			this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
			this.MaximizeBox = false;
			this.MinimizeBox = false;
			this.Name = "frmServices2";
			this.ShowInTaskbar = false;
			this.Text = "Configure Services";
			this.ResumeLayout(false);

		}
		#endregion
		

        private void DisplayServices(RegistryKey regkey, string[] currentList, ArrayList addedList, ArrayList deletedList)
        {
            listBoxServices.Items.Clear();
            foreach (string key in currentList)
            {
                listBoxServices.Items.Add(key);
            }

            foreach (string key in addedList)
            {
                listBoxServices.Items.Add(key);
            }
						
            foreach (string key in deletedList)
            {
                listBoxServices.Items.Remove(key);
            }

            buttonDelete.Enabled = false;
            buttonEdit.Enabled = false;
            buttonAdd.Enabled = false;
        }

		private void SaveServices(RegistryKey regkey, ArrayList addedList, ArrayList deletedList)
		{
            foreach (string key in addedList)
            {
                regkey.SetValue(key, "False");
            }
			
            foreach (string key in deletedList)
            {
                regkey.DeleteValue(key);
            }
		}
     
		private void buttonDelete_Click(object sender, System.EventArgs e)
		{
			string key = listBoxServices.Items[listBoxServices.SelectedIndex].ToString();

            deletedServiceList.Add(key);
            DisplayServices(serviceRegKey, currentServices, addedServiceList, deletedServiceList);
		}
		private void buttonAdd_Click(object sender, System.EventArgs e)
		{
			if (textAddService.Text != "")
			{
				try
				{
					int colonpos = textAddService.Text.LastIndexOf(":");
				
					if ((colonpos>0) && (colonpos < textAddService.Text.Length-1))
					{
						string port = textAddService.Text.Substring(colonpos+1);
						int i = int.Parse(port);

						addedServiceList.Add(textAddService.Text);
						DisplayServices(serviceRegKey, currentServices, addedServiceList, deletedServiceList);               
						textAddService.Text = "";	  
					}
					else
					{
						MessageBox.Show("Badly formed address.");
					}
				}
				catch
				{
					MessageBox.Show("Badly formed address.");
				}

			}
		}

		private void buttonEdit_Click(object sender, System.EventArgs e)
		{}

		private void listBoxServices_SelectedIndexChanged(object sender, System.EventArgs e)
		{
			buttonDelete.Enabled = true;
			buttonEdit.Enabled = true;
		}

		private void textAddService_TextChanged(object sender, System.EventArgs e)
		{
			buttonAdd.Enabled = true;
		}

		private void buttonOK_Click(object sender, System.EventArgs e)
		{
            SaveServices(serviceRegKey, addedServiceList, deletedServiceList);           
			this.DialogResult = DialogResult.OK;
			this.Close();
		}

		private void buttonCancel_Click(object sender, System.EventArgs e)
		{
			this.DialogResult = DialogResult.Cancel;
			this.Close();
		}
	}
}
