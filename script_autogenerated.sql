USE [master]
GO
/****** Object:  Database [PROJECT]    Script Date: 10/29/2015 8:44:11 PM ******/
CREATE DATABASE [PROJECT]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PROJECT', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\PROJECT.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'PROJECT_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\PROJECT_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [PROJECT] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PROJECT].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PROJECT] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PROJECT] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PROJECT] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PROJECT] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PROJECT] SET ARITHABORT OFF 
GO
ALTER DATABASE [PROJECT] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [PROJECT] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PROJECT] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PROJECT] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PROJECT] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PROJECT] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PROJECT] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PROJECT] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PROJECT] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PROJECT] SET  DISABLE_BROKER 
GO
ALTER DATABASE [PROJECT] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PROJECT] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PROJECT] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PROJECT] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PROJECT] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PROJECT] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PROJECT] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PROJECT] SET RECOVERY FULL 
GO
ALTER DATABASE [PROJECT] SET  MULTI_USER 
GO
ALTER DATABASE [PROJECT] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PROJECT] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PROJECT] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PROJECT] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [PROJECT] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'PROJECT', N'ON'
GO
USE [PROJECT]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 10/29/2015 8:44:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[account_id] [int] IDENTITY(1,1) NOT NULL,
	[user_name] [nvarchar](50) NOT NULL,
	[password] [nvarchar](8) NOT NULL,
	[first_name] [nvarchar](max) NOT NULL,
	[last_name] [nvarchar](max) NOT NULL,
	[created_date] [datetime] NULL,
	[is_active] [bit] NULL,
UNIQUE NONCLUSTERED 
(
	[account_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Beneficiary]    Script Date: 10/29/2015 8:44:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Beneficiary](
	[beneficiary_id] [int] IDENTITY(1,1) NOT NULL,
	[beneficiary_name] [nvarchar](50) NULL,
	[beneficiary_address] [nvarchar](100) NULL,
	[project_location_id] [int] NOT NULL,
	[created_date] [datetime] NULL,
	[changed_date] [datetime] NULL,
	[changed_by] [nvarchar](50) NULL,
	[is_active] [bit] NULL,
UNIQUE NONCLUSTERED 
(
	[beneficiary_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[FundAllocation]    Script Date: 10/29/2015 8:44:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FundAllocation](
	[allocation_id] [int] IDENTITY(1,1) NOT NULL,
	[fund_id] [int] NOT NULL,
	[beneficiary_id] [int] NOT NULL,
	[allocated_date] [datetime] NULL,
	[allocated_amount] [float] NOT NULL,
	[allocated_by] [nvarchar](50) NOT NULL,
	[changed_date] [datetime] NULL,
	[changed_by] [nvarchar](50) NULL,
UNIQUE NONCLUSTERED 
(
	[allocation_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Funds]    Script Date: 10/29/2015 8:44:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Funds](
	[fund_id] [int] IDENTITY(1,1) NOT NULL,
	[fund_desc] [nvarchar](50) NULL,
	[fund_amount] [float] NOT NULL,
	[received_date] [datetime] NULL,
	[changed_date] [datetime] NULL,
	[changed_by] [nvarchar](50) NULL,
UNIQUE NONCLUSTERED 
(
	[fund_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Locations]    Script Date: 10/29/2015 8:44:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Locations](
	[location_id] [int] IDENTITY(1,1) NOT NULL,
	[location_name] [nvarchar](50) NOT NULL,
	[created_date] [datetime] NULL,
	[changed_date] [datetime] NULL,
	[changed_by] [nvarchar](50) NULL,
	[is_active] [bit] NULL,
UNIQUE NONCLUSTERED 
(
	[location_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Project]    Script Date: 10/29/2015 8:44:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Project](
	[project_id] [int] IDENTITY(1,1) NOT NULL,
	[project_name] [nvarchar](50) NULL,
	[project_code] [nvarchar](50) NULL,
	[is_active] [bit] NULL,
	[project_lead_id] [int] NULL,
	[created_date] [datetime] NULL,
	[changed_date] [datetime] NULL,
	[changed_by] [nvarchar](50) NULL,
UNIQUE NONCLUSTERED 
(
	[project_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ProjectLocation]    Script Date: 10/29/2015 8:44:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProjectLocation](
	[project_location_id] [int] IDENTITY(1,1) NOT NULL,
	[project_id] [int] NULL,
	[location_id] [int] NULL,
	[is_active] [bit] NULL,
	[created_date] [datetime] NULL,
	[changed_date] [datetime] NULL,
	[changed_by] [nvarchar](50) NULL,
UNIQUE NONCLUSTERED 
(
	[project_location_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Roles]    Script Date: 10/29/2015 8:44:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[role_id] [int] IDENTITY(1,1) NOT NULL,
	[role_name] [nvarchar](50) NOT NULL,
	[is_active] [bit] NULL,
	[created_date] [datetime] NULL,
UNIQUE NONCLUSTERED 
(
	[role_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Users]    Script Date: 10/29/2015 8:44:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[user_id] [int] IDENTITY(1,1) NOT NULL,
	[user_name] [nvarchar](50) NULL,
	[user_email] [nvarchar](100) NULL,
	[role_id] [int] NULL,
	[created_date] [datetime] NULL,
	[changed_date] [datetime] NULL,
	[changed_by] [nvarchar](50) NULL,
	[is_active] [bit] NULL,
UNIQUE NONCLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[VolunteerTracking]    Script Date: 10/29/2015 8:44:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VolunteerTracking](
	[tracking_id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NOT NULL,
	[beneficiary_id] [int] NOT NULL,
	[start_date] [datetime] NULL,
	[end_date] [datetime] NULL,
	[is_active] [bit] NULL,
	[changed_by] [nvarchar](50) NULL,
UNIQUE NONCLUSTERED 
(
	[tracking_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[Beneficiary]  WITH CHECK ADD  CONSTRAINT [Fk_project_location_id3] FOREIGN KEY([project_location_id])
REFERENCES [dbo].[ProjectLocation] ([project_location_id])
GO
ALTER TABLE [dbo].[Beneficiary] CHECK CONSTRAINT [Fk_project_location_id3]
GO
ALTER TABLE [dbo].[FundAllocation]  WITH CHECK ADD  CONSTRAINT [Fk_beneficiary_id5] FOREIGN KEY([beneficiary_id])
REFERENCES [dbo].[Beneficiary] ([beneficiary_id])
GO
ALTER TABLE [dbo].[FundAllocation] CHECK CONSTRAINT [Fk_beneficiary_id5]
GO
ALTER TABLE [dbo].[FundAllocation]  WITH CHECK ADD  CONSTRAINT [Fk_fund_id5] FOREIGN KEY([fund_id])
REFERENCES [dbo].[Funds] ([fund_id])
GO
ALTER TABLE [dbo].[FundAllocation] CHECK CONSTRAINT [Fk_fund_id5]
GO
ALTER TABLE [dbo].[Project]  WITH CHECK ADD  CONSTRAINT [Fk_lead_id1] FOREIGN KEY([project_lead_id])
REFERENCES [dbo].[Users] ([user_id])
GO
ALTER TABLE [dbo].[Project] CHECK CONSTRAINT [Fk_lead_id1]
GO
ALTER TABLE [dbo].[ProjectLocation]  WITH CHECK ADD  CONSTRAINT [Fk_location_id2] FOREIGN KEY([location_id])
REFERENCES [dbo].[Locations] ([location_id])
GO
ALTER TABLE [dbo].[ProjectLocation] CHECK CONSTRAINT [Fk_location_id2]
GO
ALTER TABLE [dbo].[ProjectLocation]  WITH CHECK ADD  CONSTRAINT [Fk_project_id2] FOREIGN KEY([project_id])
REFERENCES [dbo].[Project] ([project_id])
GO
ALTER TABLE [dbo].[ProjectLocation] CHECK CONSTRAINT [Fk_project_id2]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [Fk_role_id] FOREIGN KEY([role_id])
REFERENCES [dbo].[Roles] ([role_id])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [Fk_role_id]
GO
ALTER TABLE [dbo].[VolunteerTracking]  WITH CHECK ADD  CONSTRAINT [Fk_beneficiary_id6] FOREIGN KEY([beneficiary_id])
REFERENCES [dbo].[Beneficiary] ([beneficiary_id])
GO
ALTER TABLE [dbo].[VolunteerTracking] CHECK CONSTRAINT [Fk_beneficiary_id6]
GO
ALTER TABLE [dbo].[VolunteerTracking]  WITH CHECK ADD  CONSTRAINT [Fk_user_id6] FOREIGN KEY([user_id])
REFERENCES [dbo].[Users] ([user_id])
GO
ALTER TABLE [dbo].[VolunteerTracking] CHECK CONSTRAINT [Fk_user_id6]
GO
/****** Object:  StoredProcedure [dbo].[AddNewLocation]    Script Date: 10/29/2015 8:44:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[AddNewLocation]
	-- Add the parameters for the stored procedure here
	 @location_name nvarchar(100),
	 @changed_by nvarchar(50)
	 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	declare @default_created_date datetime = GETDATE(),@default_changed_date datetime = GETDATE(),@return int

	IF NOT EXISTS (Select * from Locations where LOWER(location_name) = LOWER(@location_name))
		BEGIN
			INSERT INTO [dbo].Locations
			([location_name],[is_active],[created_date],[changed_date],[changed_by])VALUES
			(@location_name,1,@default_created_date,@default_changed_date,@changed_by)
			set @return = 0
		END
	ELSE
		BEGIN
			set @return = 1
		END
END
Return @return








GO
/****** Object:  StoredProcedure [dbo].[AddNewProject]    Script Date: 10/29/2015 8:44:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[AddNewProject]
	-- Add the parameters for the stored procedure here
	 @project_name nvarchar(100),
	 @project_code nvarchar(50),
	 @project_lead_id int,
	 @changed_by nvarchar(50)
	 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	declare @default_created_date datetime = GETDATE(),@default_changed_date datetime = GETDATE(),@return int

	IF NOT EXISTS (Select * from Project where LOWER(project_name) = LOWER(@project_name))
		BEGIN
			INSERT INTO [dbo].[Project]
			([project_name],[project_code],[project_lead_id],[is_active],[created_date],[changed_date],[changed_by])VALUES
			(@project_name,@project_code,@project_lead_id,1,@default_created_date,@default_changed_date,@changed_by)
			set @return = 0
		END
	ELSE
		BEGIN
			set @return = 1
		END
END
Return @return








GO
/****** Object:  StoredProcedure [dbo].[AddNewUser]    Script Date: 10/29/2015 8:44:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[AddNewUser](
	-- Add the parameters for the stored procedure here
	@user_name nvarchar(100), 
	@user_email nvarchar(100),
	@changed_by nvarchar(100)
	 
	)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	declare @default_created_date datetime = GETDATE(),@default_changed_date datetime = GETDATE(),@return int
    -- Insert statements for procedure here
	IF (NOT EXISTS(SELECT user_email FROM dbo.Users WHERE user_email = @user_email) )
	Insert into dbo.Users (user_name, user_email,[is_active],
           [created_date]
		   ,[changed_date]
           ,[changed_by])
   Values(@user_name, @user_email, 1,
			 @default_created_date,
			 @default_changed_date,
			 @changed_by)
set @return = 0
END
Return @return

GO
/****** Object:  StoredProcedure [dbo].[AddProjectAtLocation]    Script Date: 10/29/2015 8:44:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[AddProjectAtLocation] 
	-- Add the parameters for the stored procedure here
	@project_id int,
	@location_id int,
	@changed_by nvarchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	declare @default_date datetime = GETDATE(),@return int

    -- Insert statements for procedure here
	IF NOT EXISTS ( SELECT PL.project_location_id FROM ProjectLocation PL where project_id=@project_id and location_id=@location_id )
	BEGIN
		INSERT INTO ProjectLocation (project_id,location_id,is_active,created_date,changed_date,changed_by) values (@project_id,@location_id,1,@default_date,@default_date,@changed_by);
	END
	ELSE 
	BEGIN
		Update ProjectLocation set is_active = 1, changed_date = @default_date ,changed_by = @changed_by where project_id =@project_id and location_id=@location_id
	END
END

GO
/****** Object:  StoredProcedure [dbo].[AuthenticateUser]    Script Date: 10/29/2015 8:44:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:           Neha
-- Create date:20 October
-- Description:      To authenticate user
-- =============================================
CREATE PROCEDURE [dbo].[AuthenticateUser]
       @user_name nvarchar(50),
       @password nvarchar(8)
AS
BEGIN
       -- SET NOCOUNT ON added to prevent extra result sets from
       -- interfering with SELECT statements.
       SET NOCOUNT ON;

       Select * from [dbo].[Account] as acc where acc.[user_name]=@user_name and acc.[password]=@password
END

GO
/****** Object:  StoredProcedure [dbo].[DeleteProjectLocation]    Script Date: 10/29/2015 8:44:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[DeleteProjectLocation]
	-- Add the parameters for the stored procedure here
	@project_location_id int,
	@is_active bit
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	update dbo.ProjectLocation set is_active=@is_active where project_location_id= @project_location_id;
	update dbo.Beneficiary set is_active=@is_active where project_location_id= @project_location_id;
END


GO
/****** Object:  StoredProcedure [dbo].[GetAllLocations]    Script Date: 10/29/2015 8:44:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAllLocations] AS

SELECT L.location_id,L.location_name,L.created_date,L.changed_date,L.changed_by,L.is_active 
FROM Locations L
GO
/****** Object:  StoredProcedure [dbo].[GetAllProjectLeads]    Script Date: 10/29/2015 8:44:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetAllProjectLeads]
	-- Add the parameters for the stored procedure here
AS	
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	BEGIN TRY
    -- Insert statements for procedure here
	SELECT U.user_id,U.user_name,U.user_email,U.changed_by 
	from Users U where U.role_id <> '3'
	END TRY
	BEGIN CATCH
	RETURN @@ERROR
	END CATCH
	RETURN @@ERROR
END


GO
/****** Object:  StoredProcedure [dbo].[GetAllProjects]    Script Date: 10/29/2015 8:44:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAllProjects] AS

SELECT P.project_id,P.project_name,P.project_code,P.is_active,P.project_lead_id,
P.created_date,P.changed_date,P.changed_by,U1.user_name as project_lead_name,P.changed_by 
FROM Project P 
INNER JOIN Users U1 ON P.project_lead_id=U1.user_id

GO
/****** Object:  StoredProcedure [dbo].[GetAllUsers]    Script Date: 10/29/2015 8:44:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetAllUsers]
	-- Add the parameters for the stored procedure here
AS	
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	BEGIN TRY
    -- Insert statements for procedure here
	SELECT U.user_id,U.user_name,U.user_email,U.changed_by from Users U
	END TRY
	BEGIN CATCH
	RETURN @@ERROR
	END CATCH
	RETURN @@ERROR
END


GO
/****** Object:  StoredProcedure [dbo].[GetInactiveProjectsAtLocation]    Script Date: 10/29/2015 8:44:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetInactiveProjectsAtLocation] 
	-- Add the parameters for the stored procedure here
	@location_id int	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT P.project_id,P.project_name,P.project_code,U1.user_name as project_lead_name,P.project_lead_id,P.is_active,P.created_date,P.changed_by FROM Project P 
	INNER JOIN Users U1 On P.project_lead_id = U1.user_id
	WHERE P.project_id NOT IN
    (SELECT  PL.project_id FROM ProjectLocation PL WHERE PL.location_id = @location_id and PL.is_active = 'True') and P.is_active = 'True'
END

GO
/****** Object:  StoredProcedure [dbo].[GetLocationById]    Script Date: 10/29/2015 8:44:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetLocationById] 
	-- Add the parameters for the stored procedure here
	@location_id int
	AS

BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT L.location_id,L.location_name,L.created_date,L.changed_date,L.changed_by,L.is_active 
	FROM Locations L where L.location_id = @location_id

END

GO
/****** Object:  StoredProcedure [dbo].[GetProjectById]    Script Date: 10/29/2015 8:44:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetProjectById] 
	-- Add the parameters for the stored procedure here
	@project_id int
	AS

BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT P.project_id,P.project_name,P.created_date,P.changed_date,P.project_code,P.is_active,
	P.project_lead_id,U1.user_name as project_lead_name,P.changed_by
	FROM Project P  
	INNER JOIN Users U1 ON P.project_lead_id = U1.user_id
	WHERE P.project_id = @project_id

END

GO
/****** Object:  StoredProcedure [dbo].[GetProjectsAtLocation]    Script Date: 10/29/2015 8:44:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetProjectsAtLocation] 
	-- Add the parameters for the stored procedure here
	@location_id int
	--@location_name nvarchar(50) OUT,
	--@created_date datetime OUT,
	--@changed_date datetime OUT,
	--@changed_by nvarchar(50) OUT,	
	--@is_active bit OUT
AS

BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT PL.project_location_id,PL.project_id,PL.changed_by,P.project_name,P.project_lead_id,P.project_code,PL.location_id,L.location_name,PL.is_active,PL.created_date,PL.changed_date,PL.changed_by,U1.user_name as project_lead_name 
	FROM ProjectLocation PL 
	INNER JOIN Project P ON PL.project_id = P.project_id 
	INNER JOIN Locations L ON PL.location_id = L.location_id 
	INNER JOIN Users U1 ON P.project_lead_id = U1.user_id
	WHERE PL.location_id = @location_id

END

GO
/****** Object:  StoredProcedure [dbo].[GetUserbyId]    Script Date: 10/29/2015 8:44:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetUserbyId](
	-- Add the parameters for the stored procedure here
	@user_id int
	)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from dbo.Users where user_id = @user_id
END

GO
/****** Object:  StoredProcedure [dbo].[RegisterUser]    Script Date: 10/29/2015 8:44:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:           Neha
-- Create date:20 October
-- Description:      To authenticate user
-- =============================================
CREATE PROCEDURE [dbo].[RegisterUser]
       @user_name nvarchar(50),
       @password nvarchar(8),
       @first_name nvarchar(max),
       @last_name nvarchar(max)
       

AS
BEGIN
       -- SET NOCOUNT ON added to prevent extra result sets from
       -- interfering with SELECT statements.
       SET NOCOUNT ON;
       DECLARE @return int
       IF NOT EXISTS (Select * from [dbo].[Account] where [user_name] = @user_name and [password]=@password)
       BEGIN
       INSERT INTO [dbo].[Account]([user_name],[password],[first_name],[last_name],[created_date],[is_active])
       values(@user_name,@password,@first_name,@last_name,GETDATE(),1)

       set @return = 0
       END
              ELSE
                     set @return = 1
       END


Return @return

GO
/****** Object:  StoredProcedure [dbo].[SoftDeleteProject]    Script Date: 10/29/2015 8:44:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SoftDeleteProject]
	-- Add the parameters for the stored procedure here
	@project_id int,
	@is_active bit
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	update dbo.Project set is_active=@is_active where project_id= @project_id;
END
GO
/****** Object:  StoredProcedure [dbo].[SoftDeleteUser]    Script Date: 10/29/2015 8:44:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SoftDeleteUser]
	-- Add the parameters for the stored procedure here
	@user_id int,
	@is_active bit
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	update dbo.Users set is_active=0 where user_id= @user_id;
END


GO
/****** Object:  StoredProcedure [dbo].[UpdateProject]    Script Date: 10/29/2015 8:44:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[UpdateProject](
	-- Add the parameters for the stored procedure here
	@project_id int,
	@project_name nvarchar(50),
	@project_code nvarchar(50),
	@project_lead_id int,
	@changed_by nvarchar(50)
	)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	declare @default_changed_date datetime = GETDATE(),@return int
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	update dbo.Project set project_name = @project_name, project_code = @project_code, project_lead_id = @project_lead_id ,changed_date =@default_changed_date , changed_by=@changed_by 
	where project_id= @project_id;
	

END

GO
/****** Object:  StoredProcedure [dbo].[UpdateUser]    Script Date: 10/29/2015 8:44:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[UpdateUser](
	-- Add the parameters for the stored procedure here
	@user_id int,
	@user_name nvarchar(50) null,
	@user_email nvarchar(50) null
	)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	update dbo.Users set user_name= @user_name, user_email= @user_email where user_id= @user_id;
	

END

GO
USE [master]
GO
ALTER DATABASE [PROJECT] SET  READ_WRITE 
GO
