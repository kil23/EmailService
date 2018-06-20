using System;
using System.Drawing;
using System.Windows.Forms;

namespace EmailWindowsFormsApp
{
    partial class Form1
    {
        
        private System.ComponentModel.IContainer components = null;

        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }
       
        private void InitializeComponent()
        {
            this.components = new System.ComponentModel.Container();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle1 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle2 = new System.Windows.Forms.DataGridViewCellStyle();
            this.dateTimePicker1 = new System.Windows.Forms.DateTimePicker();
            this.fromdate = new System.Windows.Forms.Label();
            this.todate = new System.Windows.Forms.Label();
            this.dateTimePicker2 = new System.Windows.Forms.DateTimePicker();
            this.emailstatus = new System.Windows.Forms.Label();
            this.isSuccess = new System.Windows.Forms.ComboBox();
            this.dataGridView = new System.Windows.Forms.DataGridView();
            this.emailSettingsBindingSource = new System.Windows.Forms.BindingSource(this.components);
            this.emailDetailsDataSetBindingSource = new System.Windows.Forms.BindingSource(this.components);
            this.email_DetailsDataSet = new EmailWindowsFormsApp.Email_DetailsDataSet();
            this.emailLogsBindingSource = new System.Windows.Forms.BindingSource(this.components);
            this.errorLogBindingSource = new System.Windows.Forms.BindingSource(this.components);
            this.button1 = new System.Windows.Forms.Button();
            this.Resend = new System.Windows.Forms.DataGridViewButtonColumn();
            this.Project_Name = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Subject = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.CC = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.BCC = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.To_Email_id = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Attached_Files = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Body = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Log_Time = new System.Windows.Forms.DataGridViewTextBoxColumn();
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.emailSettingsBindingSource)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.emailDetailsDataSetBindingSource)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.email_DetailsDataSet)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.emailLogsBindingSource)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.errorLogBindingSource)).BeginInit();
            this.SuspendLayout();
            // 
            // dateTimePicker1
            // 
            this.dateTimePicker1.Font = new System.Drawing.Font("Segoe UI", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.dateTimePicker1.Location = new System.Drawing.Point(319, 46);
            this.dateTimePicker1.Name = "dateTimePicker1";
            this.dateTimePicker1.Size = new System.Drawing.Size(350, 34);
            this.dateTimePicker1.TabIndex = 0;
            this.dateTimePicker1.Value = new System.DateTime(2018, 4, 1, 0, 0, 0, 0);
            // 
            // fromdate
            // 
            this.fromdate.AutoSize = true;
            this.fromdate.Font = new System.Drawing.Font("Segoe UI Semibold", 13.8F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.fromdate.Location = new System.Drawing.Point(150, 48);
            this.fromdate.Name = "fromdate";
            this.fromdate.Size = new System.Drawing.Size(130, 32);
            this.fromdate.TabIndex = 1;
            this.fromdate.Text = "From Date";
            // 
            // todate
            // 
            this.todate.AutoSize = true;
            this.todate.Font = new System.Drawing.Font("Segoe UI Semibold", 13.8F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.todate.Location = new System.Drawing.Point(822, 46);
            this.todate.Name = "todate";
            this.todate.Size = new System.Drawing.Size(99, 32);
            this.todate.TabIndex = 2;
            this.todate.Text = "To Date";
            // 
            // dateTimePicker2
            // 
            this.dateTimePicker2.Font = new System.Drawing.Font("Segoe UI", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.dateTimePicker2.Location = new System.Drawing.Point(961, 46);
            this.dateTimePicker2.Name = "dateTimePicker2";
            this.dateTimePicker2.Size = new System.Drawing.Size(350, 34);
            this.dateTimePicker2.TabIndex = 3;
            // 
            // emailstatus
            // 
            this.emailstatus.AutoSize = true;
            this.emailstatus.Font = new System.Drawing.Font("Segoe UI Semibold", 13.8F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.emailstatus.Location = new System.Drawing.Point(150, 114);
            this.emailstatus.Name = "emailstatus";
            this.emailstatus.Size = new System.Drawing.Size(147, 32);
            this.emailstatus.TabIndex = 4;
            this.emailstatus.Text = "Email Status";
            // 
            // isSuccess
            // 
            this.isSuccess.DisplayMember = "Failed";
            this.isSuccess.Font = new System.Drawing.Font("Segoe UI", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.isSuccess.FormattingEnabled = true;
            this.isSuccess.Items.AddRange(new object[] {
            "Failed",
            "Success"});
            this.isSuccess.Location = new System.Drawing.Point(319, 113);
            this.isSuccess.Name = "isSuccess";
            this.isSuccess.Size = new System.Drawing.Size(350, 36);
            this.isSuccess.TabIndex = 5;
            this.isSuccess.Text = "Failed";
            this.isSuccess.ValueMember = "Failed";
            // 
            // dataGridView
            // 
            this.dataGridView.AllowUserToAddRows = false;
            this.dataGridView.AllowUserToDeleteRows = false;
            this.dataGridView.AllowUserToOrderColumns = true;
            this.dataGridView.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.dataGridView.AutoSizeColumnsMode = System.Windows.Forms.DataGridViewAutoSizeColumnsMode.Fill;
            this.dataGridView.AutoSizeRowsMode = System.Windows.Forms.DataGridViewAutoSizeRowsMode.AllCells;
            this.dataGridView.ColumnHeadersBorderStyle = System.Windows.Forms.DataGridViewHeaderBorderStyle.Single;
            dataGridViewCellStyle1.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleCenter;
            dataGridViewCellStyle1.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(255)))), ((int)(((byte)(192)))), ((int)(((byte)(192)))));
            dataGridViewCellStyle1.Font = new System.Drawing.Font("Segoe UI", 10.2F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            dataGridViewCellStyle1.ForeColor = System.Drawing.Color.Firebrick;
            dataGridViewCellStyle1.SelectionBackColor = System.Drawing.Color.FromArgb(((int)(((byte)(255)))), ((int)(((byte)(255)))), ((int)(((byte)(192)))));
            dataGridViewCellStyle1.SelectionForeColor = System.Drawing.Color.Firebrick;
            dataGridViewCellStyle1.WrapMode = System.Windows.Forms.DataGridViewTriState.True;
            this.dataGridView.ColumnHeadersDefaultCellStyle = dataGridViewCellStyle1;
            this.dataGridView.ColumnHeadersHeight = 30;
            this.dataGridView.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.Resend,
            this.Project_Name,
            this.Subject,
            this.CC,
            this.BCC,
            this.To_Email_id,
            this.Attached_Files,
            this.Body,
            this.Log_Time});
            this.dataGridView.Location = new System.Drawing.Point(32, 190);
            this.dataGridView.Name = "dataGridView";
            this.dataGridView.ReadOnly = true;
            this.dataGridView.RowTemplate.DefaultCellStyle.WrapMode = System.Windows.Forms.DataGridViewTriState.False;
            this.dataGridView.RowTemplate.Height = 5;
            this.dataGridView.RowTemplate.Resizable = System.Windows.Forms.DataGridViewTriState.False;
            this.dataGridView.Size = new System.Drawing.Size(1300, 327);
            this.dataGridView.TabIndex = 6;
            this.dataGridView.CellContentClick += new System.Windows.Forms.DataGridViewCellEventHandler(this.dataGridView_CellContentClick);
            // 
            // email_DetailsDataSet
            // 
            this.email_DetailsDataSet.DataSetName = "Email_DetailsDataSet";
            this.email_DetailsDataSet.SchemaSerializationMode = System.Data.SchemaSerializationMode.IncludeSchema;
            // 
            // button1
            // 
            this.button1.Font = new System.Drawing.Font("Segoe UI Semibold", 13.8F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.button1.Location = new System.Drawing.Point(828, 113);
            this.button1.Name = "button1";
            this.button1.Size = new System.Drawing.Size(161, 49);
            this.button1.TabIndex = 7;
            this.button1.Text = "Search";
            this.button1.TextAlign = System.Drawing.ContentAlignment.TopCenter;
            this.button1.TextImageRelation = System.Windows.Forms.TextImageRelation.ImageBeforeText;
            this.button1.UseVisualStyleBackColor = true;
            this.button1.Click += new System.EventHandler(this.button1_Click);
            // 
            // Resend
            // 
            dataGridViewCellStyle2.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleCenter;
            dataGridViewCellStyle2.BackColor = System.Drawing.Color.OldLace;
            dataGridViewCellStyle2.ForeColor = System.Drawing.Color.Firebrick;
            dataGridViewCellStyle2.SelectionBackColor = System.Drawing.Color.LightCyan;
            dataGridViewCellStyle2.SelectionForeColor = System.Drawing.Color.Firebrick;
            this.Resend.DefaultCellStyle = dataGridViewCellStyle2;
            this.Resend.HeaderText = "Resend";
            this.Resend.Name = "Resend";
            this.Resend.Text = "Resend";
            this.Resend.ReadOnly = true;
            this.Resend.UseColumnTextForButtonValue = true;
            // 
            // Project_Name
            // 
            this.Project_Name.DefaultCellStyle = dataGridViewCellStyle2;
            this.Project_Name.DataPropertyName = "Project_Name";
            this.Project_Name.HeaderText = "Project Name";
            this.Project_Name.Name = "Project_Name";
            this.Project_Name.ReadOnly = true;
            // 
            // Subject
            // 
            this.Subject.DefaultCellStyle = dataGridViewCellStyle2;
            this.Subject.DataPropertyName = "Subject";
            this.Subject.HeaderText = "Subject";
            this.Subject.Name = "Subject";
            this.Subject.ReadOnly = true;
            // 
            // CC
            // 
            this.CC.DefaultCellStyle = dataGridViewCellStyle2;
            this.CC.DataPropertyName = "CC";
            this.CC.HeaderText = "CC";
            this.CC.Name = "CC";
            this.CC.ReadOnly = true;
            // 
            // BCC
            // 
            this.BCC.DefaultCellStyle = dataGridViewCellStyle2;
            this.BCC.DataPropertyName = "BCC";
            this.BCC.HeaderText = "BCC";
            this.BCC.Name = "BCC";
            this.BCC.ReadOnly = true;
            // 
            // To_Email_id
            // 
            this.To_Email_id.DefaultCellStyle = dataGridViewCellStyle2;
            this.To_Email_id.DataPropertyName = "To_Email_id";
            this.To_Email_id.HeaderText = "To Email id";
            this.To_Email_id.Name = "To_Email_id";
            this.To_Email_id.ReadOnly = true;
            // 
            // Attached_Files
            // 
            this.Attached_Files.DefaultCellStyle = dataGridViewCellStyle2;
            this.Attached_Files.DataPropertyName = "Attached_Files";
            this.Attached_Files.HeaderText = "Attached Files";
            this.Attached_Files.Name = "Attached_Files";
            this.Attached_Files.ReadOnly = true;
            // 
            // Body
            // 
            this.Body.DefaultCellStyle = dataGridViewCellStyle2;
            this.Body.DataPropertyName = "Body";
            this.Body.HeaderText = "Body";
            this.Body.Name = "Body";
            this.Body.ReadOnly = true;
            // 
            // Log_Time
            // 
            this.Log_Time.DefaultCellStyle = dataGridViewCellStyle2;
            this.Log_Time.DataPropertyName = "Log_Time";
            this.Log_Time.HeaderText = "Log Time";
            this.Log_Time.Name = "Log_Time";
            this.Log_Time.ReadOnly = true;
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.Color.Lavender;
            this.ClientSize = new System.Drawing.Size(1368, 529);
            this.Controls.Add(this.dataGridView);
            this.Controls.Add(this.button1);
            this.Controls.Add(this.isSuccess);
            this.Controls.Add(this.emailstatus);
            this.Controls.Add(this.dateTimePicker2);
            this.Controls.Add(this.todate);
            this.Controls.Add(this.fromdate);
            this.Controls.Add(this.dateTimePicker1);
            this.Name = "Form1";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Email_Form";
            this.WindowState = System.Windows.Forms.FormWindowState.Maximized;
            this.Load += new System.EventHandler(this.Form1_Load);
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.emailSettingsBindingSource)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.emailDetailsDataSetBindingSource)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.email_DetailsDataSet)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.emailLogsBindingSource)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.errorLogBindingSource)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

      
        private System.Windows.Forms.DateTimePicker dateTimePicker1;
        private System.Windows.Forms.Label fromdate;
        private System.Windows.Forms.Label todate;
        private System.Windows.Forms.DateTimePicker dateTimePicker2;
        private System.Windows.Forms.Label emailstatus;
        private System.Windows.Forms.ComboBox isSuccess;
        private System.Windows.Forms.DataGridView dataGridView;
        private System.Windows.Forms.BindingSource errorLogBindingSource;
        private System.Windows.Forms.BindingSource emailDetailsDataSetBindingSource;
        private Email_DetailsDataSet email_DetailsDataSet;
        private System.Windows.Forms.BindingSource emailSettingsBindingSource;
        private System.Windows.Forms.BindingSource emailLogsBindingSource;
        private System.Windows.Forms.Button button1;
        private DataGridViewButtonColumn Resend;
        private DataGridViewTextBoxColumn Project_Name;
        private DataGridViewTextBoxColumn Subject;
        private DataGridViewTextBoxColumn CC;
        private DataGridViewTextBoxColumn BCC;
        private DataGridViewTextBoxColumn To_Email_id;
        private DataGridViewTextBoxColumn Attached_Files;
        private DataGridViewTextBoxColumn Body;
        private DataGridViewTextBoxColumn Log_Time;

        public string Eid { get; private set; }
        public string project_Name { get; private set; }

        public string cc { get; private set; }
        public string bcc { get; private set; }
        public string to_Email_id { get; private set; }
        public string subject { get; private set; }
        public string SMTP_Server_Name { get; private set; }
        public int Port_no { get; private set; }
        public string From_Email_id { get; private set; }
        public string Password { get; private set; }
        public string body { get; private set; }
        public string Is_Success { get; private set; }
        public string Failure_Message { get; private set; }
        public DateTime Logg { get; private set; }
       
        public int Attempts { get; private set; }
        public string Enable_Password { get; private set; }
        public string Enable_SSL { get; private set; }
        public string attachment { get; private set; }
        public DateTime Start_Time { get; private set; }
    }
}

