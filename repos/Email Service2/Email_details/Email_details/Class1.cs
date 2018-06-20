using System;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Xml;

namespace Email_details
{
    public class Class1
    {

        //ErrorLog
        static void fnWriteErrorLog(string src , string description)
        {
            GC.Collect();
            GC.WaitForPendingFinalizers();
            string path = Path.GetDirectoryName(System.Diagnostics.Process.GetCurrentProcess().MainModule.FileName) + "\\ErrorLog\\";
            StreamWriter errorlog = new StreamWriter(path + DateTime.Now.ToString("yyyy-MM-dd") + ".txt", true); errorlog.AutoFlush = true;
            errorlog.WriteLine("=============================================================================================================");
            errorlog.WriteLine("Source: "+src);
            errorlog.WriteLine("Date: "+DateTime.Now.ToString("dd MMMM yyyy hh:mm tt"));
            errorlog.WriteLine("Description: "+description);
            errorlog.Close();
        }

        //ConnectionString
        static string fnConnectionString(string str)
        {
            try
            {
                string path = string.Empty;
                string xmldoc = string.Empty;
                string ans = string.Empty;
                path = Path.GetDirectoryName(System.Diagnostics.Process.GetCurrentProcess().MainModule.FileName) + "\\Config\\Webconfig.xml";
                xmldoc = File.ReadAllText(path);
                XmlReader reader = XmlReader.Create(new StringReader(xmldoc));
                try
                {
                    reader.ReadToFollowing("Settings");
                    reader.MoveToNextAttribute();

                    if (str == "SQLconstr")
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

        public static void EmailLog(string Eid, string SMTP_Server_Name, int Port_No, string From_Email_id, string Password, string To_Email_id, string Body,
            string Subject, string Is_Success, string Failure_Message, DateTime Logg, string Project_Name, string Enable_SSL, string Enable_Password,
            int Attempts, string Attachment, string CC, string BCC, DateTime start_time)
        {
            try
            {
                string SQLstr = "SQLconstr";
                using (SqlConnection connection = new SqlConnection(fnConnectionString(SQLstr)))
                {
                    SqlCommand command = new SqlCommand();

                    command = new SqlCommand("Error_Log", connection);

                    command.CommandType = CommandType.StoredProcedure;

                    SqlParameter p1 = new SqlParameter();
                    p1.ParameterName = "@Eid";
                    p1.SqlDbType = SqlDbType.NVarChar;
                    p1.Direction = ParameterDirection.Input;
                    p1.Value = Eid;

                    SqlParameter p2 = new SqlParameter();
                    p2.ParameterName = "@SMTP_Server_Name";
                    p2.SqlDbType = SqlDbType.NVarChar;
                    p2.Direction = ParameterDirection.Input;
                    p2.Value = SMTP_Server_Name;

                    SqlParameter p3 = new SqlParameter();
                    p3.ParameterName = "@Port_No";
                    p3.SqlDbType = SqlDbType.Int;
                    p3.Direction = ParameterDirection.Input;
                    p3.Value = Port_No;

                    SqlParameter p4 = new SqlParameter();
                    p4.ParameterName = "@From_Email_id";
                    p4.SqlDbType = SqlDbType.NVarChar;
                    p4.Direction = ParameterDirection.Input;
                    p4.Value = From_Email_id;

                    SqlParameter p5 = new SqlParameter();
                    p5.ParameterName = "@Password";
                    p5.SqlDbType = SqlDbType.NVarChar;
                    p5.Direction = ParameterDirection.Input;
                    p5.Value = Password;

                    SqlParameter p6 = new SqlParameter();
                    p6.ParameterName = "@To_Email_id";
                    p6.SqlDbType = SqlDbType.NVarChar;
                    p6.Direction = ParameterDirection.Input;
                    p6.Value = To_Email_id;

                    SqlParameter p7 = new SqlParameter();
                    p7.ParameterName = "@CC";
                    p7.SqlDbType = SqlDbType.NVarChar;
                    p7.Direction = ParameterDirection.Input;
                    p7.Value = CC;

                    SqlParameter p8 = new SqlParameter();
                    p8.ParameterName = "@BCC";
                    p8.SqlDbType = SqlDbType.NVarChar;
                    p8.Direction = ParameterDirection.Input;
                    p8.Value = BCC;

                    SqlParameter p9 = new SqlParameter();
                    p9.ParameterName = "@Subject";
                    p9.SqlDbType = SqlDbType.NVarChar;
                    p9.Direction = ParameterDirection.Input;
                    p9.Value = Subject;

                    SqlParameter p10 = new SqlParameter();
                    p10.ParameterName = "@Body";
                    p10.SqlDbType = SqlDbType.NVarChar;
                    p10.Direction = ParameterDirection.Input;
                    p10.Value = Body;

                    SqlParameter p11 = new SqlParameter();
                    p11.ParameterName = "@Is_Success";
                    p11.SqlDbType = SqlDbType.NVarChar;
                    p11.Direction = ParameterDirection.Input;
                    p11.Value = Is_Success;

                    SqlParameter p12 = new SqlParameter();
                    p12.ParameterName = "@Failure_Message";
                    p12.SqlDbType = SqlDbType.NVarChar;
                    p12.Direction = ParameterDirection.Input;
                    p12.Value = Failure_Message;

                    SqlParameter p13 = new SqlParameter();
                    p13.ParameterName = "@Logg";
                    p13.SqlDbType = SqlDbType.DateTime;
                    p13.Direction = ParameterDirection.Input;
                    p13.Value = Logg;

                    SqlParameter p14 = new SqlParameter();
                    p14.ParameterName = "@Project_Name";
                    p14.SqlDbType = SqlDbType.NVarChar;
                    p14.Direction = ParameterDirection.Input;
                    p14.Value = Project_Name;

                    SqlParameter p15 = new SqlParameter();
                    p15.ParameterName = "@Attempts";
                    p15.SqlDbType = SqlDbType.Int;
                    p15.Direction = ParameterDirection.Input;
                    p15.Value = Attempts;

                    SqlParameter p16 = new SqlParameter();
                    p16.ParameterName = "@Enable_Password";
                    p16.SqlDbType = SqlDbType.NVarChar;
                    p16.Direction = ParameterDirection.Input;
                    p16.Value = Enable_Password;

                    SqlParameter p17 = new SqlParameter();
                    p17.ParameterName = "@Enable_SSL";
                    p17.SqlDbType = SqlDbType.NVarChar;
                    p17.Direction = ParameterDirection.Input;
                    p17.Value = Enable_SSL;

                    SqlParameter p18 = new SqlParameter();
                    p18.ParameterName = "@Attachment";
                    p18.SqlDbType = SqlDbType.NVarChar;
                    p18.Direction = ParameterDirection.Input;
                    p18.Value = Attachment;

                    SqlParameter p19 = new SqlParameter();
                    p19.ParameterName = "@Start_Time";
                    p19.SqlDbType = SqlDbType.DateTime;
                    p19.Direction = ParameterDirection.Input;
                    p19.Value = start_time;

                    command.Parameters.Add(p1);
                    command.Parameters.Add(p2);
                    command.Parameters.Add(p3);
                    command.Parameters.Add(p4);
                    command.Parameters.Add(p5);
                    command.Parameters.Add(p6);
                    command.Parameters.Add(p7);
                    command.Parameters.Add(p8);
                    command.Parameters.Add(p9);
                    command.Parameters.Add(p10);
                    command.Parameters.Add(p11);
                    command.Parameters.Add(p12);
                    command.Parameters.Add(p13);
                    command.Parameters.Add(p14);
                    command.Parameters.Add(p15);
                    command.Parameters.Add(p16);
                    command.Parameters.Add(p17);
                    command.Parameters.Add(p18);
                    command.Parameters.Add(p19);

                    connection.Open();
                    command.ExecuteNonQuery();
                    connection.Close();

                }
            }
            catch (SqlException ex)
            {
                string errMessage = ex.Message + Environment.NewLine + ex.StackTrace;
                fnWriteErrorLog("Error in EmailLog Function of DLL ", errMessage);
                throw;
            }
        }

        public static void Insert(string SMTP_Server_Name, int Port_No, string From_Email_id, string Password, string To_Email_id, string Body, 
            string Subject, string Is_Success, string Failure_Message, string Project_Name,string Enable_SSL, string Enable_Password, 
            int Attempts, string Attachment, string CC, string BCC)
        {   
            try
            {
                string Eid = string.Format("{0:yyyyMMddHHmmssfff}", DateTime.Now);
                DateTime Logg = DateTime.Now;
                DateTime start_time = DateTime.Now;

                string SQLstr = "SQLconstr";
                using (SqlConnection connection = new SqlConnection(fnConnectionString(SQLstr)))
                {
                    SqlCommand command = new SqlCommand();
                   
                    command = new SqlCommand("Email_Detail", connection);
                  
                    command.CommandType = CommandType.StoredProcedure;

                    SqlParameter p1 = new SqlParameter();
                    p1.ParameterName = "@Eid";
                    p1.SqlDbType = SqlDbType.NVarChar;
                    p1.Direction = ParameterDirection.Input;
                    p1.Value = Eid;

                    SqlParameter p2 = new SqlParameter();
                    p2.ParameterName = "@SMTP_Server_Name";
                    p2.SqlDbType = SqlDbType.NVarChar;
                    p2.Direction = ParameterDirection.Input;
                    p2.Value = SMTP_Server_Name;

                    SqlParameter p3 = new SqlParameter();
                    p3.ParameterName = "@Port_No";
                    p3.SqlDbType = SqlDbType.Int;
                    p3.Direction = ParameterDirection.Input;
                    p3.Value = Port_No;

                    SqlParameter p4 = new SqlParameter();
                    p4.ParameterName = "@From_Email_id";
                    p4.SqlDbType = SqlDbType.NVarChar;
                    p4.Direction = ParameterDirection.Input;
                    p4.Value = From_Email_id;

                    SqlParameter p5 = new SqlParameter();
                    p5.ParameterName = "@Password";
                    p5.SqlDbType = SqlDbType.NVarChar;
                    p5.Direction = ParameterDirection.Input;
                    p5.Value = Password;

                    SqlParameter p6 = new SqlParameter();
                    p6.ParameterName = "@To_Email_id";
                    p6.SqlDbType = SqlDbType.NVarChar;
                    p6.Direction = ParameterDirection.Input;
                    p6.Value = To_Email_id;

                    SqlParameter p7 = new SqlParameter();
                    p7.ParameterName = "@CC";
                    p7.SqlDbType = SqlDbType.NVarChar;
                    p7.Direction = ParameterDirection.Input;
                    p7.Value = CC;

                    SqlParameter p8 = new SqlParameter();
                    p8.ParameterName = "@BCC";
                    p8.SqlDbType = SqlDbType.NVarChar;
                    p8.Direction = ParameterDirection.Input;
                    p8.Value = BCC;

                    SqlParameter p9 = new SqlParameter();
                    p9.ParameterName = "@Subject";
                    p9.SqlDbType = SqlDbType.NVarChar;
                    p9.Direction = ParameterDirection.Input;
                    p9.Value = Subject;

                    SqlParameter p10 = new SqlParameter();
                    p10.ParameterName = "@Body";
                    p10.SqlDbType = SqlDbType.NVarChar;
                    p10.Direction = ParameterDirection.Input;
                    p10.Value = Body;

                    SqlParameter p11 = new SqlParameter();
                    p11.ParameterName = "@Is_Success";
                    p11.SqlDbType = SqlDbType.NVarChar;
                    p11.Direction = ParameterDirection.Input;
                    p11.Value = Is_Success;

                    SqlParameter p12 = new SqlParameter();
                    p12.ParameterName = "@Failure_Message";
                    p12.SqlDbType = SqlDbType.NVarChar;
                    p12.Direction = ParameterDirection.Input;
                    p12.Value = Failure_Message;

                    SqlParameter p13 = new SqlParameter();
                    p13.ParameterName = "@Logg";
                    p13.SqlDbType = SqlDbType.DateTime;
                    p13.Direction = ParameterDirection.Input;
                    p13.Value = Logg;

                    SqlParameter p14 = new SqlParameter();
                    p14.ParameterName = "@Project_Name";
                    p14.SqlDbType = SqlDbType.NVarChar;
                    p14.Direction = ParameterDirection.Input;
                    p14.Value = Project_Name;

                    SqlParameter p15 = new SqlParameter();
                    p15.ParameterName = "@Attempts";
                    p15.SqlDbType = SqlDbType.Int;
                    p15.Direction = ParameterDirection.Input;
                    p15.Value = Attempts;

                    SqlParameter p16 = new SqlParameter();		
                    p16.ParameterName = "@Enable_Password";
                    p16.SqlDbType = SqlDbType.NVarChar;		
                    p16.Direction = ParameterDirection.Input;		
                    p16.Value = Enable_Password;		
			
                    SqlParameter p17 = new SqlParameter();		
                    p17.ParameterName = "@Enable_SSL";		
                    p17.SqlDbType = SqlDbType.NVarChar;		
                    p17.Direction = ParameterDirection.Input;		
                    p17.Value = Enable_SSL;

                    SqlParameter p18 = new SqlParameter();
                    p18.ParameterName = "@Attachment";
                    p18.SqlDbType = SqlDbType.NVarChar;
                    p18.Direction = ParameterDirection.Input;
                    p18.Value = Attachment;

                    SqlParameter p19 = new SqlParameter();
                    p19.ParameterName = "@Start_Time";
                    p19.SqlDbType = SqlDbType.DateTime;
                    p19.Direction = ParameterDirection.Input;
                    p19.Value = start_time;

                    command.Parameters.Add(p1);
                    command.Parameters.Add(p2);
                    command.Parameters.Add(p3);
                    command.Parameters.Add(p4);
                    command.Parameters.Add(p5);
                    command.Parameters.Add(p6);
                    command.Parameters.Add(p7);
                    command.Parameters.Add(p8);
                    command.Parameters.Add(p9);
                    command.Parameters.Add(p10);
                    command.Parameters.Add(p11);
                    command.Parameters.Add(p12);
                    command.Parameters.Add(p13);
                    command.Parameters.Add(p14);
                    command.Parameters.Add(p15);
                    command.Parameters.Add(p16);
                    command.Parameters.Add(p17);
                    command.Parameters.Add(p18);
                    command.Parameters.Add(p19);

                    connection.Open();
                    command.ExecuteNonQuery();
                    connection.Close();
                    EmailLog(Eid, SMTP_Server_Name, Port_No, From_Email_id, Password, To_Email_id, Body, Subject, Is_Success, Failure_Message, Logg, Project_Name, Enable_SSL, Enable_Password, Attempts, Attachment, CC, BCC, start_time);
                }
            }
            catch (SqlException ex)
            {
                string errMessage = ex.Message + Environment.NewLine + ex.StackTrace;
                fnWriteErrorLog("Error in Insert Function of DLL ", errMessage);
                throw;
            }
        }

        public static void Update(string Eid, string SMTP_Server_Name, int Port_No, string From_Email_id, string Password, string To_Email_id, string Body,
            string Subject, string Is_Success, string Failure_Message, DateTime Logg, string Project_Name, string Enable_SSL, string Enable_Password, 
            int Attempts, string Attachment, string CC, string BCC, DateTime start_time)
        {
            try
            {
                string SQLstr = "SQLconstr";
                using (SqlConnection connection = new SqlConnection(fnConnectionString(SQLstr)))
                {

                    SqlCommand command = new SqlCommand();
                    command = new SqlCommand("Update_Detail", connection);

                    command.CommandType = CommandType.StoredProcedure;

                    SqlParameter p1 = new SqlParameter();
                    p1.ParameterName = "@Eid";
                    p1.SqlDbType = SqlDbType.NVarChar;
                    p1.Direction = ParameterDirection.Input;
                    p1.Value = Eid;

                    SqlParameter p2 = new SqlParameter();
                    p2.ParameterName = "@Is_Success";
                    p2.SqlDbType = SqlDbType.NVarChar;
                    p2.Direction = ParameterDirection.Input;
                    p2.Value = Is_Success;

                    SqlParameter p3 = new SqlParameter();
                    p3.ParameterName = "@Failure_Message";
                    p3.SqlDbType = SqlDbType.NVarChar;
                    p3.Direction = ParameterDirection.Input;
                    p3.Value = Failure_Message;

                    SqlParameter p4 = new SqlParameter();
                    p4.ParameterName = "@Logg";
                    p4.SqlDbType = SqlDbType.DateTime;
                    p4.Direction = ParameterDirection.Input;
                    p4.Value = Logg;

                    SqlParameter p5 = new SqlParameter();
                    p5.ParameterName = "@Attempts";
                    p5.SqlDbType = SqlDbType.Int;
                    p5.Direction = ParameterDirection.Input;
                    p5.Value = Attempts;

                    SqlParameter p6 = new SqlParameter();
                    p6.ParameterName = "@Start_Time";
                    p6.SqlDbType = SqlDbType.DateTime;
                    p6.Direction = ParameterDirection.Input;
                    p6.Value = start_time;


                    command.Parameters.Add(p1);
                    command.Parameters.Add(p2);
                    command.Parameters.Add(p3);
                    command.Parameters.Add(p4);
                    command.Parameters.Add(p5);
                    command.Parameters.Add(p6);

                    connection.Open();
                    command.ExecuteNonQuery();
                    connection.Close();
                    EmailLog(Eid, SMTP_Server_Name, Port_No, From_Email_id, Password, To_Email_id, Body, Subject, Is_Success, Failure_Message, Logg, Project_Name, Enable_SSL, Enable_Password, Attempts, Attachment, CC, BCC, start_time);
                }

            }
            catch(SqlException ex)
            {
                string errMessage =  ex.Message + Environment.NewLine + ex.StackTrace;
                fnWriteErrorLog("Error in Update Function of DLL ", errMessage);
                throw;
            }
        }

        public static void Del(string Eid)
        {
            try
            {
                string SQLstr = "SQLconstr";
                using (SqlConnection connection = new SqlConnection(fnConnectionString(SQLstr)))
                {

                    SqlCommand command = new SqlCommand();
                    command = new SqlCommand("Delete_Record", connection);

                    command.CommandType = CommandType.StoredProcedure;

                    SqlParameter p1 = new SqlParameter();
                    p1.ParameterName = "@Eid";
                    p1.SqlDbType = SqlDbType.NVarChar;
                    p1.Direction = ParameterDirection.Input;
                    p1.Value = Eid;

                    command.Parameters.Add(p1);

                    connection.Open();
                    command.ExecuteNonQuery();
                    connection.Close();
                }

            }
            catch (SqlException ex)
            {
                string errMessage = ex.Message + Environment.NewLine + ex.StackTrace;
                fnWriteErrorLog("Error in Delete Function of DLL ", errMessage);
                throw;
            }
        }
    }
}
