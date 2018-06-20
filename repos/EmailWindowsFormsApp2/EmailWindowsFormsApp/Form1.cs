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

                table.Columns.Add("Attached_Files", typeof(System.String));
                table.Columns.Add("Log_Time", typeof(System.String));
                for (int i = 0; table.Rows.Count > i; i++)
                {
                    IFormatProvider culture = new CultureInfo("en-US", true);
                    string d = ((DateTime)table.Rows[i]["Logg"]).ToString("dd/MM/yyyy HH:mm:ss", CultureInfo.InvariantCulture);
                    DateTime log = DateTime.ParseExact(d, "dd/MM/yyyy HH:mm:ss", culture);
                    table.Rows[i]["Log_Time"] = d;
                    

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
                    table.Rows[i]["Attached_Files"] = attach;
                }
                
                DataTable dt = table.DefaultView.ToTable(false, "Project_Name", "To_Email_id", "Subject", "CC", "BCC", "Attached_Files", "Body", "Log_Time");
                
                bindingSource = new BindingSource();
                bindingSource.DataSource = dt;
                dataGridView.DataSource = bindingSource;

                
                bindingSource.ResetBindings(true);

                dataGridView.AutoResizeColumns(DataGridViewAutoSizeColumnsMode.DisplayedCells);
                
            }
            catch (SqlException e)
            {
                fnWriteErrorLog("Error while binding.. ", e.Message);
            }
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            dataGridView.DataSource = bindingSource;
            dateTimePicker1.Value = DateTime.Now.Date.AddDays(-30);
            dateTimePicker2.Value = DateTime.Now;
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
                        attachment = table.Rows[i]["Attachment"].ToString();
                        Eid = table.Rows[i]["Eid"].ToString();
                        
                        project_Name = row.Cells[1].Value.ToString();
                        to_Email_id = row.Cells[2].Value.ToString();
                        cc = row.Cells[3].Value.ToString();
                        bcc = row.Cells[4].Value.ToString();
                        subject = row.Cells[5].Value.ToString();
                        body = row.Cells[7].Value.ToString();
                        Failure_Message = "";
                        string d0 = row.Cells[8].Value.ToString();
                        Logg= DateTime.ParseExact(d0, "dd/MM/yyyy HH:mm:ss", CultureInfo.InvariantCulture);

                        displayForm df = new displayForm(Eid, serverName, portNo, emailId, password, to_Email_id, cc, bcc, subject,
                            body, Is_Success, Failure_Message, Logg, project_Name, Attempts, Enable_Password, Enable_SSL, attachment, start_time);
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
