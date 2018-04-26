using System;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.IO;
using System.Windows.Forms;
using System.Xml;


namespace EmailWindowsFormsApp
{
    public partial class Form1 : Form
    {
        private SqlDataAdapter dataAdapter = new SqlDataAdapter();
        private BindingSource bindingSource = new BindingSource();
        private DateTime d2;
        private DateTime d1;
        private string status;
        DataTable table;
        static void fnWriteErrorLog(string src, string description)
        {
            GC.Collect();
            GC.WaitForPendingFinalizers();
            string path = System.IO.Path.GetDirectoryName(System.Diagnostics.Process.GetCurrentProcess().MainModule.FileName) + "\\ErrorLog\\";
            StreamWriter errorlog = new StreamWriter(path + DateTime.Now.ToString("yyyy-MM-dd") + ".txt", true); errorlog.AutoFlush = true;
            errorlog.WriteLine("=============================================================================================================");
            errorlog.WriteLine("Source: " + src);
            errorlog.WriteLine("Date: " + DateTime.Now.ToString("dd MMMM yyyy hh:mm tt"));
            errorlog.WriteLine("Description: " + description);
            errorlog.Close();
        }

        static string fnConnectionString(string str)
        {
            try
            {
                string path = string.Empty;
                string xmldoc = string.Empty;
                string ans = string.Empty;
                path = System.IO.Path.GetDirectoryName(System.Diagnostics.Process.GetCurrentProcess().MainModule.FileName) + "\\Config\\Webconfig.xml";
                xmldoc = File.ReadAllText(path);
                XmlReader reader = XmlReader.Create(new StringReader(xmldoc));
                try
                {
                    reader.ReadToFollowing("Settings");
                    reader.MoveToNextAttribute();

                    if (str == "constr")
                    {
                        reader.ReadToFollowing("connectionStrings");
                        ans = reader.ReadElementContentAsString();
                    }
                    else if (str == "SQLconstr")
                    {
                        reader.ReadToFollowing("SQLconnectionStrings");
                        ans = reader.ReadElementContentAsString();
                    }
                    return ans;
                }
                finally
                {
                    if (reader != null)
                    {
                        reader.Close();
                    }
                }
            }
            catch (Exception ex)
            {
                fnWriteErrorLog("ConnectionString is incorrect", ex.Message + @"\nIt must be like this : - 'Data Source=SHRUTIKA-PC\SQLEXPRESS; Database=dbEmailService;Trusted_Connection=True;user id = sa;password=12345;'");
                return "";
            }
        }


        public Form1()
        {
            InitializeComponent();
            d1 = this.dateTimePicker1.Value.Date;
            d2 = this.dateTimePicker2.Value.Date;
            status = this.isSuccess.GetItemText(this.isSuccess.SelectedItem);
            GetData(d1, d2, status);
        }

        private void GetData(DateTime d1, DateTime d2, string status)
        {
            try
            {
                string sel = "";
                if (status == "Success")
                {
                    sel = "Y";
                    Resend.Visible = false;
                }
                else
                {
                    sel = "N";
                    Resend.Visible = true;
                }


                
                string selectCommand = "Select * from Email_Settings Where Is_Success = '" + sel + "' AND Logg BETWEEN '" + d1 + "' AND '" + d2.Date.AddDays(1) + "'";
                string str = "SQLconstr";
                dataAdapter = new SqlDataAdapter(selectCommand, fnConnectionString(str));
                SqlCommandBuilder commandBuilder = new SqlCommandBuilder(dataAdapter);
                // bindingSource.DataSource = null;
                dataGridView.Update();
                // Populate a new data table and bind it to the BindingSource.
                table = new DataTable();
                table.Locale = System.Globalization.CultureInfo.InvariantCulture;
                dataAdapter.Fill(table);

                table.Columns.Add("Attached Files", typeof(System.String));
                table.Columns.Add("Log Time", typeof(System.String));
                for (int i = 0; table.Rows.Count > i; i++)
                {
                    //DateTime log, s_time;
                    //DateTime logg = (DateTime)table.Rows[i]["Logg"];
                    //DateTime start = (DateTime)table.Rows[i]["Start_Time"];
                    //bool testLog = DateTime.TryParseExact(logg.ToString(), "dd/MM/yyyy HH:mm:ss", CultureInfo.InvariantCulture, DateTimeStyles.None, out log);
                    //bool testStart = DateTime.TryParseExact(start.ToString(), "dd/MM/yyyy HH:mm:ss", CultureInfo.InvariantCulture, DateTimeStyles.None, out s_time);
                    IFormatProvider culture = new CultureInfo("en-US", true);
                    string d = ((DateTime)table.Rows[i]["Logg"]).ToString("dd/MM/yyyy HH:mm:ss", CultureInfo.InvariantCulture);
                    DateTime log = DateTime.ParseExact(d, "dd/MM/yyyy HH:mm:ss", culture);
                    //DateTime s_time = DateTime.ParseExact(start.ToString(), "dd/MM/yyyy HH:mm:ss", culture);
                    table.Rows[i]["Log Time"] = d;
                    //if (testLog && testStart)
                    //{
                    //    table.Rows[i]["Logg"] = log;
                    //    table.Rows[i]["Start_Time"] = s_time;
                    //}

                    string attachment = table.Rows[i]["Attachment"].ToString() ;
                    string attach = "";
                    string[] attachments = attachment.Split(';');
                    int j = attachments.Length;
                    while (j>0)
                    {
                        foreach (string Attach in attachments)
                        {
                            if (j > 1) { attach = attach + Path.GetFileName(Attach) + ","; }
                            else { attach = attach + Path.GetFileName(Attach); }
                            j--;
                        }
                    }
                    table.Rows[i]["Attached Files"] = attach;
                }

                bindingSource.DataSource = new DataTable();
                bindingSource.DataSource = table;

                // Resize the DataGridView columns to fit the newly loaded content.
                dataGridView.AutoResizeColumns(DataGridViewAutoSizeColumnsMode.DisplayedCells);
                //for (int i = 0; i < this.dataGridView.Rows.Count; i++)
                //{
                //    this.dataGridView.AutoResizeRow(i) ;
                //}
            }
            catch (SqlException e)
            {
                fnWriteErrorLog("Error while binding.. ", e.Message);
            }
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            // TODO: This line of code loads data into the 'email_DetailsDataSet.Email_Logs' table. You can move, or remove it, as needed.
            this.email_LogsTableAdapter.Fill(this.email_DetailsDataSet.Email_Logs);
            // TODO: This line of code loads data into the 'email_DetailsDataSet.Email_Settings' table. You can move, or remove it, as needed.
            this.email_SettingsTableAdapter.Fill(this.email_DetailsDataSet.Email_Settings);
            dataGridView.DataSource = bindingSource;
            dateTimePicker1.Value = DateTime.Now.Date.AddDays(-30);
            dateTimePicker2.Value = DateTime.Now.Date.AddDays(1);
        }

        private void button1_Click(object sender, EventArgs e)
        {
            
            d1 = this.dateTimePicker1.Value.Date;
            d2 = this.dateTimePicker2.Value.Date;
            status = this.isSuccess.GetItemText(this.isSuccess.SelectedItem);
            GetData(d1, d2, status);
        }

        private void dataGridView_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            try
            {
                if (dataGridView.Columns.Contains("Resend") && e.ColumnIndex == dataGridView.Columns["Resend"].Index)
                {
                    int i = e.RowIndex;
                    dataGridView.Rows[i].Selected = true;
                   
                    

                    foreach (DataGridViewRow row in dataGridView.SelectedRows)
                    {
                        string serverName = table.Rows[i]["SMTP_Server_Name"].ToString();
                        int portNo = (Int32)table.Rows[i]["Port_No"];
                        string emailId = table.Rows[i]["From_Email_id"].ToString();
                        string password = table.Rows[i]["Password"].ToString();
                        string Is_Success = table.Rows[i]["Is_Success"].ToString();
                        int Attempts = (Int32)table.Rows[i]["Attempts"];
                        string Enable_SSL = table.Rows[i]["Enable_SSL"].ToString();
                        string Enable_Password = table.Rows[i]["Enable_Password"].ToString();
                        DateTime start_time = (DateTime)table.Rows[i]["Start_Time"];
                        attachment = table.Rows[i]["Attached Files"].ToString();
                        Eid = table.Rows[i]["Eid"].ToString();

                        Project_Name = row.Cells[1].Value.ToString();
                        To_Email_id = row.Cells[2].Value.ToString();
                        CC = row.Cells[3].Value.ToString();
                        BCC = row.Cells[4].Value.ToString();
                        Subject = row.Cells[5].Value.ToString();
                        body = row.Cells[7].Value.ToString();
                        Failure_Message = "";
                        Logg = (DateTime)row.Cells[8].Value;

                        displayForm df = new displayForm(Eid, serverName, portNo, emailId, password, To_Email_id, CC, BCC, Subject,
                            body, Is_Success, Failure_Message, Logg, Project_Name, Attempts, Enable_Password, Enable_SSL, attachment, start_time);
                        df.ShowDialog();
                        bindingSource.ResetBindings(true);
                        GetData(d1,d2,status);
                    }
                }
            }
            catch(Exception ex)
            {
                fnWriteErrorLog("Error while operating Resend form...", ex.Message);
            }

        }
    }


}
