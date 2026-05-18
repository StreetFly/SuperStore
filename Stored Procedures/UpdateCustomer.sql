USE Superstore
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Ryan Michael
-- Create date: 4/16/2026
-- Update date: 
-- Description:	Update a Customer
-- EXEC UpdateCustomer @FirstName = 'Ryan', @LastName = 'Michael', @SegmentID = 2, @CustomerID = 794
-- =============================================
CREATE PROCEDURE UpdateCustomer
	@FirstName NVARCHAR(50),
	@LastName NVARCHAR(50),
	@SegmentID INT,
	@CustomerID INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	BEGIN TRY
		UPDATE dbo.Customer
		SET FirstName = COALESCE(@FirstName, FirstName), 
			LastName = COALESCE(@LastName, LastName), 
			SegmentID = COALESCE(@SegmentID, SegmentID),
			DateUpdated = GETDATE()
		WHERE CustomerID = @CustomerID;
	END TRY
	BEGIN CATCH
		SELECT ERROR_MESSAGE() AS ErrorMessage;
	END CATCH
END
GO