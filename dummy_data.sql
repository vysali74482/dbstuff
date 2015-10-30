USE [PROJECT]
GO

INSERT INTO [dbo].[Roles] (role_name,is_active) values ('Admin','1'),('Lead','1'),('Volunteer','1');
GO


INSERT INTO [dbo].[Users] (user_name,user_email,role_id,is_active) values ('vysali','123eve123@mailinator.com','1','1'),
('anjani','123eve123@mailinator.com','2','1'),('sanyam','123eve123@mailinator.com','3','1'),('andy','123eve123@mailinator.com','3','1');
GO

INSERT INTO [dbo].[Locations] (location_name,is_active) values ('Bangalore','1'),
('Chennai','1'),('Delhi','1'),('Kolkata','1'),('Mumbai','0');
GO

INSERT INTO [dbo].[Project] (project_name,project_code,is_active,project_lead_id) values ('Educate Girl Child','EGC',1,1),
('Better Health','BH',1,2),('Green City','GC',1,2),('Clean City','CC',1,4);
GO

INSERT INTO [dbo].[ProjectLocation] (project_id,location_id,is_active) values (1,1,1),(1,2,1),(2,2,1),(2,3,1),(3,4,1),(3,4,1),(4,5,1);
GO

INSERT INTO [dbo].[Beneficiary] (beneficiary_name,beneficiary_address,project_location_id,is_active) values ('BF1','ADDR LINE1',1,1),('BF2','ADDR LINE2',2,1),('BF3','ADDR LINE3',3,1),('BF4','ADDR LINE4',4,1),('BF5','ADDR LINE5',5,1),('BF6','ADDR LINE6',6,1),('BF7','ADDR LINE1',1,1),('BF8','ADDR LINE1',1,1);
GO

INSERT INTO [dbo].[Funds] (fund_desc,fund_amount) values ('F1',50000),('F2',5000),('F3',10000),('F4',15000),('F5',10000),('F6',12000),('F7',1400),('F8',50000);
GO

INSERT INTO [dbo].[FundAllocation] (fund_id,beneficiary_id,allocated_by,allocated_amount) values (1,1,1,10000),(1,2,1,10000),(1,2,1,10000),(2,3,3,5000),(3,4,3,5000),(3,4,3,5000);
GO

INSERT INTO [dbo].[VolunteerTracking] (user_id,beneficiary_id,is_active) values (1,1,1),(1,2,0),(1,3,1),(1,4,1),(2,1,1),(2,5,1),(3,6,1),(3,7,1),(4,8,1),(4,8,1)
GO

update ProjectLocation set changed_by = 'vysali',changed_date =GETDATE(),created_date=GETDATE();
GO

update Users set changed_by = 'vysali',changed_date =GETDATE(),created_date=GETDATE();
GO

update Beneficiary set changed_by = 'vysali',changed_date =GETDATE(),created_date=GETDATE();
GO

update FundAllocation set allocated_by= 'vysali',changed_by = 'vysali',changed_date =GETDATE(),allocated_date=GETDATE();
GO

update Locations set changed_by = 'vysali',changed_date =GETDATE(),created_date=GETDATE();
GO

update Project set changed_by = 'vysali',changed_date =GETDATE(),created_date=GETDATE();
GO

update VolunteerTracking set start_date =GETDATE(),end_date=GETDATE();
GO
