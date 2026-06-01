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
-- Description:	Get one customer
-- EXEC GetCustomer @CustomerID = 1
-- =============================================
CREATE PROCEDURE GetCustomer
	@CustomerID INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	BEGIN TRY
	-- Return Customer by their ID
		SELECT TOP 1 c.CustomerID,
		c.FirstName,
		c.LastName,
		s.Segment
		FROM dbo.Customer AS c
		JOIN dbo.Segment AS s
		ON c.SegmentID = s.SegmentID
		WHERE c.CustomerID = @CustomerID AND IsActive = 1;
	END TRY
	BEGIN CATCH
		SELECT ERROR_MESSAGE() AS ErrorMessage;
	END CATCH
END
GO
