using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.OleDb;
using System.Data.SqlClient;
using System.Diagnostics;
using System.IO;
using System.Linq;
using System.Net.Mail;
using System.Net.Mime;
using System.ServiceProcess;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using System.Timers;
using System.Xml;
using System.Xml.Linq;

namespace Email
{
    public partial class EmailService : ServiceBase
    {

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

        public void ServiceFunction()
        {
            try
            {
                fnWriteErrorLog("Starting Service Now..", "");
                DataTable ds = new DataTable();
                DataTable deleteTable = new DataTable();
                string constr = "constr";
                OleDbConnection conn = new OleDbConnection(fnConnectionString(constr));
                fnWriteErrorLog("OleDB ConnectionString is checked. Its correct.", " ***SUCCESS*** ");
                DateTime dt = DateTime.Now;

                conn.Open();
                fnWriteErrorLog("OleDB Connection now Open", " ***SUCCESS*** ");

                string query = "Select * from Email_Settings Where Is_Success = 'N'";
                string query2 = "Select * from Email_Settings ";
                OleDbDataAdapter da = new OleDbDataAdapter(query, conn);
                OleDbDataAdapter da2 = new OleDbDataAdapter(query2, conn);
                da.Fill(ds);
                da2.Fill(deleteTable);
                fnWriteErrorLog("DataTables created with data..", " ***SUCCESS*** ");
                conn.Close();
                fnWriteErrorLog("OleDB Connection closed..", " ***SUCCESS*** ");

                for (int j = 0; deleteTable.Rows.Count > j; j++)
                {
                    string Eid2 = deleteTable.Rows[j]["Eid"].ToString();
                    string serverName2 = deleteTable.Rows[j]["SMTP_Server_Name"].ToString();
                    int portNo2 = (Int32)deleteTable.Rows[j]["Port_No"];
                    string emailId2 = deleteTable.Rows[j]["From_Email_id"].ToString();
                    string to2 = deleteTable.Rows[j]["To_Email_id"].ToString();

                    if (serverName2 == "" || portNo2 == 0 || to2 == "" || emailId2 == "")
                    {
                        Email_details.Class1.Del(Eid2);
                        fnWriteErrorLog("Row deleted from Database.", "Required fields are empty in this row..So deleting Database Entry \n***Delete Successful*** ");
                    }
                }

                for (int i = 0; ds.Rows.Count > i; i++)
                {
                    string Eid = ds.Rows[i]["Eid"].ToString();
                    string serverName = ds.Rows[i]["SMTP_Server_Name"].ToString();
                    int portNo = (Int32)ds.Rows[i]["Port_No"];
                    string emailId = ds.Rows[i]["From_Email_id"].ToString();
                    string password = ds.Rows[i]["Password"].ToString();
                    string to = ds.Rows[i]["To_Email_id"].ToString();
                    string body = ds.Rows[i]["Body"].ToString();
                    string subject = ds.Rows[i]["Subject"].ToString();
                    string attachmentfilename = ds.Rows[i]["Attachment"].ToString();
                    string Is_Success = ds.Rows[i]["Is_Success"].ToString();
                    string Failure_Message = ds.Rows[i]["Failure_Message"].ToString();
                    string Project_Name = ds.Rows[i]["Project_Name"].ToString();
                    int Attempts = (Int32)ds.Rows[i]["Attempts"];
                    string CC = ds.Rows[i]["CC"].ToString();
                    string BCC = ds.Rows[i]["BCC"].ToString();
                    string Enable_SSL = ds.Rows[i]["Enable_SSL"].ToString();
                    string Enable_Password = ds.Rows[i]["Enable_Password"].ToString();
                    DateTime start_time = (DateTime)ds.Rows[i]["Start_Time"];

                    if (Is_Success == "N" && Attempts > 0)
                    {
                        fnWriteErrorLog("Service process started", "Resending failed emails...");

                        string timer_path = string.Empty;
                        string timer = string.Empty;
                        timer_path = Path.GetDirectoryName(Process.GetCurrentProcess().MainModule.FileName) + "\\Config\\Webconfig.xml";
                        XDocument xmldoc = XDocument.Load(timer_path);
                        timer = xmldoc.Descendants("timer").First().Value;
                        Int32 time = Int32.Parse(timer);
                        DateTime curr_time = DateTime.Now;
                        Int32 time_difference = ((Int32)curr_time.Subtract(start_time).TotalMinutes);
                        if (time_difference >= time)
                        {
                            Attempts--;
                            start_time = DateTime.Now;
                        }
                        string failure_message = "";
                        string displayName = "";
                        try
                        {
                            MailMessage mail = new MailMessage();
                            SmtpClient smtp = new SmtpClient(serverName, portNo);
                            smtp.DeliveryMethod = SmtpDeliveryMethod.Network;

                            if (password != null)
                            {
                                smtp.EnableSsl = true;
                                smtp.Credentials = new System.Net.NetworkCredential(emailId, password);
                            }
                            else
                            {
                                smtp.UseDefaultCredentials = false;
                            }

                            smtp.Timeout = Convert.ToInt32(500000);
                            mail.From = new MailAddress(emailId, displayName);
                            string[] toEmails = to.Split(';');
                            if (toEmails.Length > 0)
                            {
                                foreach (string singleEmail in toEmails)
                                {
                                    mail.To.Add(singleEmail);
                                }
                            }
                            else
                            {
                                mail.To.Add(to);
                            }

                            string[] CCstr = CC.Split(';');
                            if (CCstr.Length > 0)
                            {
                                foreach (string ccstr in CCstr)
                                {
                                    mail.CC.Add(ccstr);
                                }
                            }
                            else
                            {
                                mail.CC.Add(CC);
                            }

                            string[] BCCstr = BCC.Split(';');
                            if (CCstr.Length > 0)
                            {
                                foreach (string bccstr in BCCstr)
                                {
                                    mail.Bcc.Add(bccstr);
                                }
                            }
                            else
                            {
                                mail.Bcc.Add(BCC);
                            }

                            mail.Subject = subject;

                            mail.IsBodyHtml = true;
                            mail.Body = body;

                            string[] attachments = attachmentfilename.Split(';');
                            if (attachments.Length > 0)
                            {
                                foreach (string singleAttachment in attachments)
                                {
                                    if (attachmentfilename != string.Empty)
                                    {
                                        mail.Attachments.Add(new Attachment(singleAttachment));
                                    }
                                }
                            }

                            smtp.Send(mail);
                            fnWriteErrorLog("Email sent...", " Updating Database entry using DLL \n ***SUCCESS*** ");
                            Email_details.Class1.Update(Eid, serverName, portNo, emailId, password, to, body, subject, "Y", "", DateTime.Now, Project_Name, Enable_SSL, Enable_Password, 0, attachmentfilename, CC, BCC, start_time);
                            fnWriteErrorLog("Database updated", " ***SUCCESS*** ");
                            continue;
                        }
                        catch (InvalidOperationException ie)
                        {
                            if (ie.InnerException != null)
                            {
                                failure_message = "To_Email: " + to + "\n InvalidOperationException " + ie.Message + Environment.NewLine + ie.InnerException;
                            }
                            else
                            {
                                failure_message = "To_Email: " + to + "\n InvalidOperationException " + ie.Message + Environment.NewLine + ie.StackTrace;
                            }

                        }
                        catch (SmtpFailedRecipientsException sre)
                        {
                            if (sre.InnerException != null)
                            {
                                failure_message = "To_Email: " + to + "\n SmtpFailedRecipientsException " + sre.Message + Environment.NewLine + sre.InnerException;
                            }
                            else
                            {
                                failure_message = "To_Email: " + to + "\n SmtpFailedRecipientsException " + sre.Message + Environment.NewLine + sre.StackTrace;
                            }

                        }
                        catch (SmtpException se)
                        {
                            if (se.InnerException != null)
                            {
                                failure_message = "To_Email: " + to + "\n SMTPException " + se.Message + Environment.NewLine + se.InnerException;
                            }
                            else
                            {
                                failure_message = "To_Email: " + to + "\n SMTPException " + se.Message + Environment.NewLine + se.StackTrace;
                            }

                        }
                        catch (Exception ex)
                        {
                            if (ex.InnerException != null)
                            {
                                failure_message = "To_Email: " + to + "\n" + ex.Message + Environment.NewLine + ex.InnerException;
                            }
                            else
                            {
                                failure_message = "To_Email: " + to + "\n" + ex.Message + Environment.NewLine + ex.StackTrace;
                            }

                        }
                        fnWriteErrorLog("Email NOT sent...", failure_message);
                        Email_details.Class1.Update(Eid, serverName, portNo, emailId, password, to, body, subject, "N", failure_message, DateTime.Now, Project_Name, Enable_SSL, Enable_Password, Attempts, attachmentfilename, CC, BCC, start_time);
                        fnWriteErrorLog("Database record updated for failure email...", "");
                    }
                }
                fnWriteErrorLog("Service execution completed..", "Exiting the Service.");
            }
            catch (Exception e)
            {
                string errMessage = e.Message + Environment.NewLine + e.StackTrace;
                fnWriteErrorLog("ERROR occurred", errMessage);
            }
        }

        public EmailService()
        {
            InitializeComponent();
        }

        protected override void OnStart(string[] args)
        {
            ServiceFunction();
        }

        protected override void OnStop()
        {
            try
            {

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
