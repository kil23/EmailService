using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using System.Net.Mail;
using System.Net.Mime;
using System.Text.RegularExpressions;

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
            string Eid = string.Format("{0:yyyyMMddHHmmssfff}", DateTime.Now);
            string Enable_SSL = "";
            string attachment = "C:\\Users\\Lenovo\\source\\repos\\Email Service\\Email\\Email\\bin\\Release\\Email_details.dll";
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
                string[] toEmails = to.Split(',');
                if (toEmails.Length > 0)
                {
                    foreach (string singleEmail in toEmails)
                    {
                        mail.To.Add(singleEmail);
                    }
                }
                else
                    mail.To.Add(to);

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
                
                Email_details.Class1.Insert( Eid, serverName, portNo, emailId, password, to, body, subject, "Y", "", DateTime.Now, Project_Name, Enable_SSL, txtUsePass.Checked.ToString(), 0, attachment, "", "");
                return true;
            }
            catch (InvalidOperationException ie)
            {
                if (ie.InnerException != null)
                {
                    txtErrorMessage.Text = ie.Message + "\n" + ie.InnerException;
                    failure_message = ie.Message + "\n" + ie.InnerException;
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
                    txtErrorMessage.Text = sre.Message + "\n" + sre.InnerException;
                    failure_message = sre.Message + "\n" + sre.InnerException;
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
                    txtErrorMessage.Text = se.Message + "\n" + se.InnerException;
                    failure_message = se.Message + "\n" + se.InnerException;
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
                    txtErrorMessage.Text = ex.Message + "\n" + ex.InnerException;
                    failure_message = ex.Message + "\n" + ex.InnerException;
                }
                else
                {
                    txtErrorMessage.Text = ex.Message;
                    failure_message = ex.Message;
                }

            }
            Email_details.Class1.Insert( Eid, serverName, portNo, emailId, password, to, body, subject, "N", failure_message, DateTime.Now, Project_Name,Enable_SSL, txtUsePass.Checked.ToString(), attempts, "null", "", "");
            return false;
        }
    }
}
