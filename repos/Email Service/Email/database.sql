USE [Email_Details]
GO
/****** Object:  User [NT AUTHORITY\SYSTEM]    Script Date: 4/12/2018 1:11:29 PM ******/
CREATE USER [NT AUTHORITY\SYSTEM] FOR LOGIN [NT AUTHORITY\SYSTEM] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Email_Settings]    Script Date: 4/12/2018 1:11:29 PM ******/
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
	[Attachment] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[Delete_Record]    Script Date: 4/12/2018 1:11:30 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Email_Detail]    Script Date: 4/12/2018 1:11:30 PM ******/
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
 @Attachment nvarchar(MAX)
 )
AS
insert into Email_Settings values(@Eid, @SMTP_Server_Name, @Port_No, @From_Email_Id, 
@Password, @To_Email_Id, @CC, @BCC, @Subject, @Body, @Is_Success, @Failure_Message,
@Logg, @Project_Name, @Attempts, @Enable_Password, @Enable_SSL, @Attachment)
GO
/****** Object:  StoredProcedure [dbo].[Update_Detail]    Script Date: 4/12/2018 1:11:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Update_Detail] 
(@Eid nvarchar (MAX),
 @Is_Success nvarchar(10),
 @Failure_Message nvarchar(MAX),
 @Logg datetime,
 @Attempts int)
AS

UPDATE Email_Settings 
     SET Is_Success = @Is_Success ,
	 Failure_Message = @Failure_Message ,
	 Logg = @Logg ,
	 Attempts = @Attempts
     WHERE Eid = @Eid

GO
