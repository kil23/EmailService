using System;
using System.Diagnostics;
using System.IO;
using System.Linq;
using System.Net.Mail;
using System.Windows.Forms;
using System.Xml.Linq;

namespace EmailWindowsFormsApp
{
    public partial class displayForm : Form
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

        string subject = "";
        string Eid = "";
        DateTime start_time;
        string[] attachments = { };
        string attachment = "";
        string attach = "";
        public displayForm(string eid, string SMTP_Server_Name, int Port_no, string From_Email_id, string Password, string To_Email_id, string CC,
            string BCC, string Subject, string body, string Is_Success, string Failure_Message, DateTime Logg, string Project_Name, int Attempts,
            string Enable_Password, string Enable_SSL, string Attachment, DateTime Start_Time)
        {
            InitializeComponent();
            attachments = Attachment.Split(';');
            foreach (string Attach in attachments)
            {
                if (attachments.Length > 1) { attach = Path.GetFileName(Attach) + "," ; }
                else { attach = Path.GetFileName(Attach); }
            }
            label2.Text = SMTP_Server_Name.ToString();
            label4.Text = Port_no.ToString(); 
            label6.Text = CC.ToString(); 
            label8.Text = From_Email_id.ToString(); 
            label10.Text = To_Email_id.ToString(); 
            label12.Text = BCC.ToString();
            label14.Text = Password.ToString();
            label16.Text = Enable_SSL.ToString();
            label18.Text = Attempts.ToString();
            label20.Text = Enable_Password.ToString();
            label22.Text = attach;
            body_tb.Text = body;
            fm_tb.Text = "";
            label26.Text = Logg.ToString();
            subject = Subject;
            Eid = eid;
            start_time = Start_Time;
            attachment = Attachment;
        }
        
        private void Send_btn_Click(object sender, EventArgs e)
        {
            string to = to = label10.Text;
            string failure_message = fm_tb.Text;
            string project_Name = "abc";
            int attempts = Convert.ToInt32(label18.Text);
            string serverName = label2.Text;
            int portNo = Convert.ToInt32(label4.Text);
            string emailId = label8.Text;
            string password = label14.Text;
            string body = body_tb.Text;
            string cc = label6.Text;
            string bcc = label12.Text;
            string enable_ssl = label16.Text;
            string enable_password = label20.Text;
            string displayName = "";
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
                attempts--;
                start_time = DateTime.Now;
            }
            try
            {
                MailMessage mail = new MailMessage();
                SmtpClient smtp = new SmtpClient(serverName, portNo);
                smtp.DeliveryMethod = SmtpDeliveryMethod.Network;

                smtp.EnableSsl = false;

                if (password != null)
                {
                    smtp.EnableSsl = true;
                    smtp.Credentials = new System.Net.NetworkCredential(emailId, password);
                }
                else
                {
                    smtp.UseDefaultCredentials = false;
                }

                enable_ssl = smtp.EnableSsl.ToString();

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
                    mail.To.Add(to);

                if (attachments.Length > 0)
                {
                    foreach (string singleAttachment in attachments)
                    {
                        if (attachment != string.Empty)
                        {
                            mail.Attachments.Add(new Attachment(singleAttachment));
                        }
                    }
                }

                mail.Subject = subject;

                mail.IsBodyHtml = true;

                mail.Body = body;


                smtp.Send(mail);
                
                Email_details.Class1.Update(Eid, serverName, portNo, emailId, password, to, body, subject, "Y", "", DateTime.Now, project_Name, enable_ssl, enable_password, 0, attachment, cc, bcc, start_time);
                fnWriteErrorLog("Mail Sent and Database is updated", " ***SUCCESS*** ");
                DialogResult dialog =MessageBox.Show("Mail Sent successfully");
                if (dialog == DialogResult.OK)
                {
                    ActiveForm.Close();
                }
                return;
            }
            catch (InvalidOperationException ie)
            {
                if (ie.InnerException != null)
                {
                    fm_tb.Text = ie.Message + Environment.NewLine + ie.InnerException;
                    failure_message = "To_Email: " + to + "\n InvalidOperationException " + ie.Message + Environment.NewLine + ie.InnerException;
                }
                else
                {
                    fm_tb.Text = ie.Message;
                    failure_message = "To_Email: " + to + "\n InvalidOperationException " + ie.Message + Environment.NewLine + ie.StackTrace;
                }

            }
            catch (SmtpFailedRecipientsException sre)
            {
                if (sre.InnerException != null)
                {
                    fm_tb.Text = sre.Message + Environment.NewLine + sre.InnerException;
                    failure_message = "To_Email: " + to + "\n SmtpFailedRecipientsException " + sre.Message + Environment.NewLine + sre.InnerException;
                }
                else
                {
                    fm_tb.Text = sre.Message;
                    failure_message = "To_Email: " + to + "\n SmtpFailedRecipientsException " + sre.Message + Environment.NewLine + sre.StackTrace;
                }

            }
            catch (SmtpException se)
            {
                if (se.InnerException != null)
                {
                    fm_tb.Text = se.Message + Environment.NewLine + se.InnerException;
                    failure_message = "To_Email: " + to + "\n SMTPException " + se.Message + Environment.NewLine + se.InnerException;
                }
                else
                {
                    fm_tb.Text = se.Message;
                    failure_message = "To_Email: " + to + "\n SMTPException " + se.Message + Environment.NewLine + se.StackTrace;
                }

            }
            catch (Exception ex)
            {
                if (ex.InnerException != null)
                {
                    fm_tb.Text = ex.Message + Environment.NewLine + ex.InnerException;
                    failure_message = "To_Email: " + to + "\n" +ex.Message + Environment.NewLine + ex.InnerException;
                }
                else
                {
                    fm_tb.Text = ex.Message;
                    failure_message = "To_Email: " + to + "\n" + ex.Message + Environment.NewLine + ex.StackTrace;
                }

            }
            MessageBox.Show("Mail NOT sent");
            Email_details.Class1.Update(Eid, serverName, portNo, emailId, password, to, body, subject, "N", failure_message, DateTime.Now, project_Name, enable_ssl, enable_password, attempts, attachment, cc, bcc, start_time);
            fnWriteErrorLog("Email NOT sent", " Database record is updated for failure email...");
        }
    }
}
