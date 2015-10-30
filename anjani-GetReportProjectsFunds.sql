USE [PROJECT]
GO
/****** Object:  StoredProcedure [dbo].[GetReportProjectsFunds]    Script Date: 10/29/2015 12:07:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO








-- =============================================
-- Author:		Anjani
-- Create date: 28-10-2015
-- Description:	Get Report on projects and funds
-- =============================================
CREATE PROCEDURE [dbo].[GetReportProjectsFunds] 
	-- Add the parameters for the stored procedure here

	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	BEGIN TRY
    -- Insert statements for procedure here
select 
	
	sum(FA.allocated_amount) as amount,P.project_id,P.project_name,L.location_id,L.location_name
	FROM FundAllocation FA
	INNER JOIN Beneficiary B ON FA.beneficiary_id = B.beneficiary_id
	INNER JOIN ProjectLocation PL ON B.project_location_id = PL.project_location_id
	INNER JOIN Project P ON PL.project_id=P.project_id
	INNER JOIN Locations L ON PL.location_id = L.location_id
	GROUP BY P.project_id,P.project_name,L.location_id,L.location_name 
	
	
	END TRY
	BEGIN CATCH  
		RETURN @@ERROR  
	END CATCH  

	RETURN @@error   
END
