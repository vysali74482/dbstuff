USE [PMA_TEST]
GO
/****** Object:  StoredProcedure [dbo].[GetLocationById]    Script Date: 10/21/2015 9:37:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[GetLocationById] 
	-- Add the parameters for the stored procedure here
	@location_id int
	AS

BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT L.location_id,L.location_name,L.created_date,L.changed_date,L.changed_by,U.user_name as changed_by_name,L.is_active 
	FROM Locations L  INNER JOIN Users U ON L.changed_by = U.user_id where L.location_id = @location_id

END
