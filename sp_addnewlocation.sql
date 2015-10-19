USE [PMA_TEST]
GO
/****** Object:  StoredProcedure [dbo].[AddNewLocation]    Script Date: 10/18/2015 10:58:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[AddNewLocation]
	-- Add the parameters for the stored procedure here
	 @location_name nvarchar(100),
	 @changed_by nvarchar(100)
	 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	declare @default_created_date datetime = GETDATE(),@default_changed_date datetime = GETDATE(),@return int

	IF NOT EXISTS (Select * from Locations where LOWER(location_name) = LOWER(@location_name))
	INSERT INTO [dbo].Locations
           (location_name
           ,[is_active],
           [created_date]
		   ,[changed_date]
           ,[changed_by]
           )
          
     VALUES
           (
		     @location_name,
			 1,
			 @default_created_date,
			 @default_changed_date,
			 @changed_by
		   )
	set @return = 0
END
Return @return







