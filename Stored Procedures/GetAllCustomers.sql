USE Superstore
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Ryan Michael
-- Create date: 4/14/2026
-- Update date: 
-- Description:	Get all customers
-- EXEC GetAllCustomers
-- =============================================
CREATE PROCEDURE GetAllCustomers
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	BEGIN TRY
	-- Return top 100 active customers with their segment information
		SELECT TOP 100 c.CustomerID, c.FirstName, c.LastName, s.Segment
		FROM dbo.Customer AS c
		JOIN dbo.Segment AS s
		ON c.SegmentID = s.SegmentID
		WHERE IsActive = 1
	END TRY
	BEGIN CATCH
		SELECT ERROR_MESSAGE() AS ErrorMessage;
	END CATCH
END
GO
