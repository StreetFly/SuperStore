USE [Superstore]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Ryan Michael
-- Create date: 5/31/2026
-- Update date: 
-- Description:	Update an Order
-- EXEC UpdateOrder @OrderID = 5010, @CustomerID = '2', @SalesPrice = '100.50', @Quantity = '2', @Discount = '0.0', @Profit = '25.00', @ShipModeID = '1', @ShipDate = '10/30/2026'
-- =============================================
CREATE PROCEDURE [dbo].[UpdateOrder]
	@OrderID INT,
	@CustomerID INT = NULL,
	@SalesPrice DECIMAL (18,2) = NULL,
	@Quantity INT = NULL,
	@Discount DECIMAL (18,2) = NULL,
	@Profit DECIMAL (18,2) = NULL,
	@ShipModeID INT = NULL,
	@ShipDate DATETIME = NULL

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	BEGIN TRY
		UPDATE dbo.[Order]
		SET CustomerID = COALESCE(@CustomerID, CustomerID),
			SalesPrice = COALESCE(@SalesPrice, SalesPrice),
			Quantity = COALESCE(@Quantity, Quantity),
			Discount = COALESCE(@Discount, Discount),
			Profit = COALESCE(@Profit, Profit),
			ShipModeID = COALESCE(@ShipModeID, ShipModeID),
			ShipDate = COALESCE(@ShipDate, ShipDate),
			DateUpdated = GETDATE()
		WHERE OrderID = @OrderID;
	END TRY
	BEGIN CATCH
		SELECT ERROR_MESSAGE() AS ErrorMessage;
	END CATCH
END