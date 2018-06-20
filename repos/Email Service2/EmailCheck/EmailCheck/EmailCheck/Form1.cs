using System;
using System.Windows.Forms;
using System.Net.Mail;

namespace EmailCheck
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void btnSend_Click(object sender, EventArgs e)
        {
            SendEmail(txtServerName.Text, Convert.ToInt32(txtPort.Text), txtFromEmailID.Text, txtPassword.Text, txtToEmailID.Text, txtBody.Text, "TEST EMAIL", "VTELEBYTE TEST EMAIL");
        }

        public bool SendEmail(string serverName, int portNo, string emailId, string password, string to, string body, string subject, string displayName)
        {

            int attempts = 4;
            string Project_Name = "abc";
            string failure_message;
            string CC="";
            string BCC="";
            string Eid = string.Format("{0:yyyyMMddHHmmssfff}", DateTime.Now);
            string Enable_SSL = "";
            string attachment = @"C:\Users\Lenovo\Downloads\Calci.txt";
            try
            {

                MailMessage mail = new MailMessage();
                SmtpClient smtp = new SmtpClient(serverName, portNo);
                smtp.DeliveryMethod = SmtpDeliveryMethod.Network;
              
                smtp.EnableSsl = false;
              
                if (txtUsePass.Checked == true)
                {
					smtp.EnableSsl = true;
                    smtp.Credentials = new System.Net.NetworkCredential(emailId, password);
                }
                else
                {
                    smtp.UseDefaultCredentials = false;
                }

                Enable_SSL = smtp.EnableSsl.ToString();

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

                string[] attachments = attachment.Split(';');
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

				//LinkedResource LinkedImage = new LinkedResource("LOGO.png");
				//LinkedImage.ContentId = "MyPic";
            
				//Patch for Thunderbird as suggested by Jorge Valencia in  the comment below
				//LinkedImage.ContentType = new ContentType(MediaTypeNames.Image.Jpeg);
				//Patch ends

				//AlternateView htmlView = AlternateView.CreateAlternateViewFromString("<img src=cid:MyPic>" + body, null, MediaTypeNames.Text.Html);
				//htmlView.LinkedResources.Add(LinkedImage);
				//mail.AlternateViews.Add(htmlView);

                smtp.Send(mail);
                MessageBox.Show("Mail Sent successfully");
                
                Email_details.Class1.Insert(serverName, portNo, emailId, password, to, body, subject, "Y", "", Project_Name, Enable_SSL, txtUsePass.Checked.ToString(), 0, attachment, CC, BCC);
                return true;
            }
            catch (InvalidOperationException ie)
            {
                if (ie.InnerException != null)
                {
                    txtErrorMessage.Text = ie.Message + Environment.NewLine + ie.InnerException;
                    failure_message = ie.Message + Environment.NewLine + ie.InnerException;
                }
                else
                {
                    txtErrorMessage.Text = ie.Message;
                    failure_message = ie.Message;
                }
                
            }
            catch (SmtpFailedRecipientsException sre)
            {
                if (sre.InnerException != null)
                {
                    txtErrorMessage.Text = sre.Message + Environment.NewLine + sre.InnerException;
                    failure_message = sre.Message + Environment.NewLine + sre.InnerException;
                }
                else
                {
                    txtErrorMessage.Text = sre.Message;
                    failure_message = sre.Message;
                }

            }
            catch (SmtpException se)
            {
                if (se.InnerException != null)
                {
                    txtErrorMessage.Text = se.Message + Environment.NewLine + se.InnerException;
                    failure_message = se.Message + Environment.NewLine + se.InnerException;
                }
                else
                {
                    txtErrorMessage.Text = se.Message;
                    failure_message = se.Message;
                }
               
            }
            catch (Exception ex)
            {
                if (ex.InnerException != null)
                {
                    txtErrorMessage.Text = ex.Message + Environment.NewLine + ex.InnerException;
                    failure_message = ex.Message + Environment.NewLine + ex.InnerException;
                }
                else
                {
                    txtErrorMessage.Text = ex.Message;
                    failure_message = ex.Message;
                }

            }
            Email_details.Class1.Insert(serverName, portNo, emailId, password, to, body, subject, "N", failure_message, Project_Name,Enable_SSL, txtUsePass.Checked.ToString(), attempts, attachment, CC, BCC);
            return false;
        }

        private void txtPort_TextChanged(object sender, EventArgs e)
        {

        }
    }
}
