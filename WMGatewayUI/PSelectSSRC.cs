using System;
using System.Drawing;
using System.Collections;
using System.ComponentModel;
using System.Windows.Forms;

namespace UW.CSE.DISC
{
	/// <summary>
	/// Let the user select a presentation source
	/// </summary>
	public class PSelectSSRC : System.Windows.Forms.Form
	{
		private System.Windows.Forms.Button btnOK;
		private System.Windows.Forms.Button btnCancel;
		public  System.Windows.Forms.ComboBox comboPSource;

		private System.ComponentModel.Container components = null;

		public PSelectSSRC()
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
			this.btnOK = new System.Windows.Forms.Button();
			this.btnCancel = new System.Windows.Forms.Button();
			this.comboPSource = new System.Windows.Forms.ComboBox();
			this.SuspendLayout();
			// 
			// btnOK
			// 
			this.btnOK.DialogResult = System.Windows.Forms.DialogResult.OK;
			this.btnOK.Location = new System.Drawing.Point(304, 56);
			this.btnOK.Name = "btnOK";
			this.btnOK.Size = new System.Drawing.Size(72, 24);
			this.btnOK.TabIndex = 0;
			this.btnOK.Text = "OK";
			this.btnOK.Click += new System.EventHandler(this.btnOK_Click);
			// 
			// btnCancel
			// 
			this.btnCancel.DialogResult = System.Windows.Forms.DialogResult.Cancel;
			this.btnCancel.Location = new System.Drawing.Point(16, 56);
			this.btnCancel.Name = "btnCancel";
			this.btnCancel.Size = new System.Drawing.Size(72, 24);
			this.btnCancel.TabIndex = 1;
			this.btnCancel.Text = "Cancel";
			// 
			// comboPSource
			// 
			this.comboPSource.Location = new System.Drawing.Point(16, 16);
			this.comboPSource.Name = "comboPSource";
			this.comboPSource.Size = new System.Drawing.Size(360, 21);
			this.comboPSource.TabIndex = 2;
			this.comboPSource.Text = "No Presenter Sources Found";
			// 
			// PSelectSSRC
			// 
			this.AcceptButton = this.btnOK;
			this.AutoScaleBaseSize = new System.Drawing.Size(5, 13);
			this.CancelButton = this.btnCancel;
			this.ClientSize = new System.Drawing.Size(394, 96);
			this.Controls.AddRange(new System.Windows.Forms.Control[] {
																		  this.comboPSource,
																		  this.btnCancel,
																		  this.btnOK});
			this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedDialog;
			this.MaximizeBox = false;
			this.MinimizeBox = false;
			this.Name = "PSelectSSRC";
			this.Text = "Select a Presenter Source";
			this.ResumeLayout(false);

		}
		#endregion

		private void btnOK_Click(object sender, System.EventArgs e)
		{
		}
	}
}
