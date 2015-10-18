CREATE PROCEDURE GetAllProjects AS
SELECT project_id,project_name,project_code,created_date,changed_date,changed_by from Project ;
GO

CREATE PROCEDURE GetAllLocations AS
SELECT location_id,location_name,created_date,changed_date,changed_by,is_active from Locations ;
GO