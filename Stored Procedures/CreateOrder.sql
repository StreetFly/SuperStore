USE [Superstore]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Ryan Michael
-- Create date: 5/26/2026
-- Update date: 
-- Description:	Create an Order
-- EXEC CreateOrder @CustomerID = '1', @SalesPrice = '100.50', @Quantity = '2', @Discount = '0.0', @Profit = '25.00', @ShipModeID = '1', @ShipDate = '10/25/2026'
-- =============================================
CREATE PROCEDURE [dbo].[CreateOrder]
	@CustomerID INT,
	@SalesPrice DECIMAL (18,2),
	@Quantity INT,
	@Discount DECIMAL (18,2),
	@Profit DECIMAL (18,2),
	@ShipModeID INT,
	@ShipDate DATETIME = NULL

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	BEGIN TRY
		INSERT INTO dbo.[Order] (
		CustomerID,
		SalesPrice,
		Quantity,
		Discount,
		Profit,
		ShipModeID,
		ShipDate)
		VALUES (
		@CustomerID,
		@SalesPrice,
		@Quantity,
		@Discount,
		@Profit,
		@ShipModeID,
		@ShipDate);
	END TRY
	BEGIN CATCH
		SELECT ERROR_MESSAGE() AS ErrorMessage;
	END CATCH
END