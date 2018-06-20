Functions in DLL:

Insert() // It contains 19 parameters and is called in EmailCheck() web form from where we first sending the email.. Details are updated in database in Email_Settings and Email_log table.

string Eid = its generated in EmailCheck() which is string version of current dateTime, 
string SMTP_Server_Name = given by user in EmailCheck() form, 
int Port_No = given by user in EmailCheck() form,
string From_Email_id = given by user in EmailCheck() form, 
string Password = given by user in EmailCheck() form, 
string To_Email_id = given by user in EmailCheck() form, 
string Body = given by user in EmailCheck() form, 
string Subject = hardcoded in EmailCheck(), 
string Is_Success = depends on whether email is sent of not, 
string Failure_Message = depends on whether email is sent of not.. generated in EmailCheck() if failed and displayed in the form, 
DateTime Logg = current time and date when event occurred, 
string Project_Name = hardcoded in EmailCheck() ,
string Enable_SSL = depends on the user input in the form, 
string Enable_Password = depends on the user input in the form, 
int Attempts = hardcoded in EmailCheck(),
string Attachment = hardcoded in EmailCheck(), 
string CC = hardcoded in EmailCheck(), 
string BCC = hardcoded in EmailCheck(), 
DateTime start_time = current time and date when event occurred.


Update() //It also contains 19 parameters and is called in Email() service used to resend all failed emails.. only 5 parameters are updated(Is_Success,Logg,Failure_Message,Attempts,start_time) with the help of "Eid".

string Eid = its taken from database table "Email_Settings" which is string version of current dateTime, 
string SMTP_Server_Name = its taken from database table "Email_Settings", 
int Port_No = its taken from database table "Email_Settings",
string From_Email_id = its taken from database table "Email_Settings", 
string Password = its taken from database table "Email_Settings", 
string To_Email_id = its taken from database table "Email_Settings", 
string Body = its taken from database table "Email_Settings", 
string Subject = its taken from database table "Email_Settings", 
string Is_Success = its taken from database table "Email_Settings(Its updated)", 
string Failure_Message = its taken from database table "Email_Settings(Its updated)", 
DateTime Logg = current time and date when event occurred(its updated), 
string Project_Name = its taken from database table "Email_Settings" ,
string Enable_SSL =its taken from database table "Email_Settings", 
string Enable_Password = its taken from database table "Email_Settings", 
int Attempts = its taken from database table "Email_Settings(Its updated),
string Attachment = its taken from database table "Email_Settings", 
string CC =its taken from database table "Email_Settings", 
string BCC = its taken from database table "Email_Settings", 
DateTime start_time =  its taken from database table "Email_Settings(Its updated).


EmailLog // Its called after both Insert() and Update() in EmailCheck and Email respectively in order to maintain a log in Email_Log table in the database.

(string Eid, string SMTP_Server_Name, int Port_No, string From_Email_id, string Password, string To_Email_id, string Body,
            string Subject, string Is_Success, string Failure_Message, DateTime Logg, string Project_Name, string Enable_SSL, string Enable_Password,
            int Attempts, string Attachment, string CC, string BCC, DateTime start_time)
			
Del // Its called in the Email() service in order to delete any empty mandatory fields like (SMTP_Server_Name,Port_No,To_Email_id,From_Email_id) with the help of Eid.

(string Eid)