using System;
using System.Drawing;
using System.Windows.Forms;

namespace EmailWindowsFormsApp
{
    partial class Form1
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.components = new System.ComponentModel.Container();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle1 = new System.Windows.Forms.DataGridViewCellStyle();
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
            this.email_SettingsTableAdapter = new EmailWindowsFormsApp.Email_DetailsDataSetTableAdapters.Email_SettingsTableAdapter();
            this.email_LogsTableAdapter = new EmailWindowsFormsApp.Email_DetailsDataSetTableAdapters.Email_LogsTableAdapter();
            this.button1 = new System.Windows.Forms.Button();
            this.Resend = new System.Windows.Forms.DataGridViewButtonColumn();
            this.projectNameDataGridViewTextBoxColumn1 = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.toEmailidDataGridViewTextBoxColumn1 = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.cCDataGridViewTextBoxColumn1 = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.bCCDataGridViewTextBoxColumn1 = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.subjectDataGridViewTextBoxColumn1 = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Attachment = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.bodyDataGridViewTextBoxColumn1 = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.logtime = new System.Windows.Forms.DataGridViewTextBoxColumn();
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
            this.dataGridView.AutoGenerateColumns = false;
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
            this.projectNameDataGridViewTextBoxColumn1,
            this.toEmailidDataGridViewTextBoxColumn1,
            this.cCDataGridViewTextBoxColumn1,
            this.bCCDataGridViewTextBoxColumn1,
            this.subjectDataGridViewTextBoxColumn1,
            this.Attachment,
            this.bodyDataGridViewTextBoxColumn1,
            this.logtime});
            this.dataGridView.DataSource = this.emailSettingsBindingSource;
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
            // emailSettingsBindingSource
            // 
            this.emailSettingsBindingSource.DataMember = "Email_Settings";
            this.emailSettingsBindingSource.DataSource = this.emailDetailsDataSetBindingSource;
            // 
            // emailDetailsDataSetBindingSource
            // 
            this.emailDetailsDataSetBindingSource.DataSource = this.email_DetailsDataSet;
            this.emailDetailsDataSetBindingSource.Position = 0;
            // 
            // email_DetailsDataSet
            // 
            this.email_DetailsDataSet.DataSetName = "Email_DetailsDataSet";
            this.email_DetailsDataSet.SchemaSerializationMode = System.Data.SchemaSerializationMode.IncludeSchema;
            // 
            // emailLogsBindingSource
            // 
            this.emailLogsBindingSource.DataMember = "Email_Logs";
            this.emailLogsBindingSource.DataSource = this.emailDetailsDataSetBindingSource;
            // 
            // errorLogBindingSource
            // 
            this.errorLogBindingSource.DataMember = "Error_Log";
            this.errorLogBindingSource.DataSource = this.emailDetailsDataSetBindingSource;
            // 
            // email_SettingsTableAdapter
            // 
            this.email_SettingsTableAdapter.ClearBeforeFill = true;
            // 
            // email_LogsTableAdapter
            // 
            this.email_LogsTableAdapter.ClearBeforeFill = true;
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
            this.Resend.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.DisplayedCells;
            this.Resend.HeaderText = "Resend";
            this.Resend.Name = "Resend";
            this.Resend.ReadOnly = true;
            this.Resend.Text = "Resend";
            this.Resend.UseColumnTextForButtonValue = true;
            this.Resend.Width = 73;
            // 
            // projectNameDataGridViewTextBoxColumn1
            // 
            this.projectNameDataGridViewTextBoxColumn1.DataPropertyName = "Project_Name";
            this.projectNameDataGridViewTextBoxColumn1.HeaderText = "Project Name";
            this.projectNameDataGridViewTextBoxColumn1.Name = "projectNameDataGridViewTextBoxColumn1";
            this.projectNameDataGridViewTextBoxColumn1.ReadOnly = true;
            // 
            // toEmailidDataGridViewTextBoxColumn1
            // 
            this.toEmailidDataGridViewTextBoxColumn1.DataPropertyName = "To_Email_id";
            this.toEmailidDataGridViewTextBoxColumn1.HeaderText = "To Email id";
            this.toEmailidDataGridViewTextBoxColumn1.Name = "toEmailidDataGridViewTextBoxColumn1";
            this.toEmailidDataGridViewTextBoxColumn1.ReadOnly = true;
            // 
            // cCDataGridViewTextBoxColumn1
            // 
            this.cCDataGridViewTextBoxColumn1.DataPropertyName = "CC";
            this.cCDataGridViewTextBoxColumn1.HeaderText = "CC";
            this.cCDataGridViewTextBoxColumn1.Name = "cCDataGridViewTextBoxColumn1";
            this.cCDataGridViewTextBoxColumn1.ReadOnly = true;
            // 
            // bCCDataGridViewTextBoxColumn1
            // 
            this.bCCDataGridViewTextBoxColumn1.DataPropertyName = "BCC";
            this.bCCDataGridViewTextBoxColumn1.HeaderText = "BCC";
            this.bCCDataGridViewTextBoxColumn1.Name = "bCCDataGridViewTextBoxColumn1";
            this.bCCDataGridViewTextBoxColumn1.ReadOnly = true;
            // 
            // subjectDataGridViewTextBoxColumn1
            // 
            this.subjectDataGridViewTextBoxColumn1.DataPropertyName = "Subject";
            this.subjectDataGridViewTextBoxColumn1.HeaderText = "Subject";
            this.subjectDataGridViewTextBoxColumn1.Name = "subjectDataGridViewTextBoxColumn1";
            this.subjectDataGridViewTextBoxColumn1.ReadOnly = true;
            // 
            // Attachment
            // 
            this.Attachment.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.AllCells;
            this.Attachment.DataPropertyName = "Attached Files";
            this.Attachment.HeaderText = "Attached Files";
            this.Attachment.Name = "Attachment";
            this.Attachment.ReadOnly = true;
            this.Attachment.Width = 152;
            // 
            // bodyDataGridViewTextBoxColumn1
            // 
            this.bodyDataGridViewTextBoxColumn1.DataPropertyName = "Body";
            this.bodyDataGridViewTextBoxColumn1.HeaderText = "Body";
            this.bodyDataGridViewTextBoxColumn1.Name = "bodyDataGridViewTextBoxColumn1";
            this.bodyDataGridViewTextBoxColumn1.ReadOnly = true;
            // 
            // logtime
            // 
            this.logtime.DataPropertyName = "Log Time";
            this.logtime.HeaderText = "Log Time";
            this.logtime.Name = "logtime";
            this.logtime.ReadOnly = true;
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

        #endregion

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
        private Email_DetailsDataSetTableAdapters.Email_SettingsTableAdapter email_SettingsTableAdapter;
        private System.Windows.Forms.BindingSource emailLogsBindingSource;
        private Email_DetailsDataSetTableAdapters.Email_LogsTableAdapter email_LogsTableAdapter;
        private System.Windows.Forms.Button button1;
        private DataGridViewButtonColumn Resend;
        private DataGridViewTextBoxColumn projectNameDataGridViewTextBoxColumn1;
        private DataGridViewTextBoxColumn toEmailidDataGridViewTextBoxColumn1;
        private DataGridViewTextBoxColumn cCDataGridViewTextBoxColumn1;
        private DataGridViewTextBoxColumn bCCDataGridViewTextBoxColumn1;
        private DataGridViewTextBoxColumn subjectDataGridViewTextBoxColumn1;
        private DataGridViewTextBoxColumn Attachment;
        private DataGridViewTextBoxColumn bodyDataGridViewTextBoxColumn1;
        private DataGridViewTextBoxColumn logtime;

        public string Eid { get; private set; }
        public string SMTP_Server_Name { get; private set; }
        public int Port_no { get; private set; }
        public string From_Email_id { get; private set; }
        public string Password { get; private set; }
        public string To_Email_id { get; private set; }
        public string CC { get; private set; }
        public string BCC { get; private set; }
        public string Subject { get; private set; }
        public string body { get; private set; }
        public string Is_Success { get; private set; }
        public string Failure_Message { get; private set; }
        public DateTime Logg { get; private set; }
        public string Project_Name { get; private set; }
        public int Attempts { get; private set; }
        public string Enable_Password { get; private set; }
        public string Enable_SSL { get; private set; }
        public string attachment { get; private set; }
        public DateTime Start_Time { get; private set; }
    }
}

