USE [PMA_TEST]
GO
/****** Object:  StoredProcedure [dbo].[GetProjectsAtLocation]    Script Date: 10/20/2015 3:40:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[GetProjectsAtLocation] 
	-- Add the parameters for the stored procedure here
	@location_id int

AS

BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
		
	SELECT PL.project_location_id,PL.project_id,P.project_name,P.project_lead_id,P.project_code,PL.location_id,L.location_name,PL.is_active,PL.created_date,PL.changed_date,PL.changed_by,U.user_name as changed_by_name,U1.user_name as project_lead_name 
	FROM ProjectLocation PL 
	INNER JOIN Project P ON PL.project_id = P.project_id 
	INNER JOIN Locations L ON PL.location_id = L.location_id 
	INNER JOIN Users U on PL.changed_by = U.user_id INNER JOIN Users U1 ON P.project_lead_id = U1.user_id
	WHERE PL.location_id = @location_id

END
