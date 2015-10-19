USE [PMA_TEST]
GO
/****** Object:  StoredProcedure [dbo].[GetLocationById]    Script Date: 10/20/2015 1:18:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[GetLocationById] 
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

    -- Insert statements for procedure here
	--SELECT @location_name=L.location_name,@created_date=L.created_date,@changed_date=L.changed_date,@changed_by=U.user_name,@is_active=L.is_active 
	--FROM Locations L  INNER JOIN Users U ON L.changed_by = U.user_id where L.location_id = @location_id
	
	SELECT L.location_id,L.location_name,L.created_date,L.changed_date,U.user_name as changed_by,L.is_active 
	FROM Locations L  INNER JOIN Users U ON L.changed_by = U.user_id where L.location_id = @location_id

END
