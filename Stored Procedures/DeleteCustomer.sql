USE Superstore
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Ryan Michael
-- Create date: 4/16/2026
-- Update date: 5/22/2026
-- Description:	Delete a Customer
-- EXEC DeleteCustomer @CustomerID = 794
-- EXEC DeleteCustomer @CustomerID = 794, @Delete = 1
-- =============================================
CREATE PROCEDURE [dbo].[DeleteCustomer]
	@CustomerID INT,
	@Delete BIT = 0
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	BEGIN TRY
		IF @Delete = 1
			BEGIN
				-- Delete all addresses for the customer
				EXEC DeleteAddress @CustomerID = @CustomerID, @Delete = 1

				-- Delete all orders for the customer
				DECLARE @IDs dbo.IDList;

				INSERT INTO @IDs (ID)
				SELECT OrderID 
				FROM dbo.[Order] 
				WHERE CustomerID = @CustomerID;

				-- Delete DeleteOrder
				EXEC DeleteOrder @OrdersIDs = @IDs, @Delete = 1

				DELETE FROM dbo.Customer
				WHERE CustomerID = @CustomerID;
			END
		ELSE 
			BEGIN
				UPDATE dbo.Customer
				SET IsActive = 0, DateUpdated = GETDATE()
				WHERE CustomerID = @CustomerID;
			END
	END TRY
	BEGIN CATCH
		SELECT ERROR_MESSAGE() AS ErrorMessage;
	END CATCH;
END