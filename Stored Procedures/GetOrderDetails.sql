USE [Superstore]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Ryan Michael
-- Create date: 5/28/2026
-- Update date: 
-- Description:	Get order details in JSON format
-- EXEC GetOrderDetails @OrderID = 1198
-- =============================================
CREATE PROCEDURE [dbo].[GetOrderDetails]
	@OrderID INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	BEGIN TRY
		SELECT 
		JSON_QUERY(
		(
			SELECT 
			OrderID,
			OrderDate,
			c.FirstName,
			c.LastName,
			SalesPrice,
			Quantity,
			Discount,
			Profit,
			s.ShipMode
			FROM dbo.[Order]  o
			JOIN dbo.Customer c
			ON o.CustomerID = c.CustomerID
			JOIN dbo.ShipMode s
			ON o.ShipModeID = s.ShipModeID
			WHERE OrderID = @OrderID AND o.IsActive = 1
			FOR JSON PATH, WITHOUT_ARRAY_WRAPPER
		)
		) AS [Order],
		JSON_QUERY(
		(
			SELECT
			p.ProductID,
			ProductName,
			c.Category,
			sc.SubCategory,
			UnitPrice,
			Inventory
			FROM dbo.OrderDetail od
			JOIN dbo.[Product] p
			ON od.ProductID = p.ProductID
			JOIN dbo.Category c
			ON p.CategoryID = c.CategoryID
			JOIN dbo.SubCategory sc
			ON p.SubCategoryID = sc.SubCategoryID
			WHERE od.OrderID = @OrderID
			FOR JSON PATH
		)
		) AS [Products]
		FOR JSON PATH, WITHOUT_ARRAY_WRAPPER
	END TRY
	BEGIN CATCH
		SELECT ERROR_MESSAGE() AS ErrorMessage;
	END CATCH
END