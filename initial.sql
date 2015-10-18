/****** Object:  Table [dbo].[Project]    Script Date: 10/13/2015 3:06:44 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Create Roles table ******/
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

/****** Create [dbo].[Users] ******/
CREATE TABLE [dbo].[Users](
	[user_id] [int] IDENTITY(1,1) NOT NULL,
	[user_name] [nvarchar](50) NULL,
	[user_email] [nvarchar] (100) NULL,
	[role_id] [int] NULL,
	[password] [char] (128),
	[created_date] [datetime] NULL,
    [is_active] [bit] NULL,
UNIQUE NONCLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[Users]  WITH CHECK ADD CONSTRAINT [Fk_role_id] FOREIGN KEY([role_id])
REFERENCES [dbo].[Roles] ([role_id])
GO 

/****** Create [dbo].[Locations] ******/
CREATE TABLE [dbo].[Locations](
	[location_id] [int] IDENTITY(1,1) NOT NULL,
	[location_name] [nvarchar](50) NOT NULL,
	[created_date] [datetime] NULL,
	[changed_date] [datetime] NULL,
	[changed_by] [int] NULL,
	[is_active] [bit] NULL,
UNIQUE NONCLUSTERED 
(
	[location_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Create [dbo].[Project] ******/
CREATE TABLE [dbo].[Project](
	[project_id] [int] IDENTITY(1,1) NOT NULL,
	[project_name] [nvarchar](50) NULL,
	[project_code] [nvarchar](50) NULL,
	[is_active] [bit] NULL,
	[project_lead_id] [int] NULL,
	[created_date] [datetime] NULL,
	[changed_date] [datetime] NULL,
	[changed_by] [int] NULL,
UNIQUE NONCLUSTERED 
(
	[project_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[Project]  WITH CHECK ADD CONSTRAINT [Fk_lead_id1]  FOREIGN KEY([project_lead_id])
REFERENCES [dbo].[Users] ([user_id])
GO

ALTER TABLE [dbo].[Project]  WITH CHECK ADD CONSTRAINT [Fk_changed_by1]  FOREIGN KEY([changed_by])
REFERENCES [dbo].[Users] ([user_id])
GO
/****** Create [dbo].[ProjectLocation] ******/
CREATE TABLE [dbo].[ProjectLocation](
	[project_location_id] [int] IDENTITY(1,1) NOT NULL,
	[project_id] [int] NULL,
	[location_id] [int] NULL,
	[is_active] [bit] NULL,
	[created_date] [datetime] NULL,
	[changed_date] [datetime] NULL,
	[changed_by] [int] NULL,
UNIQUE NONCLUSTERED 
(
	[project_location_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[ProjectLocation]  WITH CHECK ADD CONSTRAINT [Fk_project_id2]  FOREIGN KEY([project_id])
REFERENCES [dbo].[Project] ([project_id])
GO

ALTER TABLE [dbo].[ProjectLocation]  WITH CHECK ADD CONSTRAINT [Fk_location_id2]  FOREIGN KEY([location_id])
REFERENCES [dbo].[Locations] ([location_id])
GO

/****** Create [dbo].[Beneficiary] ******/
CREATE TABLE [dbo].[Beneficiary](
	[beneficiary_id] [int] IDENTITY(1,1) NOT NULL,
	[beneficiary_name] [nvarchar](50) NULL,
	[beneficiary_address] [nvarchar](100) NULL,
	[project_location_id] [int] NOT NULL,
	[contact_id] [int] NULL,
	[created_date] [datetime] NULL,
	[changed_date] [datetime] NULL,
	[changed_by] [int] NULL,
	[is_active] [bit] NULL,
UNIQUE NONCLUSTERED 
(
	[beneficiary_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[Beneficiary]  WITH CHECK ADD CONSTRAINT [Fk_project_location_id3]  FOREIGN KEY([project_location_id])
REFERENCES [dbo].[ProjectLocation] ([project_location_id])
GO

ALTER TABLE [dbo].[Beneficiary]  WITH CHECK ADD CONSTRAINT [Fk_contact_id3]  FOREIGN KEY([contact_id])
REFERENCES [dbo].[Users] ([user_id])
GO

ALTER TABLE [dbo].[Beneficiary]  WITH CHECK ADD CONSTRAINT [Fk_changed_id3]  FOREIGN KEY([changed_by])
REFERENCES [dbo].[Users] ([user_id])
GO

/****** Create [dbo].[Funds] ******/
CREATE TABLE [dbo].[Funds](
	[fund_id] [int] IDENTITY(1,1) NOT NULL,
	[fund_desc] [nvarchar](50) NULL,
	[fund_amount] [float] NOT NULL,
	[received_date] [datetime] NULL,
	[changed_date] [datetime] NULL,
	[changed_by] [int] NULL,	
UNIQUE NONCLUSTERED 
(
	[fund_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[Funds]  WITH CHECK ADD CONSTRAINT [Fk_changed_by4]  FOREIGN KEY([changed_by])
REFERENCES [dbo].[Users] ([user_id])
GO

/****** Create [dbo].[FundAllocation] ******/
CREATE TABLE [dbo].[FundAllocation](
	[allocation_id] [int] IDENTITY(1,1) NOT NULL,
	[fund_id] [int] NOT NULL,
	[beneficiary_id] [int] NOT NULL,
	[allocated_date] [datetime] NULL,
	[allocated_amount] [float] NOT NULL,
	[allocated_by] [int] NOT NULL,
	[changed_date] [datetime] NULL,
	[changed_by] [int] NULL,
UNIQUE NONCLUSTERED 
(
	[allocation_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[FundAllocation]  WITH CHECK ADD CONSTRAINT [Fk_changed_by5]  FOREIGN KEY([changed_by])
REFERENCES [dbo].[Users] ([user_id])
GO

ALTER TABLE [dbo].[FundAllocation]  WITH CHECK ADD CONSTRAINT [Fk_allocated_by5]  FOREIGN KEY([allocated_by])
REFERENCES [dbo].[Users] ([user_id])
GO

ALTER TABLE [dbo].[FundAllocation]  WITH CHECK ADD CONSTRAINT [Fk_fund_id5]  FOREIGN KEY([fund_id])
REFERENCES [dbo].[Funds] ([fund_id])
GO

ALTER TABLE [dbo].[FundAllocation]  WITH CHECK ADD CONSTRAINT [Fk_beneficiary_id5]  FOREIGN KEY([beneficiary_id])
REFERENCES [dbo].[Beneficiary] ([beneficiary_id])
GO

/****** Create [dbo].[VolunteerTracking] ******/
CREATE TABLE [dbo].[VolunteerTracking](
	[tracking_id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NOT NULL,
	[beneficiary_id] [int] NOT NULL,
	[start_date] [datetime] NULL,
	[end_date] [datetime] NULL,
	[is_active] [bit] NULL,
UNIQUE NONCLUSTERED 
(
	[tracking_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[VolunteerTracking]  WITH CHECK ADD CONSTRAINT [Fk_user_id6]  FOREIGN KEY([user_id])
REFERENCES [dbo].[Users] ([user_id])
GO

ALTER TABLE [dbo].[VolunteerTracking]  WITH CHECK ADD CONSTRAINT [Fk_beneficiary_id6]  FOREIGN KEY([beneficiary_id])
REFERENCES [dbo].[Beneficiary] ([beneficiary_id])
GO
