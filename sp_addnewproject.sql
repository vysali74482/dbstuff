USE [PROJECT]
GO
/****** Object:  StoredProcedure [dbo].[AddNewProject]    Script Date: 10/18/2015 10:58:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		Anjani
-- Create date: 14-10-2015
-- Description:	Add New Project
-- =============================================


ALTER PROCEDURE [dbo].[AddNewProject]
	-- Add the parameters for the stored procedure here
	 @project_name nvarchar(100),
	 @project_code nvarchar(100),
	 @project_lead_id nvarchar(100),
	 @changed_by nvarchar(100)
	 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	declare @default_created_date datetime = GETDATE(),@default_changed_date datetime = GETDATE(),@return int

	IF NOT EXISTS (Select * from Project where project_code = @project_code)
	INSERT INTO [dbo].Project
           (project_name
           ,project_code
           ,[project_lead_id]
           ,[is_active],
           [created_date]
		   ,[changed_date]
           ,[changed_by]
           )
          
     VALUES
           (
		     @project_name,
		     @project_code,
			 @project_lead_id ,
			 1,
			 @default_created_date,
			 @default_changed_date,
			 @changed_by
		   )
	set @return = 0
END
Return @return







