using System;
using System.IO;
using System.Xml;
using System.Data.SqlClient;
using System.Data.SqlTypes;
using System.Data;
using System.Diagnostics;

namespace Email_Setting
{
    public class Class1
    {
        public struct Insert
        {
            string SNTP_Server_Name;
            string Port_no;
            string From_Email_Id;
            string Password;
            string To_Email_Id;
            string CC;
            string BCC;
            string Subject;
            string Body;
            string Is_Success;
            string Failure_Message;
        }

        static void Main(string[] args)
        {
            
            string ConString = "Provider = SQLOLEDB;Data Source=KIL; Initial Catalog = Email_Settings; Integrated Security = SSPI;";
           
            try
            {

                using (SqlConnection connection = new SqlConnection(ConString))
                {
                    // Create the command and set its properties.
                    SqlCommand command = new SqlCommand();
                    SqlCommand command = new SqlCommand
                       ("Proc_name", connection);

                    command.CommandType = CommandType.StoredProcedure;

                    // Add the input parameters and set the properties.
                    SqlParameter parameter1 = new SqlParameter();
                    parameter.ParameterName = "@Param1";
                    parameter.SqlDbType = SqlDbType.NVarChar;
                    parameter.Direction = ParameterDirection.Input;
                    parameter.Value = param1;

                    SqlParameter parameter2 = new SqlParameter();
                    parameter.ParameterName = "@Param2";
                    parameter.SqlDbType = SqlDbType.NVarChar;
                    parameter.Direction = ParameterDirection.Input;
                    parameter.Value = param2;

                   


                    
                    command.Parameters.Add(parameter1);
                    command.Parameters.Add(parameter2);
                    command.Parameters.Add(parameter3);
                    command.Parameters.Add(parameter4);


                   
                    connection.Open();
                    SqlDataReader reader = command.ExecuteNonQuery();
                }
            }
            catch (SqlException ex)
            {
                Debug.WriteLine("Error in SQL cmd!");
                throw;
            }
             

        }

    }

    internal class SqlConnection
    {
        private string v;

        public SqlConnection(string v)
        {
            this.v = v;
        }

        internal void Open()
        {
            throw new NotImplementedException();
        }
    }
}
