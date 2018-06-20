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

namespace Email
{
    public partial class EmailService : ServiceBase
    {
        //private System.Timers.Timer timer;
        //private System.Threading.Timer _timer = null;
        private System.Timers.Timer _timer;

        static void fnWriteErrorLog(string errMsg)
        {
            GC.Collect();
            GC.WaitForPendingFinalizers();
            StreamWriter errorlog = new StreamWriter("G:\\vspl projects\\Email\\Email\\bin\\Release\\ErrorLog" + DateTime.Now.ToString("yyyy-MM-dd") + ".txt", true);
            errorlog.AutoFlush = true;
            errorlog.WriteLine(DateTime.Now.ToString("hh.mm") + " = " + errMsg);
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
                fnWriteErrorLog(ex.Message);
                return "";
            }
        }

        public void ServiceFunction()
        {
            try
            {
                DataTable ds = new DataTable();
                DataTable deleteTable = new DataTable();
                string constr = "constr";
                OleDbConnection conn = new OleDbConnection(fnConnectionString(constr));

                DateTime dt = DateTime.Now;

                conn.Open();

                string query = "Select * from Email_Settings Where Is_Success = 'N'";
                string query2 = "Select * from Email_Settings ";

                OleDbDataAdapter da = new OleDbDataAdapter(query, conn);
                OleDbDataAdapter da2 = new OleDbDataAdapter(query2, conn);
                da.Fill(ds);
                da2.Fill(deleteTable);
                conn.Close();
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
                    string Is_Success = ds.Rows[i]["Is_Success"].ToString();
                    string Failure_Message = ds.Rows[i]["Failure_Message"].ToString();
                    string Project_Name = ds.Rows[i]["Project_Name"].ToString();
                    int Attempts = (Int32)ds.Rows[i]["Attempts"];
                    string CC = ds.Rows[i]["CC"].ToString();
                    string BCC = ds.Rows[i]["BCC"].ToString();
                    string Enable_SSL = ds.Rows[i]["Enable_SSL"].ToString();


                    if (Is_Success == "N" && Attempts > -1)
                    {
                        Attempts--;

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
                            string[] toEmails = to.Split(',');
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

                            mail.Subject = subject;

                            mail.IsBodyHtml = true;
                            mail.Body = body;

                            smtp.Send(mail);
                            Email_details.Class1.Update(Eid, "Y", "", DateTime.Now, 0);
                            // break;
                            continue;
                        }
                        catch (InvalidOperationException ie)
                        {
                            if (ie.InnerException != null)
                            {
                                failure_message = ie.Message + "\n" + ie.InnerException;
                            }
                            else
                            {
                                failure_message = ie.Message;
                            }

                        }
                        catch (SmtpFailedRecipientsException sre)
                        {
                            if (sre.InnerException != null)
                            {
                                failure_message = sre.Message + "\n" + sre.InnerException;
                            }
                            else
                            {
                                failure_message = sre.Message;
                            }

                        }
                        catch (SmtpException se)
                        {
                            if (se.InnerException != null)
                            {
                                failure_message = se.Message + "\n" + se.InnerException;
                            }
                            else
                            {
                                failure_message = se.Message;
                            }

                        }
                        catch (Exception ex)
                        {
                            if (ex.InnerException != null)
                            {
                                failure_message = ex.Message + "\n" + ex.InnerException;
                            }
                            else
                            {
                                failure_message = ex.Message;
                            }

                        }
                        Email_details.Class1.Update(Eid, "N", failure_message, DateTime.Now, Attempts);
                    }


                }
            }
            catch(Exception ex)
            {
                fnWriteErrorLog(ex.Message);
            }
        }

        public EmailService()
        {
            InitializeComponent();
        }

        private void SetupProcessingTimer()
        {
            _timer = new System.Timers.Timer();
            _timer.AutoReset = true;
            double interval = 1.0;
            _timer.Interval = interval * 5000;
            _timer.Enabled = true;
            _timer.Elapsed += new ElapsedEventHandler(OnTimedEvent);
        }

        private void OnTimedEvent(object source, ElapsedEventArgs e)
        {
           
            ServiceFunction();
        }

        protected override void OnStart(string[] args)
        {
            ServiceFunction();
        }

        protected override void OnStop()
        {
            
        }
    }
}
