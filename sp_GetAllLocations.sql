USE [PMA_TEST]
GO
/****** Object:  StoredProcedure [dbo].[GetAllLocations]    Script Date: 10/21/2015 11:17:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[GetAllLocations] AS

SELECT L.location_id,L.location_name,L.created_date,L.changed_date,L.changed_by,U.user_name as changed_by_name,L.is_active 
FROM Locations L  INNER JOIN Users U ON L.changed_by = U.user_id