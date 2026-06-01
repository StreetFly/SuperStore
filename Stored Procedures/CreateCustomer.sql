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
-- Description:	Create a Customer
-- EXEC CreateCustomer @FirstName = 'Ryan', @LastName = 'Michael', @SegmentID = 2
-- =============================================
CREATE PROCEDURE CreateCustomer
	@FirstName NVARCHAR(50),
	@LastName NVARCHAR(50),
	@SegmentID INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	BEGIN TRY
		INSERT INTO dbo.Customer (
			FirstName,
			LastName,
			SegmentID)
		VALUES (
			@FirstName,
			@LastName,
			@SegmentID);
	END TRY
	BEGIN CATCH
		SELECT ERROR_MESSAGE() AS ErrorMessage;
	END CATCH
END
GO