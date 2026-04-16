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
-- Description:	Delete a Customer
-- EXEC DeleteCustomer @CustomerID = 794
-- =============================================
CREATE PROCEDURE DeleteCustomer
	@CustomerID INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	BEGIN TRY
		UPDATE dbo.Customer
		SET IsActive = 0, DateUpdated = GETDATE()
		WHERE CustomerID = @CustomerID
	END TRY
	BEGIN CATCH
		SELECT ERROR_MESSAGE() AS ErrorMessage;
	END CATCH
END
GO