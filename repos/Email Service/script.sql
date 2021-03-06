USE [Email_Details]
GO
/****** Object:  StoredProcedure [dbo].[Update_Detail]    Script Date: 4/30/2018 4:20:13 PM ******/
DROP PROCEDURE [dbo].[Update_Detail]
GO
/****** Object:  StoredProcedure [dbo].[Error_Log]    Script Date: 4/30/2018 4:20:13 PM ******/
DROP PROCEDURE [dbo].[Error_Log]
GO
/****** Object:  StoredProcedure [dbo].[Email_Detail]    Script Date: 4/30/2018 4:20:13 PM ******/
DROP PROCEDURE [dbo].[Email_Detail]
GO
/****** Object:  StoredProcedure [dbo].[Delete_Record]    Script Date: 4/30/2018 4:20:13 PM ******/
DROP PROCEDURE [dbo].[Delete_Record]
GO
/****** Object:  Table [dbo].[Email_Settings]    Script Date: 4/30/2018 4:20:13 PM ******/
DROP TABLE [dbo].[Email_Settings]
GO
/****** Object:  Table [dbo].[Email_Logs]    Script Date: 4/30/2018 4:20:13 PM ******/
DROP TABLE [dbo].[Email_Logs]
GO
/****** Object:  User [NT AUTHORITY\SYSTEM]    Script Date: 4/30/2018 4:20:13 PM ******/
DROP USER [NT AUTHORITY\SYSTEM]
GO
USE [master]
GO
/****** Object:  Database [Email_Details]    Script Date: 4/30/2018 4:20:13 PM ******/
DROP DATABASE [Email_Details]
GO
/****** Object:  Database [Email_Details]    Script Date: 4/30/2018 4:20:13 PM ******/
CREATE DATABASE [Email_Details]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Email_Details', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Email_Details.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Email_Details_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Email_Details_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Email_Details] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Email_Details].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Email_Details] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Email_Details] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Email_Details] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Email_Details] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Email_Details] SET ARITHABORT OFF 
GO
ALTER DATABASE [Email_Details] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Email_Details] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Email_Details] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Email_Details] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Email_Details] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Email_Details] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Email_Details] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Email_Details] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Email_Details] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Email_Details] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Email_Details] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Email_Details] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Email_Details] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Email_Details] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Email_Details] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Email_Details] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Email_Details] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Email_Details] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Email_Details] SET  MULTI_USER 
GO
ALTER DATABASE [Email_Details] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Email_Details] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Email_Details] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Email_Details] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Email_Details] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Email_Details] SET QUERY_STORE = OFF
GO
USE [Email_Details]
GO
ALTER DATABASE SCOPED CONFIGURATION SET IDENTITY_CACHE = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [Email_Details]
GO
/****** Object:  User [NT AUTHORITY\SYSTEM]    Script Date: 4/30/2018 4:20:13 PM ******/
CREATE USER [NT AUTHORITY\SYSTEM] FOR LOGIN [NT AUTHORITY\SYSTEM] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Email_Logs]    Script Date: 4/30/2018 4:20:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Email_Logs](
	[Eid] [nvarchar](max) NULL,
	[SMTP_Server_Name] [nvarchar](max) NULL,
	[Port_no] [int] NULL,
	[From_Email_id] [nvarchar](max) NULL,
	[Password] [nvarchar](max) NULL,
	[To_Email_id] [nvarchar](max) NULL,
	[CC] [nvarchar](max) NULL,
	[BCC] [nvarchar](max) NULL,
	[Subject] [nvarchar](max) NULL,
	[Body] [nvarchar](max) NULL,
	[Is_Success] [nvarchar](10) NULL,
	[Failure_Message] [nvarchar](max) NULL,
	[Logg] [datetime] NULL,
	[Project_Name] [nvarchar](max) NULL,
	[Attempts] [int] NULL,
	[Enable_Password] [varchar](50) NULL,
	[Enable_SSL] [varchar](40) NULL,
	[Attachment] [nvarchar](max) NULL,
	[Start_Time] [datetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Email_Settings]    Script Date: 4/30/2018 4:20:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Email_Settings](
	[Eid] [nvarchar](max) NULL,
	[SMTP_Server_Name] [nvarchar](max) NULL,
	[Port_no] [int] NULL,
	[From_Email_id] [nvarchar](max) NULL,
	[Password] [nvarchar](max) NULL,
	[To_Email_id] [nvarchar](max) NULL,
	[CC] [nvarchar](max) NULL,
	[BCC] [nvarchar](max) NULL,
	[Subject] [nvarchar](max) NULL,
	[Body] [nvarchar](max) NULL,
	[Is_Success] [nvarchar](10) NULL,
	[Failure_Message] [nvarchar](max) NULL,
	[Logg] [datetime] NULL,
	[Project_Name] [nvarchar](max) NULL,
	[Attempts] [int] NULL,
	[Enable_Password] [varchar](50) NULL,
	[Enable_SSL] [varchar](40) NULL,
	[Attachment] [nvarchar](max) NULL,
	[Start_Time] [datetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[Email_Logs] ([Eid], [SMTP_Server_Name], [Port_no], [From_Email_id], [Password], [To_Email_id], [CC], [BCC], [Subject], [Body], [Is_Success], [Failure_Message], [Logg], [Project_Name], [Attempts], [Enable_Password], [Enable_SSL], [Attachment], [Start_Time]) VALUES (N'20180405175139001', N'SMTP.GMAIL.COM', 587, N'donotreply@vtelebyte.com', N'vspl@1234', N'asbayes@sanjeevgroup.com', N'', N'', N'TEST EMAIL', N'<html>
<head></head>
<body>''Hi there Akshay''</body>
</html>', N'N', N'To_Email: asbayes@sanjeevgroup.com
 SMTPException Failure sending mail.
System.Net.WebException: The remote name could not be resolved: ''SMTP.GMAIL.COM''
   at System.Net.ServicePoint.GetConnection(PooledStream PooledStream, Object owner, Boolean async, IPAddress& address, Socket& abortSocket, Socket& abortSocket6)
   at System.Net.PooledStream.Activate(Object owningObject, Boolean async, GeneralAsyncDelegate asyncCallback)
   at System.Net.PooledStream.Activate(Object owningObject, GeneralAsyncDelegate asyncCallback)
   at System.Net.ConnectionPool.GetConnection(Object owningObject, GeneralAsyncDelegate asyncCallback, Int32 creationTimeout)
   at System.Net.Mail.SmtpConnection.GetConnection(ServicePoint servicePoint)
   at System.Net.Mail.SmtpTransport.GetConnection(ServicePoint servicePoint)
   at System.Net.Mail.SmtpClient.GetConnection()
   at System.Net.Mail.SmtpClient.Send(MailMessage message)', CAST(N'2018-04-19T15:40:58.320' AS DateTime), N'abc', 4, N'True', N'True', N'C:\\Users\\Lenovo\\Downloads\\Calci.txt', CAST(N'2018-04-19T15:40:58.297' AS DateTime))
INSERT [dbo].[Email_Logs] ([Eid], [SMTP_Server_Name], [Port_no], [From_Email_id], [Password], [To_Email_id], [CC], [BCC], [Subject], [Body], [Is_Success], [Failure_Message], [Logg], [Project_Name], [Attempts], [Enable_Password], [Enable_SSL], [Attachment], [Start_Time]) VALUES (N'20180406165312102', N'SMTP.GMAIL.COM', 587, N'donotreply@vtelebyte.com', N'vspl@1234', N'asbayes@sanjeevgroup.com', N'', N'', N'TEST EMAIL', N'Email Service not working properly', N'N', N'To_Email: asbayes@sanjeevgroup.com
 SMTPException Failure sending mail.
System.Net.WebException: Unable to connect to the remote server ---> System.Net.Sockets.SocketException: A socket operation was attempted to an unreachable host 74.125.24.109:587
   at System.Net.Sockets.Socket.DoConnect(EndPoint endPointSnapshot, SocketAddress socketAddress)
   at System.Net.ServicePoint.ConnectSocketInternal(Boolean connectFailure, Socket s4, Socket s6, Socket& socket, IPAddress& address, ConnectSocketState state, IAsyncResult asyncResult, Exception& exception)
   --- End of inner exception stack trace ---
   at System.Net.ServicePoint.GetConnection(PooledStream PooledStream, Object owner, Boolean async, IPAddress& address, Socket& abortSocket, Socket& abortSocket6)
   at System.Net.PooledStream.Activate(Object owningObject, Boolean async, GeneralAsyncDelegate asyncCallback)
   at System.Net.PooledStream.Activate(Object owningObject, GeneralAsyncDelegate asyncCallback)
   at System.Net.ConnectionPool.GetConnection(Object owningObject, GeneralAsyncDelegate asyncCallback, Int32 creationTimeout)
   at System.Net.Mail.SmtpConnection.GetConnection(ServicePoint servicePoint)
   at System.Net.Mail.SmtpTransport.GetConnection(ServicePoint servicePoint)
   at System.Net.Mail.SmtpClient.GetConnection()
   at System.Net.Mail.SmtpClient.Send(MailMessage message)', CAST(N'2018-04-26T14:50:22.013' AS DateTime), N'abc', 4, N'True', N'True', N'C:\Users\Lenovo\Downloads\Call.of.Duty - SKIDROW.torrent', CAST(N'2018-04-26T14:49:53.550' AS DateTime))
INSERT [dbo].[Email_Logs] ([Eid], [SMTP_Server_Name], [Port_no], [From_Email_id], [Password], [To_Email_id], [CC], [BCC], [Subject], [Body], [Is_Success], [Failure_Message], [Logg], [Project_Name], [Attempts], [Enable_Password], [Enable_SSL], [Attachment], [Start_Time]) VALUES (N'20180406165312102', N'SMTP.GMAIL.COM', 587, N'donotreply@vtelebyte.com', N'vspl@1234', N'asbayes@sanjeevgroup.com', N'TEST EMAIL', N'', N'', N'Email Service not working properly', N'Y', N'', CAST(N'2018-04-27T10:09:13.773' AS DateTime), N'abc', 0, N'True', N'True', N'C:\Users\Lenovo\Downloads\Call.of.Duty - SKIDROW.torrent', CAST(N'2018-04-27T10:08:44.567' AS DateTime))
INSERT [dbo].[Email_Logs] ([Eid], [SMTP_Server_Name], [Port_no], [From_Email_id], [Password], [To_Email_id], [CC], [BCC], [Subject], [Body], [Is_Success], [Failure_Message], [Logg], [Project_Name], [Attempts], [Enable_Password], [Enable_SSL], [Attachment], [Start_Time]) VALUES (N'20180405175139001', N'SMTP.GMAIL.COM', 587, N'donotreply@vtelebyte.com', N'vspl@1234', N'asbayes@sanjeevgroup.com', N'', N'', N'TEST EMAIL', N'<html>
<head></head>
<body>''Hi there Akshay''</body>
</html>', N'N', N'To_Email: asbayes@sanjeevgroup.com
 SMTPException Failure sending mail.
System.Net.WebException: The remote name could not be resolved: ''SMTP.GMAIL.COM''
   at System.Net.ServicePoint.GetConnection(PooledStream PooledStream, Object owner, Boolean async, IPAddress& address, Socket& abortSocket, Socket& abortSocket6)
   at System.Net.PooledStream.Activate(Object owningObject, Boolean async, GeneralAsyncDelegate asyncCallback)
   at System.Net.PooledStream.Activate(Object owningObject, GeneralAsyncDelegate asyncCallback)
   at System.Net.ConnectionPool.GetConnection(Object owningObject, GeneralAsyncDelegate asyncCallback, Int32 creationTimeout)
   at System.Net.Mail.SmtpConnection.GetConnection(ServicePoint servicePoint)
   at System.Net.Mail.SmtpTransport.GetConnection(ServicePoint servicePoint)
   at System.Net.Mail.SmtpClient.GetConnection()
   at System.Net.Mail.SmtpClient.Send(MailMessage message)', CAST(N'2018-04-19T15:41:58.347' AS DateTime), N'abc', 4, N'True', N'True', N'C:\\Users\\Lenovo\\Downloads\\Calci.txt', CAST(N'2018-04-19T15:40:58.297' AS DateTime))
INSERT [dbo].[Email_Logs] ([Eid], [SMTP_Server_Name], [Port_no], [From_Email_id], [Password], [To_Email_id], [CC], [BCC], [Subject], [Body], [Is_Success], [Failure_Message], [Logg], [Project_Name], [Attempts], [Enable_Password], [Enable_SSL], [Attachment], [Start_Time]) VALUES (N'20180405175139001', N'SMTP.GMAIL.COM', 587, N'donotreply@vtelebyte.com', N'vspl@1234', N'asbayes@sanjeevgroup.com', N'', N'', N'TEST EMAIL', N'<html>
<head></head>
<body>''Hi there Akshay''</body>
</html>', N'N', N'To_Email: asbayes@sanjeevgroup.com
 SMTPException Failure sending mail.
System.Net.WebException: The remote name could not be resolved: ''SMTP.GMAIL.COM''
   at System.Net.ServicePoint.GetConnection(PooledStream PooledStream, Object owner, Boolean async, IPAddress& address, Socket& abortSocket, Socket& abortSocket6)
   at System.Net.PooledStream.Activate(Object owningObject, Boolean async, GeneralAsyncDelegate asyncCallback)
   at System.Net.PooledStream.Activate(Object owningObject, GeneralAsyncDelegate asyncCallback)
   at System.Net.ConnectionPool.GetConnection(Object owningObject, GeneralAsyncDelegate asyncCallback, Int32 creationTimeout)
   at System.Net.Mail.SmtpConnection.GetConnection(ServicePoint servicePoint)
   at System.Net.Mail.SmtpTransport.GetConnection(ServicePoint servicePoint)
   at System.Net.Mail.SmtpClient.GetConnection()
   at System.Net.Mail.SmtpClient.Send(MailMessage message)', CAST(N'2018-04-19T15:43:58.337' AS DateTime), N'abc', 3, N'True', N'True', N'C:\\Users\\Lenovo\\Downloads\\Calci.txt', CAST(N'2018-04-19T15:43:58.317' AS DateTime))
INSERT [dbo].[Email_Logs] ([Eid], [SMTP_Server_Name], [Port_no], [From_Email_id], [Password], [To_Email_id], [CC], [BCC], [Subject], [Body], [Is_Success], [Failure_Message], [Logg], [Project_Name], [Attempts], [Enable_Password], [Enable_SSL], [Attachment], [Start_Time]) VALUES (N'20180405175139001', N'SMTP.GMAIL.COM', 587, N'donotreply@vtelebyte.com', N'vspl@1234', N'asbayes@sanjeevgroup.com', N'', N'', N'TEST EMAIL', N'<html>
<head></head>
<body>''Hi there Akshay''</body>
</html>', N'N', N'To_Email: asbayes@sanjeevgroup.com
 SMTPException Failure sending mail.
System.Net.WebException: The remote name could not be resolved: ''SMTP.GMAIL.COM''
   at System.Net.ServicePoint.GetConnection(PooledStream PooledStream, Object owner, Boolean async, IPAddress& address, Socket& abortSocket, Socket& abortSocket6)
   at System.Net.PooledStream.Activate(Object owningObject, Boolean async, GeneralAsyncDelegate asyncCallback)
   at System.Net.PooledStream.Activate(Object owningObject, GeneralAsyncDelegate asyncCallback)
   at System.Net.ConnectionPool.GetConnection(Object owningObject, GeneralAsyncDelegate asyncCallback, Int32 creationTimeout)
   at System.Net.Mail.SmtpConnection.GetConnection(ServicePoint servicePoint)
   at System.Net.Mail.SmtpTransport.GetConnection(ServicePoint servicePoint)
   at System.Net.Mail.SmtpClient.GetConnection()
   at System.Net.Mail.SmtpClient.Send(MailMessage message)', CAST(N'2018-04-19T15:21:10.313' AS DateTime), N'abc', 4, N'True', N'True', N'C:\\Users\\Lenovo\\Downloads\\Calci.txt', CAST(N'2018-04-19T15:21:10.293' AS DateTime))
INSERT [dbo].[Email_Logs] ([Eid], [SMTP_Server_Name], [Port_no], [From_Email_id], [Password], [To_Email_id], [CC], [BCC], [Subject], [Body], [Is_Success], [Failure_Message], [Logg], [Project_Name], [Attempts], [Enable_Password], [Enable_SSL], [Attachment], [Start_Time]) VALUES (N'20180406165312102', N'SMTP.GMAIL.COM', 587, N'donotreply@vtelebyte.com', N'vspl@1234', N'asbayes@sanjeevgroup.com', N'', N'', N'TEST EMAIL', N'Email Service not working properly', N'N', N'To_Email: asbayes@sanjeevgroup.com
 SMTPException Failure sending mail.
System.Net.WebException: The remote name could not be resolved: ''SMTP.GMAIL.COM''
   at System.Net.ServicePoint.GetConnection(PooledStream PooledStream, Object owner, Boolean async, IPAddress& address, Socket& abortSocket, Socket& abortSocket6)
   at System.Net.PooledStream.Activate(Object owningObject, Boolean async, GeneralAsyncDelegate asyncCallback)
   at System.Net.PooledStream.Activate(Object owningObject, GeneralAsyncDelegate asyncCallback)
   at System.Net.ConnectionPool.GetConnection(Object owningObject, GeneralAsyncDelegate asyncCallback, Int32 creationTimeout)
   at System.Net.Mail.SmtpConnection.GetConnection(ServicePoint servicePoint)
   at System.Net.Mail.SmtpTransport.GetConnection(ServicePoint servicePoint)
   at System.Net.Mail.SmtpClient.GetConnection()
   at System.Net.Mail.SmtpClient.Send(MailMessage message)', CAST(N'2018-04-26T14:50:25.130' AS DateTime), N'abc', 4, N'True', N'True', N'C:\Users\Lenovo\Downloads\Call.of.Duty - SKIDROW.torrent', CAST(N'2018-04-26T14:49:53.550' AS DateTime))
INSERT [dbo].[Email_Logs] ([Eid], [SMTP_Server_Name], [Port_no], [From_Email_id], [Password], [To_Email_id], [CC], [BCC], [Subject], [Body], [Is_Success], [Failure_Message], [Logg], [Project_Name], [Attempts], [Enable_Password], [Enable_SSL], [Attachment], [Start_Time]) VALUES (N'20180406165312102', N'SMTP.GMAIL.COM', 587, N'donotreply@vtelebyte.com', N'vspl@1234', N'asbayes@sanjeevgroup.com', N'', N'', N'TEST EMAIL', N'Email Service not working properly', N'N', N'To_Email: asbayes@sanjeevgroup.com
 SMTPException Failure sending mail.
System.Net.WebException: The remote name could not be resolved: ''SMTP.GMAIL.COM''
   at System.Net.ServicePoint.GetConnection(PooledStream PooledStream, Object owner, Boolean async, IPAddress& address, Socket& abortSocket, Socket& abortSocket6)
   at System.Net.PooledStream.Activate(Object owningObject, Boolean async, GeneralAsyncDelegate asyncCallback)
   at System.Net.PooledStream.Activate(Object owningObject, GeneralAsyncDelegate asyncCallback)
   at System.Net.ConnectionPool.GetConnection(Object owningObject, GeneralAsyncDelegate asyncCallback, Int32 creationTimeout)
   at System.Net.Mail.SmtpConnection.GetConnection(ServicePoint servicePoint)
   at System.Net.Mail.SmtpTransport.GetConnection(ServicePoint servicePoint)
   at System.Net.Mail.SmtpClient.GetConnection()
   at System.Net.Mail.SmtpClient.Send(MailMessage message)', CAST(N'2018-04-26T14:50:39.320' AS DateTime), N'abc', 4, N'True', N'True', N'C:\Users\Lenovo\Downloads\Call.of.Duty - SKIDROW.torrent', CAST(N'2018-04-26T14:49:53.550' AS DateTime))
INSERT [dbo].[Email_Logs] ([Eid], [SMTP_Server_Name], [Port_no], [From_Email_id], [Password], [To_Email_id], [CC], [BCC], [Subject], [Body], [Is_Success], [Failure_Message], [Logg], [Project_Name], [Attempts], [Enable_Password], [Enable_SSL], [Attachment], [Start_Time]) VALUES (N'20180405175139001', N'SMTP.GMAIL.COM', 587, N'donotreply@vtelebyte.com', N'vspl@1234', N'asbayes@sanjeevgroup.com', N'', N'', N'TEST EMAIL', N'<html>
<head></head>
<body>''Hi there Akshay''</body>
</html>', N'N', N'To_Email: asbayes@sanjeevgroup.com
 SMTPException Failure sending mail.
System.Net.WebException: The remote name could not be resolved: ''SMTP.GMAIL.COM''
   at System.Net.ServicePoint.GetConnection(PooledStream PooledStream, Object owner, Boolean async, IPAddress& address, Socket& abortSocket, Socket& abortSocket6)
   at System.Net.PooledStream.Activate(Object owningObject, Boolean async, GeneralAsyncDelegate asyncCallback)
   at System.Net.PooledStream.Activate(Object owningObject, GeneralAsyncDelegate asyncCallback)
   at System.Net.ConnectionPool.GetConnection(Object owningObject, GeneralAsyncDelegate asyncCallback, Int32 creationTimeout)
   at System.Net.Mail.SmtpConnection.GetConnection(ServicePoint servicePoint)
   at System.Net.Mail.SmtpTransport.GetConnection(ServicePoint servicePoint)
   at System.Net.Mail.SmtpClient.GetConnection()
   at System.Net.Mail.SmtpClient.Send(MailMessage message)', CAST(N'2018-04-19T15:45:58.337' AS DateTime), N'abc', 3, N'True', N'True', N'C:\\Users\\Lenovo\\Downloads\\Calci.txt', CAST(N'2018-04-19T15:43:58.317' AS DateTime))
INSERT [dbo].[Email_Logs] ([Eid], [SMTP_Server_Name], [Port_no], [From_Email_id], [Password], [To_Email_id], [CC], [BCC], [Subject], [Body], [Is_Success], [Failure_Message], [Logg], [Project_Name], [Attempts], [Enable_Password], [Enable_SSL], [Attachment], [Start_Time]) VALUES (N'20180406165312102', N'SMTP.GMAIL.COM', 587, N'donotreply@vtelebyte.com', N'vspl@1234', N'asbayes@sanjeevgroup.com', N'', N'', N'TEST EMAIL', N'Email Service not working properly', N'Y', N'', CAST(N'2018-04-26T14:51:35.467' AS DateTime), N'abc', 0, N'True', N'True', N'C:\Users\Lenovo\Downloads\Call.of.Duty - SKIDROW.torrent', CAST(N'2018-04-26T14:49:53.550' AS DateTime))
INSERT [dbo].[Email_Logs] ([Eid], [SMTP_Server_Name], [Port_no], [From_Email_id], [Password], [To_Email_id], [CC], [BCC], [Subject], [Body], [Is_Success], [Failure_Message], [Logg], [Project_Name], [Attempts], [Enable_Password], [Enable_SSL], [Attachment], [Start_Time]) VALUES (N'20180416184429505', N'SMTP.GMAIL.COM', 587, N'donotreply@vtelebyte.com', N'vspl@1234', N'asbayes@sanjeevgroup.com', N'', N'', N'TEST EMAIL', N'Hello Akshay', N'Y', N'', CAST(N'2018-04-26T14:51:50.223' AS DateTime), N'abc', 0, N'True', N'True', N'C:\Users\Lenovo\Downloads\Calci.txt', CAST(N'2018-04-26T14:50:52.573' AS DateTime))
INSERT [dbo].[Email_Logs] ([Eid], [SMTP_Server_Name], [Port_no], [From_Email_id], [Password], [To_Email_id], [CC], [BCC], [Subject], [Body], [Is_Success], [Failure_Message], [Logg], [Project_Name], [Attempts], [Enable_Password], [Enable_SSL], [Attachment], [Start_Time]) VALUES (N'20180406165312102', N'SMTP.GMAIL.COM', 587, N'donotreply@vtelebyte.com', N'vspl@1234', N'asbayes@sanjeevgroup.com', N'TEST EMAIL', N'', N'', N'Email Service not working properly', N'Y', N'', CAST(N'2018-04-27T10:08:51.757' AS DateTime), N'abc', 0, N'True', N'True', N'C:\Users\Lenovo\Downloads\Call.of.Duty - SKIDROW.torrent', CAST(N'2018-04-27T10:08:44.567' AS DateTime))
INSERT [dbo].[Email_Logs] ([Eid], [SMTP_Server_Name], [Port_no], [From_Email_id], [Password], [To_Email_id], [CC], [BCC], [Subject], [Body], [Is_Success], [Failure_Message], [Logg], [Project_Name], [Attempts], [Enable_Password], [Enable_SSL], [Attachment], [Start_Time]) VALUES (N'20180406165312102', N'SMTP.GMAIL.COM', 587, N'donotreply@vtelebyte.com', N'vspl@1234', N'asbayes@sanjeevgroup.com', N'TEST EMAIL', N'', N'', N'Email Service not working properly', N'N', N'To_Email: asbayes@sanjeevgroup.com
Object reference not set to an instance of an object.
   at EmailWindowsFormsApp.displayForm.Send_btn_Click(Object sender, EventArgs e) in C:\Users\Lenovo\source\repos\EmailWindowsFormsApp\EmailWindowsFormsApp\displayForm.cs:line 150', CAST(N'2018-04-27T10:09:02.037' AS DateTime), N'abc', 3, N'True', N'True', N'C:\Users\Lenovo\Downloads\Call.of.Duty - SKIDROW.torrent', CAST(N'2018-04-27T10:08:44.567' AS DateTime))
INSERT [dbo].[Email_Logs] ([Eid], [SMTP_Server_Name], [Port_no], [From_Email_id], [Password], [To_Email_id], [CC], [BCC], [Subject], [Body], [Is_Success], [Failure_Message], [Logg], [Project_Name], [Attempts], [Enable_Password], [Enable_SSL], [Attachment], [Start_Time]) VALUES (N'20180406165312102', N'SMTP.GMAIL.COM', 587, N'donotreply@vtelebyte.com', N'vspl@1234', N'asbayes@sanjeevgroup.com', N'', N'', N'TEST EMAIL', N'Email Service not working properly', N'N', N'To_Email: asbayes@sanjeevgroup.com
 SMTPException Failure sending mail.
System.Net.WebException: The remote name could not be resolved: ''SMTP.GMAIL.COM''
   at System.Net.ServicePoint.GetConnection(PooledStream PooledStream, Object owner, Boolean async, IPAddress& address, Socket& abortSocket, Socket& abortSocket6)
   at System.Net.PooledStream.Activate(Object owningObject, Boolean async, GeneralAsyncDelegate asyncCallback)
   at System.Net.PooledStream.Activate(Object owningObject, GeneralAsyncDelegate asyncCallback)
   at System.Net.ConnectionPool.GetConnection(Object owningObject, GeneralAsyncDelegate asyncCallback, Int32 creationTimeout)
   at System.Net.Mail.SmtpConnection.GetConnection(ServicePoint servicePoint)
   at System.Net.Mail.SmtpTransport.GetConnection(ServicePoint servicePoint)
   at System.Net.Mail.SmtpClient.GetConnection()
   at System.Net.Mail.SmtpClient.Send(MailMessage message)', CAST(N'2018-04-26T14:50:44.453' AS DateTime), N'abc', 4, N'True', N'True', N'C:\Users\Lenovo\Downloads\Call.of.Duty - SKIDROW.torrent', CAST(N'2018-04-26T14:49:53.550' AS DateTime))
INSERT [dbo].[Email_Logs] ([Eid], [SMTP_Server_Name], [Port_no], [From_Email_id], [Password], [To_Email_id], [CC], [BCC], [Subject], [Body], [Is_Success], [Failure_Message], [Logg], [Project_Name], [Attempts], [Enable_Password], [Enable_SSL], [Attachment], [Start_Time]) VALUES (N'20180416184429505', N'SMTP.GMAIL.COM', 587, N'donotreply@vtelebyte.com', N'vspl@1234', N'asbayes@sanjeevgroup.com', N'', N'', N'TEST EMAIL', N'Hello Akshay', N'N', N'To_Email: asbayes@sanjeevgroup.com
 SMTPException Failure sending mail.
System.Net.WebException: The remote name could not be resolved: ''SMTP.GMAIL.COM''
   at System.Net.ServicePoint.GetConnection(PooledStream PooledStream, Object owner, Boolean async, IPAddress& address, Socket& abortSocket, Socket& abortSocket6)
   at System.Net.PooledStream.Activate(Object owningObject, Boolean async, GeneralAsyncDelegate asyncCallback)
   at System.Net.PooledStream.Activate(Object owningObject, GeneralAsyncDelegate asyncCallback)
   at System.Net.ConnectionPool.GetConnection(Object owningObject, GeneralAsyncDelegate asyncCallback, Int32 creationTimeout)
   at System.Net.Mail.SmtpConnection.GetConnection(ServicePoint servicePoint)
   at System.Net.Mail.SmtpTransport.GetConnection(ServicePoint servicePoint)
   at System.Net.Mail.SmtpClient.GetConnection()
   at System.Net.Mail.SmtpClient.Send(MailMessage message)', CAST(N'2018-04-26T14:51:00.880' AS DateTime), N'abc', 4, N'True', N'True', N'C:\Users\Lenovo\Downloads\Calci.txt', CAST(N'2018-04-26T14:50:52.573' AS DateTime))
INSERT [dbo].[Email_Logs] ([Eid], [SMTP_Server_Name], [Port_no], [From_Email_id], [Password], [To_Email_id], [CC], [BCC], [Subject], [Body], [Is_Success], [Failure_Message], [Logg], [Project_Name], [Attempts], [Enable_Password], [Enable_SSL], [Attachment], [Start_Time]) VALUES (N'20180405175139001', N'SMTP.GMAIL.COM', 587, N'donotreply@vtelebyte.com', N'vspl@1234', N'asbayes@sanjeevgroup.com', N'', N'', N'TEST EMAIL', N'<html>
<head></head>
<body>''Hi there Akshay''</body>
</html>', N'Y', N'', CAST(N'2018-04-19T15:49:04.810' AS DateTime), N'abc', 0, N'True', N'True', N'C:\\Users\\Lenovo\\Downloads\\Calci.txt', CAST(N'2018-04-19T15:47:58.310' AS DateTime))
INSERT [dbo].[Email_Logs] ([Eid], [SMTP_Server_Name], [Port_no], [From_Email_id], [Password], [To_Email_id], [CC], [BCC], [Subject], [Body], [Is_Success], [Failure_Message], [Logg], [Project_Name], [Attempts], [Enable_Password], [Enable_SSL], [Attachment], [Start_Time]) VALUES (N'20180405175139001', N'SMTP.GMAIL.COM', 587, N'donotreply@vtelebyte.com', N'vspl@1234', N'asbayes@sanjeevgroup.com', N'', N'', N'TEST EMAIL', N'<html>
<head></head>
<body>''Hi there Akshay''</body>
</html>', N'N', N'To_Email: asbayes@sanjeevgroup.com
 SMTPException Failure sending mail.
System.Net.WebException: The remote name could not be resolved: ''SMTP.GMAIL.COM''
   at System.Net.ServicePoint.GetConnection(PooledStream PooledStream, Object owner, Boolean async, IPAddress& address, Socket& abortSocket, Socket& abortSocket6)
   at System.Net.PooledStream.Activate(Object owningObject, Boolean async, GeneralAsyncDelegate asyncCallback)
   at System.Net.PooledStream.Activate(Object owningObject, GeneralAsyncDelegate asyncCallback)
   at System.Net.ConnectionPool.GetConnection(Object owningObject, GeneralAsyncDelegate asyncCallback, Int32 creationTimeout)
   at System.Net.Mail.SmtpConnection.GetConnection(ServicePoint servicePoint)
   at System.Net.Mail.SmtpTransport.GetConnection(ServicePoint servicePoint)
   at System.Net.Mail.SmtpClient.GetConnection()
   at System.Net.Mail.SmtpClient.Send(MailMessage message)', CAST(N'2018-04-19T15:46:58.290' AS DateTime), N'abc', 3, N'True', N'True', N'C:\\Users\\Lenovo\\Downloads\\Calci.txt', CAST(N'2018-04-19T15:43:58.317' AS DateTime))
INSERT [dbo].[Email_Logs] ([Eid], [SMTP_Server_Name], [Port_no], [From_Email_id], [Password], [To_Email_id], [CC], [BCC], [Subject], [Body], [Is_Success], [Failure_Message], [Logg], [Project_Name], [Attempts], [Enable_Password], [Enable_SSL], [Attachment], [Start_Time]) VALUES (N'20180416184429505', N'SMTP.GMAIL.COM', 587, N'donotreply@vtelebyte.com', N'vspl@1234', N'asbayes@sanjeevgroup.com', N'', N'', N'TEST EMAIL', N'Hello Akshay', N'N', N'To_Email: asbayes@sanjeevgroup.com
 SMTPException Failure sending mail.
System.Net.WebException: The remote name could not be resolved: ''SMTP.GMAIL.COM''
   at System.Net.ServicePoint.GetConnection(PooledStream PooledStream, Object owner, Boolean async, IPAddress& address, Socket& abortSocket, Socket& abortSocket6)
   at System.Net.PooledStream.Activate(Object owningObject, Boolean async, GeneralAsyncDelegate asyncCallback)
   at System.Net.PooledStream.Activate(Object owningObject, GeneralAsyncDelegate asyncCallback)
   at System.Net.ConnectionPool.GetConnection(Object owningObject, GeneralAsyncDelegate asyncCallback, Int32 creationTimeout)
   at System.Net.Mail.SmtpConnection.GetConnection(ServicePoint servicePoint)
   at System.Net.Mail.SmtpTransport.GetConnection(ServicePoint servicePoint)
   at System.Net.Mail.SmtpClient.GetConnection()
   at System.Net.Mail.SmtpClient.Send(MailMessage message)', CAST(N'2018-04-26T14:50:54.483' AS DateTime), N'abc', 3, N'True', N'True', N'C:\Users\Lenovo\Downloads\Calci.txt', CAST(N'2018-04-26T14:50:52.573' AS DateTime))
INSERT [dbo].[Email_Logs] ([Eid], [SMTP_Server_Name], [Port_no], [From_Email_id], [Password], [To_Email_id], [CC], [BCC], [Subject], [Body], [Is_Success], [Failure_Message], [Logg], [Project_Name], [Attempts], [Enable_Password], [Enable_SSL], [Attachment], [Start_Time]) VALUES (N'20180413125210307', N'SMTP.GMAIL.COM', 587, N'donotreply@vtelebyte.com', N'vspl@1234', N'asbayes@sanjeevgroup.com', N'', N'', N'TEST EMAIL', N'Hi', N'Y', N'', CAST(N'2018-04-24T15:50:08.997' AS DateTime), N'abc', 0, N'True', N'True', N'C:\Users\Lenovo\Downloads\Far.Cry.3.PC.torrent ; C:\Users\Lenovo\Downloads\Call.of.Duty - SKIDROW.torrent', CAST(N'2018-04-24T15:50:01.273' AS DateTime))
INSERT [dbo].[Email_Logs] ([Eid], [SMTP_Server_Name], [Port_no], [From_Email_id], [Password], [To_Email_id], [CC], [BCC], [Subject], [Body], [Is_Success], [Failure_Message], [Logg], [Project_Name], [Attempts], [Enable_Password], [Enable_SSL], [Attachment], [Start_Time]) VALUES (N'20180405175139001', N'SMTP.GMAIL.COM', 587, N'donotreply@vtelebyte.com', N'vspl@1234', N'asbayes@sanjeevgroup.com', N'', N'', N'TEST EMAIL', N'<html>
<head></head>
<body>''Hi there Akshay''</body>
</html>', N'N', N'To_Email: asbayes@sanjeevgroup.com
 SMTPException Failure sending mail.
System.Net.WebException: The remote name could not be resolved: ''SMTP.GMAIL.COM''
   at System.Net.ServicePoint.GetConnection(PooledStream PooledStream, Object owner, Boolean async, IPAddress& address, Socket& abortSocket, Socket& abortSocket6)
   at System.Net.PooledStream.Activate(Object owningObject, Boolean async, GeneralAsyncDelegate asyncCallback)
   at System.Net.PooledStream.Activate(Object owningObject, GeneralAsyncDelegate asyncCallback)
   at System.Net.ConnectionPool.GetConnection(Object owningObject, GeneralAsyncDelegate asyncCallback, Int32 creationTimeout)
   at System.Net.Mail.SmtpConnection.GetConnection(ServicePoint servicePoint)
   at System.Net.Mail.SmtpTransport.GetConnection(ServicePoint servicePoint)
   at System.Net.Mail.SmtpClient.GetConnection()
   at System.Net.Mail.SmtpClient.Send(MailMessage message)', CAST(N'2018-04-19T15:47:58.330' AS DateTime), N'abc', 2, N'True', N'True', N'C:\\Users\\Lenovo\\Downloads\\Calci.txt', CAST(N'2018-04-19T15:47:58.310' AS DateTime))
INSERT [dbo].[Email_Logs] ([Eid], [SMTP_Server_Name], [Port_no], [From_Email_id], [Password], [To_Email_id], [CC], [BCC], [Subject], [Body], [Is_Success], [Failure_Message], [Logg], [Project_Name], [Attempts], [Enable_Password], [Enable_SSL], [Attachment], [Start_Time]) VALUES (N'20180404141858891', N'SMTP.GMAIL.COM', 587, N'donotreply@vtelebyte.com', N'vspl@1234', N'msjoshi@sanjeevgroup.com', N'', N'', N'TEST EMAIL', N'Welcome to Sanjeev Group and Vtelebyte Manish !!', N'N', N'To_Email: msjoshi@sanjeevgroup.com
The parameter ''fileName'' cannot be an empty string.
Parameter name: fileName
   at System.Net.Mail.AttachmentBase.SetContentFromFile(String fileName, String mediaType)
   at System.Net.Mail.AttachmentBase..ctor(String fileName)
   at System.Net.Mail.Attachment..ctor(String fileName)
   at EmailWindowsFormsApp.displayForm.Send_btn_Click(Object sender, EventArgs e) in C:\Users\Lenovo\source\repos\EmailWindowsFormsApp\EmailWindowsFormsApp\displayForm.cs:line 129', CAST(N'2018-04-24T15:50:45.823' AS DateTime), N'abc', 3, N'True', N'True', N'', CAST(N'2018-04-24T15:50:33.990' AS DateTime))
INSERT [dbo].[Email_Logs] ([Eid], [SMTP_Server_Name], [Port_no], [From_Email_id], [Password], [To_Email_id], [CC], [BCC], [Subject], [Body], [Is_Success], [Failure_Message], [Logg], [Project_Name], [Attempts], [Enable_Password], [Enable_SSL], [Attachment], [Start_Time]) VALUES (N'20180404141858891', N'SMTP.GMAIL.COM', 587, N'donotreply@vtelebyte.com', N'vspl@1234', N'msjoshi@sanjeevgroup.com', N'', N'', N'TEST EMAIL', N'Welcome to Sanjeev Group and Vtelebyte Manish !!', N'Y', N'', CAST(N'2018-04-24T16:07:56.830' AS DateTime), N'abc', 0, N'True', N'True', N'', CAST(N'2018-04-24T16:07:51.793' AS DateTime))
INSERT [dbo].[Email_Logs] ([Eid], [SMTP_Server_Name], [Port_no], [From_Email_id], [Password], [To_Email_id], [CC], [BCC], [Subject], [Body], [Is_Success], [Failure_Message], [Logg], [Project_Name], [Attempts], [Enable_Password], [Enable_SSL], [Attachment], [Start_Time]) VALUES (N'20180405175139001', N'SMTP.GMAIL.COM', 587, N'donotreply@vtelebyte.com', N'vspl@1234', N'asbayes@sanjeevgroup.com', N'', N'', N'TEST EMAIL', N'<html>
<head></head>
<body>''Hi there Akshay''</body>
</html>', N'Y', N'', CAST(N'2018-04-24T16:09:51.180' AS DateTime), N'abc', 0, N'True', N'True', N'C:\\Users\\Lenovo\\Downloads\\Calci.txt', CAST(N'2018-04-24T16:09:45.003' AS DateTime))
INSERT [dbo].[Email_Logs] ([Eid], [SMTP_Server_Name], [Port_no], [From_Email_id], [Password], [To_Email_id], [CC], [BCC], [Subject], [Body], [Is_Success], [Failure_Message], [Logg], [Project_Name], [Attempts], [Enable_Password], [Enable_SSL], [Attachment], [Start_Time]) VALUES (N'20180416184429505', N'SMTP.GMAIL.COM', 587, N'donotreply@vtelebyte.com', N'vspl@1234', N'asbayes@sanjeevgroup.com', N'', N'', N'TEST EMAIL', N'Hello Akshay', N'Y', N'', CAST(N'2018-04-24T16:10:38.077' AS DateTime), N'abc', 0, N'True', N'True', N'C:\Users\Lenovo\Downloads\Calci.txt', CAST(N'2018-04-24T16:10:32.967' AS DateTime))
INSERT [dbo].[Email_Logs] ([Eid], [SMTP_Server_Name], [Port_no], [From_Email_id], [Password], [To_Email_id], [CC], [BCC], [Subject], [Body], [Is_Success], [Failure_Message], [Logg], [Project_Name], [Attempts], [Enable_Password], [Enable_SSL], [Attachment], [Start_Time]) VALUES (N'20180404141858891', N'SMTP.GMAIL.COM', 587, N'donotreply@vtelebyte.com', N'vspl@1234', N'msjoshi@sanjeevgroup.com', N'', N'', N'TEST EMAIL', N'Welcome to Sanjeev Group and Vtelebyte Manish !!', N'N', N'To_Email: msjoshi@sanjeevgroup.com
The parameter ''fileName'' cannot be an empty string.
Parameter name: fileName
   at System.Net.Mail.AttachmentBase.SetContentFromFile(String fileName, String mediaType)
   at System.Net.Mail.AttachmentBase..ctor(String fileName)
   at System.Net.Mail.Attachment..ctor(String fileName)
   at EmailWindowsFormsApp.displayForm.Send_btn_Click(Object sender, EventArgs e) in C:\Users\Lenovo\source\repos\EmailWindowsFormsApp\EmailWindowsFormsApp\displayForm.cs:line 129', CAST(N'2018-04-24T15:58:45.353' AS DateTime), N'abc', 3, N'True', N'True', N'', CAST(N'2018-04-24T15:58:43.467' AS DateTime))
INSERT [dbo].[Email_Logs] ([Eid], [SMTP_Server_Name], [Port_no], [From_Email_id], [Password], [To_Email_id], [CC], [BCC], [Subject], [Body], [Is_Success], [Failure_Message], [Logg], [Project_Name], [Attempts], [Enable_Password], [Enable_SSL], [Attachment], [Start_Time]) VALUES (N'20180413125210307', N'SMTP.GMAIL.COM', 587, N'donotreply@vtelebyte.com', N'vspl@1234', N'asbayes@sanjeevgroup.com', N'', N'', N'TEST EMAIL', N'Hi', N'N', N'To_Email: asbayes@sanjeevgroup.com
Could not find file ''C:\Users\Lenovo\source\repos\EmailWindowsFormsApp\EmailWindowsFormsApp\bin\Debug\Far.Cry.3.PC.torrent ,Call.of.Duty - SKIDROW.torrent''.
   at System.IO.__Error.WinIOError(Int32 errorCode, String maybeFullPath)
   at System.IO.FileStream.Init(String path, FileMode mode, FileAccess access, Int32 rights, Boolean useRights, FileShare share, Int32 bufferSize, FileOptions options, SECURITY_ATTRIBUTES secAttrs, String msgPath, Boolean bFromProxy, Boolean useLongPath, Boolean checkHost)
   at System.IO.FileStream..ctor(String path, FileMode mode, FileAccess access, FileShare share)
   at System.Net.Mail.AttachmentBase.SetContentFromFile(String fileName, String mediaType)
   at System.Net.Mail.AttachmentBase..ctor(String fileName)
   at System.Net.Mail.Attachment..ctor(String fileName)
   at EmailWindowsFormsApp.displayForm.Send_btn_Click(Object sender, EventArgs e) in C:\Users\Lenovo\source\repos\EmailWindowsFormsApp\EmailWindowsFormsApp\displayForm.cs:line 131', CAST(N'2018-04-26T14:48:14.560' AS DateTime), N'abc', 3, N'True', N'True', N'Far.Cry.3.PC.torrent ,Call.of.Duty - SKIDROW.torrent', CAST(N'2018-04-26T14:47:37.963' AS DateTime))
INSERT [dbo].[Email_Logs] ([Eid], [SMTP_Server_Name], [Port_no], [From_Email_id], [Password], [To_Email_id], [CC], [BCC], [Subject], [Body], [Is_Success], [Failure_Message], [Logg], [Project_Name], [Attempts], [Enable_Password], [Enable_SSL], [Attachment], [Start_Time]) VALUES (N'20180413125210307', N'SMTP.GMAIL.COM', 587, N'donotreply@vtelebyte.com', N'vspl@1234', N'asbayes@sanjeevgroup.com', N'', N'', N'TEST EMAIL', N'Hi', N'Y', N'', CAST(N'2018-04-26T14:49:21.260' AS DateTime), N'abc', 0, N'True', N'True', N'C:\Users\Lenovo\Downloads\Far.Cry.3.PC.torrent ; C:\Users\Lenovo\Downloads\Call.of.Duty - SKIDROW.torrent', CAST(N'2018-04-26T14:47:37.963' AS DateTime))
INSERT [dbo].[Email_Logs] ([Eid], [SMTP_Server_Name], [Port_no], [From_Email_id], [Password], [To_Email_id], [CC], [BCC], [Subject], [Body], [Is_Success], [Failure_Message], [Logg], [Project_Name], [Attempts], [Enable_Password], [Enable_SSL], [Attachment], [Start_Time]) VALUES (N'20180416184429505', N'SMTP.GMAIL.COM', 587, N'donotreply@vtelebyte.com', N'vspl@1234', N'asbayes@sanjeevgroup.com', N'TEST EMAIL', N'', N'', N'Hello Akshay', N'Y', N'', CAST(N'2018-04-27T10:09:33.380' AS DateTime), N'abc', 0, N'True', N'True', N'C:\Users\Lenovo\Downloads\Calci.txt', CAST(N'2018-04-27T10:09:28.090' AS DateTime))
INSERT [dbo].[Email_Logs] ([Eid], [SMTP_Server_Name], [Port_no], [From_Email_id], [Password], [To_Email_id], [CC], [BCC], [Subject], [Body], [Is_Success], [Failure_Message], [Logg], [Project_Name], [Attempts], [Enable_Password], [Enable_SSL], [Attachment], [Start_Time]) VALUES (N'20180406165312102', N'SMTP.GMAIL.COM', 587, N'donotreply@vtelebyte.com', N'vspl@1234', N'asbayes@sanjeevgroup.com', N'', N'', N'TEST EMAIL', N'Email Service not working properly', N'N', N'To_Email: asbayes@sanjeevgroup.com
 SMTPException Failure sending mail.
System.IO.IOException: Unable to read data from the transport connection: A connection attempt failed because the connected party did not properly respond after a period of time, or established connection failed because connected host has failed to respond. ---> System.Net.Sockets.SocketException: A connection attempt failed because the connected party did not properly respond after a period of time, or established connection failed because connected host has failed to respond
   at System.Net.Sockets.Socket.Receive(Byte[] buffer, Int32 offset, Int32 size, SocketFlags socketFlags)
   at System.Net.Sockets.NetworkStream.Read(Byte[] buffer, Int32 offset, Int32 size)
   --- End of inner exception stack trace ---
   at System.Net.Sockets.NetworkStream.Read(Byte[] buffer, Int32 offset, Int32 size)
   at System.Net.FixedSizeReader.ReadPacket(Byte[] buffer, Int32 offset, Int32 count)
   at System.Net.Security._SslStream.StartFrameHeader(Byte[] buffer, Int32 offset, Int32 count, AsyncProtocolRequest asyncRequest)
   at System.Net.Security._SslStream.StartReading(Byte[] buffer, Int32 offset, Int32 count, AsyncProtocolRequest asyncRequest)
   at System.Net.Security._SslStream.ProcessRead(Byte[] buffer, Int32 offset, Int32 count, AsyncProtocolRequest asyncRequest)
   at System.Net.TlsStream.Read(Byte[] buffer, Int32 offset, Int32 size)
   at System.Net.PooledStream.Read(Byte[] buffer, Int32 offset, Int32 size)
   at System.Net.Mail.SmtpPooledStream.Dispose(Boolean disposing)
   at System.IO.Stream.Close()
   at System.IO.Stream.Dispose()
   at System.Net.ConnectionPool.Destroy(PooledStream pooledStream)
   at System.Net.ConnectionPool.PutConnection(PooledStream pooledStream, Object owningObject, Int32 creationTimeout, Boolean canReuse)
   at System.Net.Mail.SmtpConnection.GetConnection(ServicePoint servicePoint)
   at System.Net.Mail.SmtpTransport.GetConnection(ServicePoint servicePoint)
   at System.Net.Mail.SmtpClient.GetConnection()
   at System.Net.Mail.SmtpClient.Send(MailMessage message)', CAST(N'2018-04-26T14:50:15.840' AS DateTime), N'abc', 3, N'True', N'True', N'C:\Users\Lenovo\Downloads\Call.of.Duty - SKIDROW.torrent', CAST(N'2018-04-26T14:49:53.550' AS DateTime))
INSERT [dbo].[Email_Logs] ([Eid], [SMTP_Server_Name], [Port_no], [From_Email_id], [Password], [To_Email_id], [CC], [BCC], [Subject], [Body], [Is_Success], [Failure_Message], [Logg], [Project_Name], [Attempts], [Enable_Password], [Enable_SSL], [Attachment], [Start_Time]) VALUES (N'20180405105413103', N'SMTP.GMAIL.COM', 587, N'donotreply@vtelebyte.com', N'vspl@1234', N'rsdarwade@sanjeevgroup.com', N'', N'', N'TEST EMAIL', N'Hi Rishi.. What''s up?', N'Y', N'', CAST(N'2018-04-26T10:18:51.007' AS DateTime), N'abc', 0, N'True', N'True', N'C:\Users\Lenovo\Downloads\Far.Cry.3.PC.torrent;C:\Users\Lenovo\Downloads\Call.of.Duty - SKIDROW.torrent', CAST(N'2018-04-26T10:18:43.433' AS DateTime))
INSERT [dbo].[Email_Logs] ([Eid], [SMTP_Server_Name], [Port_no], [From_Email_id], [Password], [To_Email_id], [CC], [BCC], [Subject], [Body], [Is_Success], [Failure_Message], [Logg], [Project_Name], [Attempts], [Enable_Password], [Enable_SSL], [Attachment], [Start_Time]) VALUES (N'20180406095908984', N'SMTP.GMAIL.COM', 587, N'donotreply@vtelebyte.com', N'vspl@1234', N'rrjain@sanjeevgroup.com', N'', N'', N'TEST EMAIL', N'
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:v="urn:schemas-microsoft-com:vml" xmlns:o="urn:schemas-microsoft-com:office:office">

<head><META NAME="ROBOTS" CONTENT="NOINDEX, NOFOLLOW"><META NAME="referrer" CONTENT="no-referrer">
    <!--HiDPI Fix -->

<!--[if gte mso 9]>
    <xml>
        <o:OfficeDocumentSettings>
        <o:AllowPNG/>
        <o:PixelsPerInch>96</o:PixelsPerInch>
    </o:OfficeDocumentSettings>
    </xml>
<![endif]-->
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="initial-scale=1.0">
<!-- So that mobile webkit will display zoomed in -->
<meta name="format-detection" content="telephone=no">
<!-- disable auto telephone linking in iOS -->
<title>Vendor Corner</title>
<style type="text/css">
    @media only screen and (max-width: 680px) {
        table[id=''content''] {
            width: 100% !important;
        }
        td[class=''column2row''] {
            display: block;
            width: 100% !important;
        }
        td[class=''invisible''] {
            display: none;
        }
        body {
            padding: 0 !important;
        }
        /* Outer-content refers to items outside of the borderd table. Keeps the text from being flush against a device''s borders. */
        td[class=''outer-content''] {
            padding-left: 20px;
            padding-right: 20px;
        }
        td[class=''visible''] {
            display: block !important;
            width: auto !important;
            max-height: inherit !important;
            overflow: visible !important;
            float: none !important;
        }
        .fleximage {
            display: block;
            max-width: 100%;
            width: 100%;
            height: auto;
            border: 0;
            outline: none;
            text-decoration: none;
            -ms-interpolation-mode: bicubic;
        }
    }
</style>

</head>

<body style="background-color: #EFEFEF; margin: 0; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%; height: 100%; width: 100%;"><style type="text/css">
div.preheader 
{ display: none !important; } 
</style>
<div class="preheader" style="font-size: 1px; display: none !important;"></div>
    <table style="background-color: #EFEFEF;" cellpadding="0" cellspacing="0" border="0" width="100%">
        <tr>
            <td align="center">
                <table id="content" width="680" style="width:680px;" border="0" cellspacing="0" cellpadding="0">
                    
<tr>
    <td bgcolor="#42A6A8" align="left" valign="top">
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
                <td valign="middle">
                    <table width="100%" border="0" cellpadding="0" cellspacing="0">
                       
                        <tr>
                            <td align="left" colspan="2" style="color:#ffffff; font-family:''Segoe UI'', Arial, Helvetica, sans-serif; font-size: 36px; font-weight:200; padding-bottom:20px; padding-left:20px;padding-top:10px">
                              <img src="@@sajeevlogo@@"  />
                            </td>
                        </tr>
						
						 <tr>
                            <td align="left" colspan="2" style="color:#ffffff; font-family:''Segoe UI'', Arial, Helvetica, sans-serif; font-size: 36px; font-weight:200; padding-bottom:20px; padding-left:20px;">
                                <a href="#" style="color:#ffffff; text-decoration:none"  target="_blank">Invoice Report</a> <br />
                               
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </td>
</tr>

                    <tr>
                        <td width="100%" bgcolor="#FFFFFF" align="left" valign="top" style="border:none;">
                            <table width="100%" border="0" cellspacing="0" cellpadding="0">

                                <!-- // START block 2 -->
                                

                                <!-- // START block 3 -->
<tr>
    <td width="100%" bgcolor="#ffffff" style="color:#000000; font-size:14px; font-family: ''Segoe UI'', Arial, Helvetica, sans-serif; padding-bottom:0px; padding-left:20px; padding-right:20px; ">
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
           
            <tr>
                <td width="100%" style="color:#000000; font-size:14px; font-family: ''Segoe UI'', Arial, Helvetica, sans-serif; padding-top:0px; padding-bottom:0px; padding-left:0px; padding-right:0px; ">
                    <table width="100%" border="0" cellpadding="0" cellspacing="0">
                        <tr>
                            <td valign="top" style="color:#000000; font-size:14px; font-family: ''Segoe UI'', Arial, Helvetica, sans-serif; padding-top:14px; padding-bottom:0px; padding-left:0px; padding-right:0px;  ">
                                <table width="100%" border="0" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td colspan="2" width="100%" bgcolor="#ffffff" style="color:#5c2d91; font-size:20pt; font-family: ''Segoe UI Light'',''Segoe UI'', Arial, Helvetica, sans-serif; padding-top:0px; padding-bottom:0px; padding-left:0px; padding-right:0px;  border-right: 20px solid #ffffff;">
                                           Invoice Sent For Approval
                                        </td>
                                    </tr>
                                    </table>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2" style="color:#000000; line-height: 21px; font-size:14px; font-family: ''Segoe UI'', Arial, Helvetica, sans-serif; padding-top:20px; padding-bottom:0px; padding-left:0px; padding-right:0px;">
                                            Hello Mr. @@Indentor@@ please find below invoice from "@@VendorName@@" for your apporval. Details as per below, 
                                            <br /><br />
                                        
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </td>
</tr><!-- // END block -->

                                <!-- // START block 1 -->
<tr>
    <td width="100%" bgcolor="#ffffff" style="color:#000000; font-size:14px; font-family: ''Segoe UI'', Arial, Helvetica, sans-serif; padding-top:20px; padding-bottom:0px; padding-left:20px; padding-right:20px; ">
        <table width="100%" border="0" cellpadding="0" cellspacing="0">
            <tr>
                <td width="100%" colspan="2" style="background-color:#d4d4d4; padding-top:1px; padding-bottom:0px; padding-left:0px; padding-right:20px;"></td>
            </tr>
            <tr>
                <td width="100%" style="color:#000000; font-size:14px; font-family: ''Segoe UI'', Arial, Helvetica, sans-serif; padding-top:20px; padding-bottom:0px; padding-left:0px; padding-right:0px;">
                    <table width="100%" border="0" cellpadding="0" cellspacing="0">
                        <tr>
                            <td valign="top" style="color:#000000; font-size:14px; font-family: ''Segoe UI'', Arial, Helvetica, sans-serif; padding-top:14px; padding-bottom:0px; padding-left:0px; padding-right:0px;  ">
                                <table width="100%" border="0" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td width="100%" bgcolor="#ffffff" style="color:#5c2d91; font-size:20pt; font-family: ''Segoe UI Light'',''Segoe UI'', Arial, Helvetica, sans-serif; padding-top:0px; padding-bottom:20px; padding-left:0px; padding-right:0px;  border-right: 20px solid #ffffff;">
                                           Invoice Details
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="color:#000000;background-color:aliceblue; line-height: 21px; font-size:14px; font-family: ''Segoe UI'', Arial, Helvetica, sans-serif;  padding-bottom:0px; padding-left:0px; padding-right:0px;">
                                            <table align="left" border="0" cellpadding="0" cellspacing="0" width="100%">
                                                                <tr>
                                                                    <td align="left" valign="top" class="flexibleContainerBox">
                                                                        <table border="0"  cellpadding="0" cellspacing="0" width="100%" style="max-width: 100%;width:100%;" >
                                                                            <tr>
                                                                                <td align="left" class="textContent">
                                                                                    <h3 style="color:#5F5F5F;line-height:125%;font-family:Helvetica,Arial,sans-serif;font-size:20px;font-weight:normal;margin-top:0;margin-bottom:3px;text-align:left;">PO Details</h3>
																					<div style="text-align:left;font-family:Helvetica,Arial,sans-serif;font-size:15px;margin-bottom:0;color:#5F5F5F;line-height:135%;"><table style=''width:100%;''><tr><td colspan=''2'' style=''width:50%;'' >Vendor Code</td><td  style=''width:50%'' ><b>@@VendorCode@@</b></td></tr></table></div>
                                                                                    <div style="text-align:left;font-family:Helvetica,Arial,sans-serif;font-size:15px;margin-bottom:0;color:#5F5F5F;line-height:135%;"><table style=''width:100%;''><tr><td colspan=''2'' style=''width:50%'' >PO No</td><td  style=''width:50%'' ><b>@@PONo@@</b></td></tr></table></div>
																					
																					
																					
																					
																					<div style="text-align:left;font-family:Helvetica,Arial,sans-serif;font-size:15px;margin-bottom:0;color:#5F5F5F;line-height:135%;"><table style=''width:100%;''><tr><td  style=''width:50%'' colspan=''2''>PO Amt</td><td style=''width:50%'' ><b>@@PO_Amt@@</b></td></tr></table></div>
                                                                                </td>
                                                                            </tr>

                                                                        </table>
                                                                    </td>
                                                                    <td align="right"  valign="middle" class="flexibleContainerBox">
                                                                        <table class="flexibleContainerBoxNext" border="0" cellpadding="0" cellspacing="0" width="100%" style="max-width: 100%;">
                                                                            <tr>
                                                                                <td align="right" class="textContent">
                                                                                    <h3 style="color:#5F5F5F;line-height:125%;font-family:Helvetica,Arial,sans-serif;font-size:20px;font-weight:normal;margin-top:0;margin-bottom:3px;text-align:right;">Invoice Details</h3>
																					<td>
																					</tr>
																					<tr>
<td align="right" class="textContent">
 
 
                                                                                    <div align=''right'' style="text-align:right;font-family:Helvetica,Arial,sans-serif;font-size:15px;margin-bottom:0;color:#5F5F5F;line-height:135%;"><table align=''right'' style=''width:100%;''><tr><td  colspan=''2'' style=''width:50%''>Invoice No</td><td   style=''width:50%''><b>@@InvoiceNo@@<b></td></tr></table></div>
																					
																					<div style="text-align:right;font-family:Helvetica,Arial,sans-serif;font-size:15px;margin-bottom:0;color:#5F5F5F;line-height:135%;"><table align=''right'' style=''width:100%;''><tr><td  colspan=''2'' style=''width:50%''>Invoice Date</td><td style=''width:50%'' ><b>@@Invoice_Date@@</b></td></tr></table></div>
																					
																					<div style="text-align:right;font-family:Helvetica,Arial,sans-serif;font-size:15px;margin-bottom:0;color:#5F5F5F;line-height:135%;"><table align=''right'' style=''width:100%;''><tr><td  colspan=''2'' style=''width:50%''>Amt</td><td  style=''width:50%''><b>@@Amount@@</b></td></tr></table></div>
																					
																					
																					
																					
  
																					
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                          

                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </td>
</tr><!-- // END block -->

<tr>
								<td width="100%" bgcolor="#ffffff" style="color:#000000; font-size:14px; font-family: ''Segoe UI'', Arial, Helvetica, sans-serif; padding-top:30px; padding-bottom:0px; padding-left:20px; padding-right:20px; ">
								<table border="0" cellpadding="30" cellspacing="0" width="500" align=''center'' class="flexibleContainer">
                                                	<tr>
                                                    	<td style="padding-top:0;" align="left" valign="top" width="50%" class="flexibleContainerCell">

                                                            <!-- CONTENT TABLE // -->
                                                            <table border="0" cellpadding="0" cellspacing="0" width="100%" class="emailButton" style="background-color: #42A6A8;">
                                                                <tr>
                                                                    <td align="center" valign="middle" class="buttonContent" style="padding-top:15px;padding-bottom:15px;padding-right:15px;padding-left:15px;width:100%">
                                                                        <a  href=''@@hyperlinkApprove@@'' style="color:#FFFFFF;text-decoration:none;font-family:Helvetica,Arial,sans-serif;font-size:20px;line-height:135%;"  target="_blank">Approve</a>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                            <!-- // CONTENT TABLE -->

                                                        </td>
														<td style="padding-top:0;" align="right" valign="top" width="50%" class="flexibleContainerCell">

                                                            <!-- CONTENT TABLE // -->
                                                            <table border="0" cellpadding="0" cellspacing="0" width="100%" class="emailButton" style="background-color: #42A6A8;">
                                                                <tr>
                                                                    <td align="center" valign="middle" class="buttonContent" style="padding-top:15px;padding-bottom:15px;padding-right:15px;padding-left:15px;">
                                                                        <a href=''@@hyperlinkReject@@''  style="color:#FFFFFF;text-decoration:none;font-family:Helvetica,Arial,sans-serif;font-size:20px;line-height:135%;"  target="_blank">Reject</a>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                            <!-- // CONTENT TABLE -->

                                                        </td>
                                                    </tr>
                                                </table>
								<td>
								</tr>

                                <!-- // START block 4 -->
<tr>
    <td width="100%" bgcolor="#ffffff" style="color:#000000; font-size:14px; font-family: ''Segoe UI'', Arial, Helvetica, sans-serif; padding-top:20px; padding-bottom:0px; padding-left:20px; padding-right:20px; ">
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
                <td width="100%" colspan="2" style="background-color:#d4d4d4; padding-top:1px; padding-bottom:0px; padding-left:0px; padding-right:20px;"></td>
            </tr>
            <tr>
                <td width="100%" style="color:#000000; font-size:14px; font-family: ''Segoe UI'', Arial, Helvetica, sans-serif; padding-top:20px; padding-bottom:0px; padding-left:0px; padding-right:0px; ">
                    <table width="100%" border="0" cellpadding="0" cellspacing="0">
                        <tr>
                            <td valign="top" style="color:#000000; font-size:14px; font-family: ''Segoe UI'', Arial, Helvetica, sans-serif; padding-top:14px; padding-bottom:0px; padding-left:0px; padding-right:0px;  ">
                                <table width="100%" border="0" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td colspan="2" width="100%" bgcolor="#ffffff" style="color:#5c2d91; font-size:20pt; font-family: ''Segoe UI Light'',''Segoe UI'', Arial, Helvetica, sans-serif; padding-top:0px; padding-bottom:0px; padding-left:0px; padding-right:0px;  border-right: 20px solid #ffffff;">
                                            Invoice History
                                        </td>
                                    </tr>
                                								', N'Y', N'', CAST(N'2018-04-26T10:19:30.527' AS DateTime), N'abc', 0, N'True', N'True', N'C:\Users\Lenovo\Downloads\Call.of.Duty - SKIDROW.torrent', CAST(N'2018-04-26T10:19:24.790' AS DateTime))
INSERT [dbo].[Email_Logs] ([Eid], [SMTP_Server_Name], [Port_no], [From_Email_id], [Password], [To_Email_id], [CC], [BCC], [Subject], [Body], [Is_Success], [Failure_Message], [Logg], [Project_Name], [Attempts], [Enable_Password], [Enable_SSL], [Attachment], [Start_Time]) VALUES (N'20180405175139001', N'SMTP.GMAIL.COM', 587, N'donotreply@vtelebyte.com', N'vspl@1234', N'asbayes@sanjeevgroup.com', N'', N'', N'TEST EMAIL', N'<html>
<head></head>
<body>''Hi there Akshay''</body>
</html>', N'Y', N'', CAST(N'2018-04-24T12:14:53.300' AS DateTime), N'abc', 0, N'True', N'True', N'C:\\Users\\Lenovo\\Downloads\\Calci.txt', CAST(N'2018-04-24T12:14:34.293' AS DateTime))
INSERT [dbo].[Email_Logs] ([Eid], [SMTP_Server_Name], [Port_no], [From_Email_id], [Password], [To_Email_id], [CC], [BCC], [Subject], [Body], [Is_Success], [Failure_Message], [Logg], [Project_Name], [Attempts], [Enable_Password], [Enable_SSL], [Attachment], [Start_Time]) VALUES (N'20180405175139001', N'SMTP.GMAIL.COM', 587, N'donotreply@vtelebyte.com', N'vspl@1234', N'asbayes@sanjeevgroup.com', N'', N'', N'TEST EMAIL', N'<html>
<head></head>
<body>''Hi there Akshay''</body>
</html>', N'Y', N'', CAST(N'2018-04-24T12:31:36.493' AS DateTime), N'abc', 0, N'True', N'True', N'C:\\Users\\Lenovo\\Downloads\\Calci.txt', CAST(N'2018-04-24T12:31:27.540' AS DateTime))
INSERT [dbo].[Email_Logs] ([Eid], [SMTP_Server_Name], [Port_no], [From_Email_id], [Password], [To_Email_id], [CC], [BCC], [Subject], [Body], [Is_Success], [Failure_Message], [Logg], [Project_Name], [Attempts], [Enable_Password], [Enable_SSL], [Attachment], [Start_Time]) VALUES (N'20180405175139001', N'SMTP.GMAIL.COM', 587, N'donotreply@vtelebyte.com', N'vspl@1234', N'asbayes@sanjeevgroup.com', N'', N'', N'TEST EMAIL', N'<html>
<head></head>
<body>''Hi there Akshay''</body>
</html>', N'N', N'To_Email: asbayes@sanjeevgroup.com
 SMTPException Failure sending mail.
System.Net.WebException: The remote name could not be resolved: ''SMTP.GMAIL.COM''
   at System.Net.ServicePoint.GetConnection(PooledStream PooledStream, Object owner, Boolean async, IPAddress& address, Socket& abortSocket, Socket& abortSocket6)
   at System.Net.PooledStream.Activate(Object owningObject, Boolean async, GeneralAsyncDelegate asyncCallback)
   at System.Net.PooledStream.Activate(Object owningObject, GeneralAsyncDelegate asyncCallback)
   at System.Net.ConnectionPool.GetConnection(Object owningObject, GeneralAsyncDelegate asyncCallback, Int32 creationTimeout)
   at System.Net.Mail.SmtpConnection.GetConnection(ServicePoint servicePoint)
   at System.Net.Mail.SmtpTransport.GetConnection(ServicePoint servicePoint)
   at System.Net.Mail.SmtpClient.GetConnection()
   at System.Net.Mail.SmtpClient.Send(MailMessage message)', CAST(N'2018-04-19T15:42:58.333' AS DateTime), N'abc', 4, N'True', N'True', N'C:\\Users\\Lenovo\\Downloads\\Calci.txt', CAST(N'2018-04-19T15:40:58.297' AS DateTime))
INSERT [dbo].[Email_Logs] ([Eid], [SMTP_Server_Name], [Port_no], [From_Email_id], [Password], [To_Email_id], [CC], [BCC], [Subject], [Body], [Is_Success], [Failure_Message], [Logg], [Project_Name], [Attempts], [Enable_Password], [Enable_SSL], [Attachment], [Start_Time]) VALUES (N'20180406165312102', N'SMTP.GMAIL.COM', 587, N'donotreply@vtelebyte.com', N'vspl@1234', N'asbayes@sanjeevgroup.com', N'', N'', N'TEST EMAIL', N'Email Service not working properly', N'Y', N'', CAST(N'2018-04-25T12:26:48.657' AS DateTime), N'abc', 0, N'True', N'True', N'C:\Users\Lenovo\Downloads\Call.of.Duty - SKIDROW.torrent', CAST(N'2018-04-25T12:26:41.277' AS DateTime))
INSERT [dbo].[Email_Logs] ([Eid], [SMTP_Server_Name], [Port_no], [From_Email_id], [Password], [To_Email_id], [CC], [BCC], [Subject], [Body], [Is_Success], [Failure_Message], [Logg], [Project_Name], [Attempts], [Enable_Password], [Enable_SSL], [Attachment], [Start_Time]) VALUES (N'20180405175139001', N'SMTP.GMAIL.COM', 587, N'donotreply@vtelebyte.com', N'vspl@1234', N'asbayes@sanjeevgroup.com', N'', N'', N'TEST EMAIL', N'<html>
<head></head>
<body>''Hi there Akshay''</body>
</html>', N'N', N'To_Email: asbayes@sanjeevgroup.com
 SMTPException Failure sending mail.
System.Net.WebException: The remote name could not be resolved: ''SMTP.GMAIL.COM''
   at System.Net.ServicePoint.GetConnection(PooledStream PooledStream, Object owner, Boolean async, IPAddress& address, Socket& abortSocket, Socket& abortSocket6)
   at System.Net.PooledStream.Activate(Object owningObject, Boolean async, GeneralAsyncDelegate asyncCallback)
   at System.Net.PooledStream.Activate(Object owningObject, GeneralAsyncDelegate asyncCallback)
   at System.Net.ConnectionPool.GetConnection(Object owningObject, GeneralAsyncDelegate asyncCallback, Int32 creationTimeout)
   at System.Net.Mail.SmtpConnection.GetConnection(ServicePoint servicePoint)
   at System.Net.Mail.SmtpTransport.GetConnection(ServicePoint servicePoint)
   at System.Net.Mail.SmtpClient.GetConnection()
   at System.Net.Mail.SmtpClient.Send(MailMessage message)', CAST(N'2018-04-19T15:44:58.310' AS DateTime), N'abc', 3, N'True', N'True', N'C:\\Users\\Lenovo\\Downloads\\Calci.txt', CAST(N'2018-04-19T15:43:58.317' AS DateTime))
INSERT [dbo].[Email_Logs] ([Eid], [SMTP_Server_Name], [Port_no], [From_Email_id], [Password], [To_Email_id], [CC], [BCC], [Subject], [Body], [Is_Success], [Failure_Message], [Logg], [Project_Name], [Attempts], [Enable_Password], [Enable_SSL], [Attachment], [Start_Time]) VALUES (N'20180406165312102', N'SMTP.GMAIL.COM', 587, N'donotreply@vtelebyte.com', N'vspl@1234', N'asbayes@sanjeevgroup.com', N'', N'', N'TEST EMAIL', N'Email Service not working properly', N'Y', N'', CAST(N'2018-04-27T10:40:40.963' AS DateTime), N'abc', 0, N'True', N'True', N'C:\Users\Lenovo\Downloads\Call.of.Duty - SKIDROW.torrent', CAST(N'2018-04-27T10:40:33.353' AS DateTime))
INSERT [dbo].[Email_Logs] ([Eid], [SMTP_Server_Name], [Port_no], [From_Email_id], [Password], [To_Email_id], [CC], [BCC], [Subject], [Body], [Is_Success], [Failure_Message], [Logg], [Project_Name], [Attempts], [Enable_Password], [Enable_SSL], [Attachment], [Start_Time]) VALUES (N'20180416184429505', N'SMTP.GMAIL.COM', 587, N'donotreply@vtelebyte.com', N'vspl@1234', N'asbayes@sanjeevgroup.com', N'', N'', N'TEST EMAIL', N'Hello Akshay', N'Y', N'', CAST(N'2018-04-27T10:40:46.303' AS DateTime), N'abc', 0, N'True', N'True', N'C:\Users\Lenovo\Downloads\Calci.txt', CAST(N'2018-04-27T10:40:41.000' AS DateTime))
INSERT [dbo].[Email_Logs] ([Eid], [SMTP_Server_Name], [Port_no], [From_Email_id], [Password], [To_Email_id], [CC], [BCC], [Subject], [Body], [Is_Success], [Failure_Message], [Logg], [Project_Name], [Attempts], [Enable_Password], [Enable_SSL], [Attachment], [Start_Time]) VALUES (N'20180405175139001', N'SMTP.GMAIL.COM', 587, N'donotreply@vtelebyte.com', N'vspl@1234', N'asbayes@sanjeevgroup.com', N'', N'', N'TEST EMAIL', N'<html>
<head></head>
<body>''Hi there Akshay''</body>
</html>', N'Y', N'', CAST(N'2018-04-19T16:44:51.453' AS DateTime), N'abc', 0, N'True', N'True', N'C:\\Users\\Lenovo\\Downloads\\Calci.txt', CAST(N'2018-04-19T16:44:38.163' AS DateTime))
INSERT [dbo].[Email_Logs] ([Eid], [SMTP_Server_Name], [Port_no], [From_Email_id], [Password], [To_Email_id], [CC], [BCC], [Subject], [Body], [Is_Success], [Failure_Message], [Logg], [Project_Name], [Attempts], [Enable_Password], [Enable_SSL], [Attachment], [Start_Time]) VALUES (N'20180406095908984', N'SMTP.GMAIL.COM', 587, N'donotreply@vtelebyte.com', N'vspl@1234', N'rrjain@sanjeevgroup.com', N'', N'', N'TEST EMAIL', N'
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:v="urn:schemas-microsoft-com:vml" xmlns:o="urn:schemas-microsoft-com:office:office">

<head><META NAME="ROBOTS" CONTENT="NOINDEX, NOFOLLOW"><META NAME="referrer" CONTENT="no-referrer">
    <!--HiDPI Fix -->

<!--[if gte mso 9]>
    <xml>
        <o:OfficeDocumentSettings>
        <o:AllowPNG/>
        <o:PixelsPerInch>96</o:PixelsPerInch>
    </o:OfficeDocumentSettings>
    </xml>
<![endif]-->
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="initial-scale=1.0">
<!-- So that mobile webkit will display zoomed in -->
<meta name="format-detection" content="telephone=no">
<!-- disable auto telephone linking in iOS -->
<title>Vendor Corner</title>
<style type="text/css">
    @media only screen and (max-width: 680px) {
        table[id=''content''] {
            width: 100% !important;
        }
        td[class=''column2row''] {
            display: block;
            width: 100% !important;
        }
        td[class=''invisible''] {
            display: none;
        }
        body {
            padding: 0 !important;
        }
        /* Outer-content refers to items outside of the borderd table. Keeps the text from being flush against a device''s borders. */
        td[class=''outer-content''] {
            padding-left: 20px;
            padding-right: 20px;
        }
        td[class=''visible''] {
            display: block !important;
            width: auto !important;
            max-height: inherit !important;
            overflow: visible !important;
            float: none !important;
        }
        .fleximage {
            display: block;
            max-width: 100%;
            width: 100%;
            height: auto;
            border: 0;
            outline: none;
            text-decoration: none;
            -ms-interpolation-mode: bicubic;
        }
    }
</style>

</head>

<body style="background-color: #EFEFEF; margin: 0; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%; height: 100%; width: 100%;"><style type="text/css">
div.preheader 
{ display: none !important; } 
</style>
<div class="preheader" style="font-size: 1px; display: none !important;"></div>
    <table style="background-color: #EFEFEF;" cellpadding="0" cellspacing="0" border="0" width="100%">
        <tr>
            <td align="center">
                <table id="content" width="680" style="width:680px;" border="0" cellspacing="0" cellpadding="0">
                    
<tr>
    <td bgcolor="#42A6A8" align="left" valign="top">
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
                <td valign="middle">
                    <table width="100%" border="0" cellpadding="0" cellspacing="0">
                       
                        <tr>
                            <td align="left" colspan="2" style="color:#ffffff; font-family:''Segoe UI'', Arial, Helvetica, sans-serif; font-size: 36px; font-weight:200; padding-bottom:20px; padding-left:20px;padding-top:10px">
                              <img src="@@sajeevlogo@@"  />
                            </td>
                        </tr>
						
						 <tr>
                            <td align="left" colspan="2" style="color:#ffffff; font-family:''Segoe UI'', Arial, Helvetica, sans-serif; font-size: 36px; font-weight:200; padding-bottom:20px; padding-left:20px;">
                                <a href="#" style="color:#ffffff; text-decoration:none"  target="_blank">Invoice Report</a> <br />
                               
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </td>
</tr>

                    <tr>
                        <td width="100%" bgcolor="#FFFFFF" align="left" valign="top" style="border:none;">
                            <table width="100%" border="0" cellspacing="0" cellpadding="0">

                                <!-- // START block 2 -->
                                

                                <!-- // START block 3 -->
<tr>
    <td width="100%" bgcolor="#ffffff" style="color:#000000; font-size:14px; font-family: ''Segoe UI'', Arial, Helvetica, sans-serif; padding-bottom:0px; padding-left:20px; padding-right:20px; ">
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
           
            <tr>
                <td width="100%" style="color:#000000; font-size:14px; font-family: ''Segoe UI'', Arial, Helvetica, sans-serif; padding-top:0px; padding-bottom:0px; padding-left:0px; padding-right:0px; ">
                    <table width="100%" border="0" cellpadding="0" cellspacing="0">
                        <tr>
                            <td valign="top" style="color:#000000; font-size:14px; font-family: ''Segoe UI'', Arial, Helvetica, sans-serif; padding-top:14px; padding-bottom:0px; padding-left:0px; padding-right:0px;  ">
                                <table width="100%" border="0" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td colspan="2" width="100%" bgcolor="#ffffff" style="color:#5c2d91; font-size:20pt; font-family: ''Segoe UI Light'',''Segoe UI'', Arial, Helvetica, sans-serif; padding-top:0px; padding-bottom:0px; padding-left:0px; padding-right:0px;  border-right: 20px solid #ffffff;">
                                           Invoice Sent For Approval
                                        </td>
                                    </tr>
                                    </table>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2" style="color:#000000; line-height: 21px; font-size:14px; font-family: ''Segoe UI'', Arial, Helvetica, sans-serif; padding-top:20px; padding-bottom:0px; padding-left:0px; padding-right:0px;">
                                            Hello Mr. @@Indentor@@ please find below invoice from "@@VendorName@@" for your apporval. Details as per below, 
                                            <br /><br />
                                        
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </td>
</tr><!-- // END block -->

                                <!-- // START block 1 -->
<tr>
    <td width="100%" bgcolor="#ffffff" style="color:#000000; font-size:14px; font-family: ''Segoe UI'', Arial, Helvetica, sans-serif; padding-top:20px; padding-bottom:0px; padding-left:20px; padding-right:20px; ">
        <table width="100%" border="0" cellpadding="0" cellspacing="0">
            <tr>
                <td width="100%" colspan="2" style="background-color:#d4d4d4; padding-top:1px; padding-bottom:0px; padding-left:0px; padding-right:20px;"></td>
            </tr>
            <tr>
                <td width="100%" style="color:#000000; font-size:14px; font-family: ''Segoe UI'', Arial, Helvetica, sans-serif; padding-top:20px; padding-bottom:0px; padding-left:0px; padding-right:0px;">
                    <table width="100%" border="0" cellpadding="0" cellspacing="0">
                        <tr>
                            <td valign="top" style="color:#000000; font-size:14px; font-family: ''Segoe UI'', Arial, Helvetica, sans-serif; padding-top:14px; padding-bottom:0px; padding-left:0px; padding-right:0px;  ">
                                <table width="100%" border="0" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td width="100%" bgcolor="#ffffff" style="color:#5c2d91; font-size:20pt; font-family: ''Segoe UI Light'',''Segoe UI'', Arial, Helvetica, sans-serif; padding-top:0px; padding-bottom:20px; padding-left:0px; padding-right:0px;  border-right: 20px solid #ffffff;">
                                           Invoice Details
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="color:#000000;background-color:aliceblue; line-height: 21px; font-size:14px; font-family: ''Segoe UI'', Arial, Helvetica, sans-serif;  padding-bottom:0px; padding-left:0px; padding-right:0px;">
                                            <table align="left" border="0" cellpadding="0" cellspacing="0" width="100%">
                                                                <tr>
                                                                    <td align="left" valign="top" class="flexibleContainerBox">
                                                                        <table border="0"  cellpadding="0" cellspacing="0" width="100%" style="max-width: 100%;width:100%;" >
                                                                            <tr>
                                                                                <td align="left" class="textContent">
                                                                                    <h3 style="color:#5F5F5F;line-height:125%;font-family:Helvetica,Arial,sans-serif;font-size:20px;font-weight:normal;margin-top:0;margin-bottom:3px;text-align:left;">PO Details</h3>
																					<div style="text-align:left;font-family:Helvetica,Arial,sans-serif;font-size:15px;margin-bottom:0;color:#5F5F5F;line-height:135%;"><table style=''width:100%;''><tr><td colspan=''2'' style=''width:50%;'' >Vendor Code</td><td  style=''width:50%'' ><b>@@VendorCode@@</b></td></tr></table></div>
                                                                                    <div style="text-align:left;font-family:Helvetica,Arial,sans-serif;font-size:15px;margin-bottom:0;color:#5F5F5F;line-height:135%;"><table style=''width:100%;''><tr><td colspan=''2'' style=''width:50%'' >PO No</td><td  style=''width:50%'' ><b>@@PONo@@</b></td></tr></table></div>
																					
																					
																					
																					
																					<div style="text-align:left;font-family:Helvetica,Arial,sans-serif;font-size:15px;margin-bottom:0;color:#5F5F5F;line-height:135%;"><table style=''width:100%;''><tr><td  style=''width:50%'' colspan=''2''>PO Amt</td><td style=''width:50%'' ><b>@@PO_Amt@@</b></td></tr></table></div>
                                                                                </td>
                                                                            </tr>

                                                                        </table>
                                                                    </td>
                                                                    <td align="right"  valign="middle" class="flexibleContainerBox">
                                                                        <table class="flexibleContainerBoxNext" border="0" cellpadding="0" cellspacing="0" width="100%" style="max-width: 100%;">
                                                                            <tr>
                                                                                <td align="right" class="textContent">
                                                                                    <h3 style="color:#5F5F5F;line-height:125%;font-family:Helvetica,Arial,sans-serif;font-size:20px;font-weight:normal;margin-top:0;margin-bottom:3px;text-align:right;">Invoice Details</h3>
																					<td>
																					</tr>
																					<tr>
<td align="right" class="textContent">
 
 
                                                                                    <div align=''right'' style="text-align:right;font-family:Helvetica,Arial,sans-serif;font-size:15px;margin-bottom:0;color:#5F5F5F;line-height:135%;"><table align=''right'' style=''width:100%;''><tr><td  colspan=''2'' style=''width:50%''>Invoice No</td><td   style=''width:50%''><b>@@InvoiceNo@@<b></td></tr></table></div>
																					
																					<div style="text-align:right;font-family:Helvetica,Arial,sans-serif;font-size:15px;margin-bottom:0;color:#5F5F5F;line-height:135%;"><table align=''right'' style=''width:100%;''><tr><td  colspan=''2'' style=''width:50%''>Invoice Date</td><td style=''width:50%'' ><b>@@Invoice_Date@@</b></td></tr></table></div>
																					
																					<div style="text-align:right;font-family:Helvetica,Arial,sans-serif;font-size:15px;margin-bottom:0;color:#5F5F5F;line-height:135%;"><table align=''right'' style=''width:100%;''><tr><td  colspan=''2'' style=''width:50%''>Amt</td><td  style=''width:50%''><b>@@Amount@@</b></td></tr></table></div>
																					
																					
																					
																					
  
																					
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                          

                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </td>
</tr><!-- // END block -->

<tr>
								<td width="100%" bgcolor="#ffffff" style="color:#000000; font-size:14px; font-family: ''Segoe UI'', Arial, Helvetica, sans-serif; padding-top:30px; padding-bottom:0px; padding-left:20px; padding-right:20px; ">
								<table border="0" cellpadding="30" cellspacing="0" width="500" align=''center'' class="flexibleContainer">
                                                	<tr>
                                                    	<td style="padding-top:0;" align="left" valign="top" width="50%" class="flexibleContainerCell">

                                                            <!-- CONTENT TABLE // -->
                                                            <table border="0" cellpadding="0" cellspacing="0" width="100%" class="emailButton" style="background-color: #42A6A8;">
                                                                <tr>
                                                                    <td align="center" valign="middle" class="buttonContent" style="padding-top:15px;padding-bottom:15px;padding-right:15px;padding-left:15px;width:100%">
                                                                        <a  href=''@@hyperlinkApprove@@'' style="color:#FFFFFF;text-decoration:none;font-family:Helvetica,Arial,sans-serif;font-size:20px;line-height:135%;"  target="_blank">Approve</a>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                            <!-- // CONTENT TABLE -->

                                                        </td>
														<td style="padding-top:0;" align="right" valign="top" width="50%" class="flexibleContainerCell">

                                                            <!-- CONTENT TABLE // -->
                                                            <table border="0" cellpadding="0" cellspacing="0" width="100%" class="emailButton" style="background-color: #42A6A8;">
                                                                <tr>
                                                                    <td align="center" valign="middle" class="buttonContent" style="padding-top:15px;padding-bottom:15px;padding-right:15px;padding-left:15px;">
                                                                        <a href=''@@hyperlinkReject@@''  style="color:#FFFFFF;text-decoration:none;font-family:Helvetica,Arial,sans-serif;font-size:20px;line-height:135%;"  target="_blank">Reject</a>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                            <!-- // CONTENT TABLE -->

                                                        </td>
                                                    </tr>
                                                </table>
								<td>
								</tr>

                                <!-- // START block 4 -->
<tr>
    <td width="100%" bgcolor="#ffffff" style="color:#000000; font-size:14px; font-family: ''Segoe UI'', Arial, Helvetica, sans-serif; padding-top:20px; padding-bottom:0px; padding-left:20px; padding-right:20px; ">
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
                <td width="100%" colspan="2" style="background-color:#d4d4d4; padding-top:1px; padding-bottom:0px; padding-left:0px; padding-right:20px;"></td>
            </tr>
            <tr>
                <td width="100%" style="color:#000000; font-size:14px; font-family: ''Segoe UI'', Arial, Helvetica, sans-serif; padding-top:20px; padding-bottom:0px; padding-left:0px; padding-right:0px; ">
                    <table width="100%" border="0" cellpadding="0" cellspacing="0">
                        <tr>
                            <td valign="top" style="color:#000000; font-size:14px; font-family: ''Segoe UI'', Arial, Helvetica, sans-serif; padding-top:14px; padding-bottom:0px; padding-left:0px; padding-right:0px;  ">
                                <table width="100%" border="0" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td colspan="2" width="100%" bgcolor="#ffffff" style="color:#5c2d91; font-size:20pt; font-family: ''Segoe UI Light'',''Segoe UI'', Arial, Helvetica, sans-serif; padding-top:0px; padding-bottom:0px; padding-left:0px; padding-right:0px;  border-right: 20px solid #ffffff;">
                                            Invoice History
                                        </td>
                                    </tr>
                                								', N'Y', N'', CAST(N'2018-04-24T15:22:20.510' AS DateTime), N'abc', 0, N'True', N'True', N'C:\Users\Lenovo\Downloads\Call.of.Duty - SKIDROW.torrent', CAST(N'2018-04-24T15:22:11.910' AS DateTime))
INSERT [dbo].[Email_Logs] ([Eid], [SMTP_Server_Name], [Port_no], [From_Email_id], [Password], [To_Email_id], [CC], [BCC], [Subject], [Body], [Is_Success], [Failure_Message], [Logg], [Project_Name], [Attempts], [Enable_Password], [Enable_SSL], [Attachment], [Start_Time]) VALUES (N'20180416184429505', N'SMTP.GMAIL.COM', 587, N'donotreply@vtelebyte.com', N'vspl@1234', N'asbayes@sanjeevgroup.com', N'', N'', N'TEST EMAIL', N'Hello Akshay', N'Y', N'', CAST(N'2018-04-24T15:22:45.067' AS DateTime), N'abc', 0, N'True', N'True', N'C:\Users\Lenovo\Downloads\Calci.txt', CAST(N'2018-04-24T15:22:35.013' AS DateTime))
INSERT [dbo].[Email_Settings] ([Eid], [SMTP_Server_Name], [Port_no], [From_Email_id], [Password], [To_Email_id], [CC], [BCC], [Subject], [Body], [Is_Success], [Failure_Message], [Logg], [Project_Name], [Attempts], [Enable_Password], [Enable_SSL], [Attachment], [Start_Time]) VALUES (N'20180413125210307', N'SMTP.GMAIL.COM', 587, N'donotreply@vtelebyte.com', N'vspl@1234', N'asbayes@sanjeevgroup.com', N'', N'', N'TEST EMAIL', N'Hi', N'Y', N'', CAST(N'2018-04-26T14:49:21.260' AS DateTime), N'abc', 0, N'True', N'True', N'C:\Users\Lenovo\Downloads\Far.Cry.3.PC.torrent ; C:\Users\Lenovo\Downloads\Call.of.Duty - SKIDROW.torrent', CAST(N'2018-04-26T14:47:37.963' AS DateTime))
INSERT [dbo].[Email_Settings] ([Eid], [SMTP_Server_Name], [Port_no], [From_Email_id], [Password], [To_Email_id], [CC], [BCC], [Subject], [Body], [Is_Success], [Failure_Message], [Logg], [Project_Name], [Attempts], [Enable_Password], [Enable_SSL], [Attachment], [Start_Time]) VALUES (N'20180404141858891', N'SMTP.GMAIL.COM', 587, N'donotreply@vtelebyte.com', N'vspl@1234', N'msjoshi@sanjeevgroup.com', N'', N'', N'TEST EMAIL', N'Welcome to Sanjeev Group and Vtelebyte Manish !!', N'Y', N'', CAST(N'2018-04-24T16:07:56.830' AS DateTime), N'abc', 0, N'True', N'True', NULL, CAST(N'2018-04-24T16:07:51.793' AS DateTime))
INSERT [dbo].[Email_Settings] ([Eid], [SMTP_Server_Name], [Port_no], [From_Email_id], [Password], [To_Email_id], [CC], [BCC], [Subject], [Body], [Is_Success], [Failure_Message], [Logg], [Project_Name], [Attempts], [Enable_Password], [Enable_SSL], [Attachment], [Start_Time]) VALUES (N'20180405105413103', N'SMTP.GMAIL.COM', 587, N'donotreply@vtelebyte.com', N'vspl@1234', N'rsdarwade@sanjeevgroup.com', N'', N'', N'TEST EMAIL', N'Hi Rishi.. What''s up?', N'Y', N'', CAST(N'2018-04-26T10:18:51.007' AS DateTime), N'abc', 0, N'True', N'True', N'C:\Users\Lenovo\Downloads\Far.Cry.3.PC.torrent;C:\Users\Lenovo\Downloads\Call.of.Duty - SKIDROW.torrent', CAST(N'2018-04-26T10:18:43.433' AS DateTime))
INSERT [dbo].[Email_Settings] ([Eid], [SMTP_Server_Name], [Port_no], [From_Email_id], [Password], [To_Email_id], [CC], [BCC], [Subject], [Body], [Is_Success], [Failure_Message], [Logg], [Project_Name], [Attempts], [Enable_Password], [Enable_SSL], [Attachment], [Start_Time]) VALUES (N'20180405175139001', N'SMTP.GMAIL.COM', 587, N'donotreply@vtelebyte.com', N'vspl@1234', N'asbayes@sanjeevgroup.com', N'', N'', N'TEST EMAIL', N'<html>
<head></head>
<body>''Hi there Akshay''</body>
</html>', N'Y', N'', CAST(N'2018-04-24T16:09:51.180' AS DateTime), N'abc', 0, N'True', N'True', N'C:\\Users\\Lenovo\\Downloads\\Calci.txt', CAST(N'2018-04-24T16:09:45.003' AS DateTime))
INSERT [dbo].[Email_Settings] ([Eid], [SMTP_Server_Name], [Port_no], [From_Email_id], [Password], [To_Email_id], [CC], [BCC], [Subject], [Body], [Is_Success], [Failure_Message], [Logg], [Project_Name], [Attempts], [Enable_Password], [Enable_SSL], [Attachment], [Start_Time]) VALUES (N'20180406095908984', N'SMTP.GMAIL.COM', 587, N'donotreply@vtelebyte.com', N'vspl@1234', N'rrjain@sanjeevgroup.com', N'', N'', N'TEST EMAIL', N'
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:v="urn:schemas-microsoft-com:vml" xmlns:o="urn:schemas-microsoft-com:office:office">

<head><META NAME="ROBOTS" CONTENT="NOINDEX, NOFOLLOW"><META NAME="referrer" CONTENT="no-referrer">
    <!--HiDPI Fix -->

<!--[if gte mso 9]>
    <xml>
        <o:OfficeDocumentSettings>
        <o:AllowPNG/>
        <o:PixelsPerInch>96</o:PixelsPerInch>
    </o:OfficeDocumentSettings>
    </xml>
<![endif]-->
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="initial-scale=1.0">
<!-- So that mobile webkit will display zoomed in -->
<meta name="format-detection" content="telephone=no">
<!-- disable auto telephone linking in iOS -->
<title>Vendor Corner</title>
<style type="text/css">
    @media only screen and (max-width: 680px) {
        table[id=''content''] {
            width: 100% !important;
        }
        td[class=''column2row''] {
            display: block;
            width: 100% !important;
        }
        td[class=''invisible''] {
            display: none;
        }
        body {
            padding: 0 !important;
        }
        /* Outer-content refers to items outside of the borderd table. Keeps the text from being flush against a device''s borders. */
        td[class=''outer-content''] {
            padding-left: 20px;
            padding-right: 20px;
        }
        td[class=''visible''] {
            display: block !important;
            width: auto !important;
            max-height: inherit !important;
            overflow: visible !important;
            float: none !important;
        }
        .fleximage {
            display: block;
            max-width: 100%;
            width: 100%;
            height: auto;
            border: 0;
            outline: none;
            text-decoration: none;
            -ms-interpolation-mode: bicubic;
        }
    }
</style>

</head>

<body style="background-color: #EFEFEF; margin: 0; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%; height: 100%; width: 100%;"><style type="text/css">
div.preheader 
{ display: none !important; } 
</style>
<div class="preheader" style="font-size: 1px; display: none !important;"></div>
    <table style="background-color: #EFEFEF;" cellpadding="0" cellspacing="0" border="0" width="100%">
        <tr>
            <td align="center">
                <table id="content" width="680" style="width:680px;" border="0" cellspacing="0" cellpadding="0">
                    
<tr>
    <td bgcolor="#42A6A8" align="left" valign="top">
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
                <td valign="middle">
                    <table width="100%" border="0" cellpadding="0" cellspacing="0">
                       
                        <tr>
                            <td align="left" colspan="2" style="color:#ffffff; font-family:''Segoe UI'', Arial, Helvetica, sans-serif; font-size: 36px; font-weight:200; padding-bottom:20px; padding-left:20px;padding-top:10px">
                              <img src="@@sajeevlogo@@"  />
                            </td>
                        </tr>
						
						 <tr>
                            <td align="left" colspan="2" style="color:#ffffff; font-family:''Segoe UI'', Arial, Helvetica, sans-serif; font-size: 36px; font-weight:200; padding-bottom:20px; padding-left:20px;">
                                <a href="#" style="color:#ffffff; text-decoration:none"  target="_blank">Invoice Report</a> <br />
                               
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </td>
</tr>

                    <tr>
                        <td width="100%" bgcolor="#FFFFFF" align="left" valign="top" style="border:none;">
                            <table width="100%" border="0" cellspacing="0" cellpadding="0">

                                <!-- // START block 2 -->
                                

                                <!-- // START block 3 -->
<tr>
    <td width="100%" bgcolor="#ffffff" style="color:#000000; font-size:14px; font-family: ''Segoe UI'', Arial, Helvetica, sans-serif; padding-bottom:0px; padding-left:20px; padding-right:20px; ">
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
           
            <tr>
                <td width="100%" style="color:#000000; font-size:14px; font-family: ''Segoe UI'', Arial, Helvetica, sans-serif; padding-top:0px; padding-bottom:0px; padding-left:0px; padding-right:0px; ">
                    <table width="100%" border="0" cellpadding="0" cellspacing="0">
                        <tr>
                            <td valign="top" style="color:#000000; font-size:14px; font-family: ''Segoe UI'', Arial, Helvetica, sans-serif; padding-top:14px; padding-bottom:0px; padding-left:0px; padding-right:0px;  ">
                                <table width="100%" border="0" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td colspan="2" width="100%" bgcolor="#ffffff" style="color:#5c2d91; font-size:20pt; font-family: ''Segoe UI Light'',''Segoe UI'', Arial, Helvetica, sans-serif; padding-top:0px; padding-bottom:0px; padding-left:0px; padding-right:0px;  border-right: 20px solid #ffffff;">
                                           Invoice Sent For Approval
                                        </td>
                                    </tr>
                                    </table>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2" style="color:#000000; line-height: 21px; font-size:14px; font-family: ''Segoe UI'', Arial, Helvetica, sans-serif; padding-top:20px; padding-bottom:0px; padding-left:0px; padding-right:0px;">
                                            Hello Mr. @@Indentor@@ please find below invoice from "@@VendorName@@" for your apporval. Details as per below, 
                                            <br /><br />
                                        
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </td>
</tr><!-- // END block -->

                                <!-- // START block 1 -->
<tr>
    <td width="100%" bgcolor="#ffffff" style="color:#000000; font-size:14px; font-family: ''Segoe UI'', Arial, Helvetica, sans-serif; padding-top:20px; padding-bottom:0px; padding-left:20px; padding-right:20px; ">
        <table width="100%" border="0" cellpadding="0" cellspacing="0">
            <tr>
                <td width="100%" colspan="2" style="background-color:#d4d4d4; padding-top:1px; padding-bottom:0px; padding-left:0px; padding-right:20px;"></td>
            </tr>
            <tr>
                <td width="100%" style="color:#000000; font-size:14px; font-family: ''Segoe UI'', Arial, Helvetica, sans-serif; padding-top:20px; padding-bottom:0px; padding-left:0px; padding-right:0px;">
                    <table width="100%" border="0" cellpadding="0" cellspacing="0">
                        <tr>
                            <td valign="top" style="color:#000000; font-size:14px; font-family: ''Segoe UI'', Arial, Helvetica, sans-serif; padding-top:14px; padding-bottom:0px; padding-left:0px; padding-right:0px;  ">
                                <table width="100%" border="0" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td width="100%" bgcolor="#ffffff" style="color:#5c2d91; font-size:20pt; font-family: ''Segoe UI Light'',''Segoe UI'', Arial, Helvetica, sans-serif; padding-top:0px; padding-bottom:20px; padding-left:0px; padding-right:0px;  border-right: 20px solid #ffffff;">
                                           Invoice Details
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="color:#000000;background-color:aliceblue; line-height: 21px; font-size:14px; font-family: ''Segoe UI'', Arial, Helvetica, sans-serif;  padding-bottom:0px; padding-left:0px; padding-right:0px;">
                                            <table align="left" border="0" cellpadding="0" cellspacing="0" width="100%">
                                                                <tr>
                                                                    <td align="left" valign="top" class="flexibleContainerBox">
                                                                        <table border="0"  cellpadding="0" cellspacing="0" width="100%" style="max-width: 100%;width:100%;" >
                                                                            <tr>
                                                                                <td align="left" class="textContent">
                                                                                    <h3 style="color:#5F5F5F;line-height:125%;font-family:Helvetica,Arial,sans-serif;font-size:20px;font-weight:normal;margin-top:0;margin-bottom:3px;text-align:left;">PO Details</h3>
																					<div style="text-align:left;font-family:Helvetica,Arial,sans-serif;font-size:15px;margin-bottom:0;color:#5F5F5F;line-height:135%;"><table style=''width:100%;''><tr><td colspan=''2'' style=''width:50%;'' >Vendor Code</td><td  style=''width:50%'' ><b>@@VendorCode@@</b></td></tr></table></div>
                                                                                    <div style="text-align:left;font-family:Helvetica,Arial,sans-serif;font-size:15px;margin-bottom:0;color:#5F5F5F;line-height:135%;"><table style=''width:100%;''><tr><td colspan=''2'' style=''width:50%'' >PO No</td><td  style=''width:50%'' ><b>@@PONo@@</b></td></tr></table></div>
																					
																					
																					
																					
																					<div style="text-align:left;font-family:Helvetica,Arial,sans-serif;font-size:15px;margin-bottom:0;color:#5F5F5F;line-height:135%;"><table style=''width:100%;''><tr><td  style=''width:50%'' colspan=''2''>PO Amt</td><td style=''width:50%'' ><b>@@PO_Amt@@</b></td></tr></table></div>
                                                                                </td>
                                                                            </tr>

                                                                        </table>
                                                                    </td>
                                                                    <td align="right"  valign="middle" class="flexibleContainerBox">
                                                                        <table class="flexibleContainerBoxNext" border="0" cellpadding="0" cellspacing="0" width="100%" style="max-width: 100%;">
                                                                            <tr>
                                                                                <td align="right" class="textContent">
                                                                                    <h3 style="color:#5F5F5F;line-height:125%;font-family:Helvetica,Arial,sans-serif;font-size:20px;font-weight:normal;margin-top:0;margin-bottom:3px;text-align:right;">Invoice Details</h3>
																					<td>
																					</tr>
																					<tr>
<td align="right" class="textContent">
 
 
                                                                                    <div align=''right'' style="text-align:right;font-family:Helvetica,Arial,sans-serif;font-size:15px;margin-bottom:0;color:#5F5F5F;line-height:135%;"><table align=''right'' style=''width:100%;''><tr><td  colspan=''2'' style=''width:50%''>Invoice No</td><td   style=''width:50%''><b>@@InvoiceNo@@<b></td></tr></table></div>
																					
																					<div style="text-align:right;font-family:Helvetica,Arial,sans-serif;font-size:15px;margin-bottom:0;color:#5F5F5F;line-height:135%;"><table align=''right'' style=''width:100%;''><tr><td  colspan=''2'' style=''width:50%''>Invoice Date</td><td style=''width:50%'' ><b>@@Invoice_Date@@</b></td></tr></table></div>
																					
																					<div style="text-align:right;font-family:Helvetica,Arial,sans-serif;font-size:15px;margin-bottom:0;color:#5F5F5F;line-height:135%;"><table align=''right'' style=''width:100%;''><tr><td  colspan=''2'' style=''width:50%''>Amt</td><td  style=''width:50%''><b>@@Amount@@</b></td></tr></table></div>
																					
																					
																					
																					
  
																					
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                          

                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </td>
</tr><!-- // END block -->

<tr>
								<td width="100%" bgcolor="#ffffff" style="color:#000000; font-size:14px; font-family: ''Segoe UI'', Arial, Helvetica, sans-serif; padding-top:30px; padding-bottom:0px; padding-left:20px; padding-right:20px; ">
								<table border="0" cellpadding="30" cellspacing="0" width="500" align=''center'' class="flexibleContainer">
                                                	<tr>
                                                    	<td style="padding-top:0;" align="left" valign="top" width="50%" class="flexibleContainerCell">

                                                            <!-- CONTENT TABLE // -->
                                                            <table border="0" cellpadding="0" cellspacing="0" width="100%" class="emailButton" style="background-color: #42A6A8;">
                                                                <tr>
                                                                    <td align="center" valign="middle" class="buttonContent" style="padding-top:15px;padding-bottom:15px;padding-right:15px;padding-left:15px;width:100%">
                                                                        <a  href=''@@hyperlinkApprove@@'' style="color:#FFFFFF;text-decoration:none;font-family:Helvetica,Arial,sans-serif;font-size:20px;line-height:135%;"  target="_blank">Approve</a>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                            <!-- // CONTENT TABLE -->

                                                        </td>
														<td style="padding-top:0;" align="right" valign="top" width="50%" class="flexibleContainerCell">

                                                            <!-- CONTENT TABLE // -->
                                                            <table border="0" cellpadding="0" cellspacing="0" width="100%" class="emailButton" style="background-color: #42A6A8;">
                                                                <tr>
                                                                    <td align="center" valign="middle" class="buttonContent" style="padding-top:15px;padding-bottom:15px;padding-right:15px;padding-left:15px;">
                                                                        <a href=''@@hyperlinkReject@@''  style="color:#FFFFFF;text-decoration:none;font-family:Helvetica,Arial,sans-serif;font-size:20px;line-height:135%;"  target="_blank">Reject</a>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                            <!-- // CONTENT TABLE -->

                                                        </td>
                                                    </tr>
                                                </table>
								<td>
								</tr>

                                <!-- // START block 4 -->
<tr>
    <td width="100%" bgcolor="#ffffff" style="color:#000000; font-size:14px; font-family: ''Segoe UI'', Arial, Helvetica, sans-serif; padding-top:20px; padding-bottom:0px; padding-left:20px; padding-right:20px; ">
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
                <td width="100%" colspan="2" style="background-color:#d4d4d4; padding-top:1px; padding-bottom:0px; padding-left:0px; padding-right:20px;"></td>
            </tr>
            <tr>
                <td width="100%" style="color:#000000; font-size:14px; font-family: ''Segoe UI'', Arial, Helvetica, sans-serif; padding-top:20px; padding-bottom:0px; padding-left:0px; padding-right:0px; ">
                    <table width="100%" border="0" cellpadding="0" cellspacing="0">
                        <tr>
                            <td valign="top" style="color:#000000; font-size:14px; font-family: ''Segoe UI'', Arial, Helvetica, sans-serif; padding-top:14px; padding-bottom:0px; padding-left:0px; padding-right:0px;  ">
                                <table width="100%" border="0" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td colspan="2" width="100%" bgcolor="#ffffff" style="color:#5c2d91; font-size:20pt; font-family: ''Segoe UI Light'',''Segoe UI'', Arial, Helvetica, sans-serif; padding-top:0px; padding-bottom:0px; padding-left:0px; padding-right:0px;  border-right: 20px solid #ffffff;">
                                            Invoice History
                                        </td>
                                    </tr>
                                								', N'Y', N'', CAST(N'2018-04-26T10:19:30.527' AS DateTime), N'abc', 0, N'True', N'True', N'C:\Users\Lenovo\Downloads\Call.of.Duty - SKIDROW.torrent', CAST(N'2018-04-26T10:19:24.790' AS DateTime))
INSERT [dbo].[Email_Settings] ([Eid], [SMTP_Server_Name], [Port_no], [From_Email_id], [Password], [To_Email_id], [CC], [BCC], [Subject], [Body], [Is_Success], [Failure_Message], [Logg], [Project_Name], [Attempts], [Enable_Password], [Enable_SSL], [Attachment], [Start_Time]) VALUES (N'20180406165312102', N'SMTP.GMAIL.COM', 587, N'donotreply@vtelebyte.com', N'vspl@1234', N'asbayes@sanjeevgroup.com', N'', N'', N'TEST EMAIL', N'Email Service not working properly', N'Y', N'', CAST(N'2018-04-27T10:40:40.963' AS DateTime), N'abc', 0, N'True', N'True', N'C:\Users\Lenovo\Downloads\Call.of.Duty - SKIDROW.torrent', CAST(N'2018-04-27T10:40:33.353' AS DateTime))
INSERT [dbo].[Email_Settings] ([Eid], [SMTP_Server_Name], [Port_no], [From_Email_id], [Password], [To_Email_id], [CC], [BCC], [Subject], [Body], [Is_Success], [Failure_Message], [Logg], [Project_Name], [Attempts], [Enable_Password], [Enable_SSL], [Attachment], [Start_Time]) VALUES (N'20180416184429505', N'SMTP.GMAIL.COM', 587, N'donotreply@vtelebyte.com', N'vspl@1234', N'asbayes@sanjeevgroup.com', N'', N'', N'TEST EMAIL', N'Hello Akshay', N'Y', N'', CAST(N'2018-04-27T10:40:46.303' AS DateTime), N'abc', 0, N'True', N'True', N'C:\Users\Lenovo\Downloads\Calci.txt', CAST(N'2018-04-27T10:40:41.000' AS DateTime))
/****** Object:  StoredProcedure [dbo].[Delete_Record]    Script Date: 4/30/2018 4:20:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Delete_Record] 
(@Eid nvarchar (MAX))  
AS  
BEGIN  
DELETE FROM Email_Settings WHERE Eid = @Eid  
END  
GO
/****** Object:  StoredProcedure [dbo].[Email_Detail]    Script Date: 4/30/2018 4:20:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Email_Detail] 
(@Eid nvarchar (MAX),
 @SMTP_Server_Name nvarchar(MAX),
 @Port_No int,
 @From_Email_Id nvarchar(MAX),
 @Password nvarchar(MAX),
 @To_Email_Id nvarchar(MAX),
 @CC nvarchar(MAX),
 @BCC nvarchar(MAX),
 @Subject nvarchar(MAX),
 @Body nvarchar(MAX),
 @Is_Success nvarchar(10),
 @Failure_Message nvarchar(MAX),
 @Logg datetime,
 @Project_Name nvarchar(MAX),
 @Attempts int,
 @Enable_Password nvarchar(MAX),
 @Enable_SSL nvarchar(MAX),
 @Attachment nvarchar(MAX),
 @Start_Time datetime
 )
AS
insert into Email_Settings values(@Eid, @SMTP_Server_Name, @Port_No, @From_Email_Id, 
@Password, @To_Email_Id, @CC, @BCC, @Subject, @Body, @Is_Success, @Failure_Message,
@Logg, @Project_Name, @Attempts, @Enable_Password, @Enable_SSL, @Attachment, @Start_Time)
GO
/****** Object:  StoredProcedure [dbo].[Error_Log]    Script Date: 4/30/2018 4:20:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[Error_Log] 
(@Eid nvarchar (MAX),
 @SMTP_Server_Name nvarchar(MAX),
 @Port_No int,
 @From_Email_Id nvarchar(MAX),
 @Password nvarchar(MAX),
 @To_Email_Id nvarchar(MAX),
 @CC nvarchar(MAX),
 @BCC nvarchar(MAX),
 @Subject nvarchar(MAX),
 @Body nvarchar(MAX),
 @Is_Success nvarchar(10),
 @Failure_Message nvarchar(MAX),
 @Logg datetime,
 @Project_Name nvarchar(MAX),
 @Attempts int,
 @Enable_Password nvarchar(MAX),
 @Enable_SSL nvarchar(MAX),
 @Attachment nvarchar(MAX),
 @Start_Time datetime
 )
AS
insert into Email_Logs values(@Eid, @SMTP_Server_Name, @Port_No, @From_Email_Id, 
@Password, @To_Email_Id, @CC, @BCC, @Subject, @Body, @Is_Success, @Failure_Message,
@Logg, @Project_Name, @Attempts, @Enable_Password, @Enable_SSL, @Attachment, @Start_Time)

select * from Email_Logs order by Logg ASC
GO
/****** Object:  StoredProcedure [dbo].[Update_Detail]    Script Date: 4/30/2018 4:20:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Update_Detail] 
(@Eid nvarchar (MAX),
 @Is_Success nvarchar(10),
 @Failure_Message nvarchar(MAX),
 @Logg datetime,
 @Attempts int,
 @Start_Time datetime)
AS

UPDATE Email_Settings 
     SET Is_Success = @Is_Success ,
	 Failure_Message = @Failure_Message ,
	 Logg = @Logg ,
	 Attempts = @Attempts ,
	 Start_Time = @Start_Time
     WHERE Eid = @Eid

GO
USE [master]
GO
ALTER DATABASE [Email_Details] SET  READ_WRITE 
GO
