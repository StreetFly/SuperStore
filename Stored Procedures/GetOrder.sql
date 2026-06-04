USE [Superstore]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Ryan Michael
-- Create date: 5/19/2026
-- Update date: 
-- Description:	Get order by id
-- EXEC GetOrder @OrderID = '1'
-- =============================================
CREATE PROCEDURE [dbo].[GetOrder]
	@OrderID INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	BEGIN TRY
		SELECT TOP 1 
			OrderID,
			OrderDate,
			CustomerID,
			SalesPrice,
			Quantity,
			Discount,
			Profit,
			s.ShipMode,
			ShipDate
		FROM dbo.[Order] AS o
		JOIN dbo.ShipMode AS s
		ON o.ShipModeID = s.ShipModeID
		WHERE OrderID = @OrderID;
	END TRY
	BEGIN CATCH
		SELECT ERROR_MESSAGE() AS ErrorMessage;
	END CATCH
END