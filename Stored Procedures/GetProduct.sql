USE [Superstore]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Ryan Michael
-- Create date: 4/23/2026
-- Update date: 
-- Description:	Get Product by ID
-- EXEC GetProduct @ProductID = '1'
-- =============================================
CREATE PROCEDURE [dbo].[GetProduct]
	@ProductID INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	BEGIN TRY
		SELECT TOP 1 
			p.ProductID,
			p.ProductName,
			p.CategoryID,
			c.Category,
			p.SubcategoryID,
			sc.SubCategory,
			p.UnitPrice,
			p.Quantity
		FROM dbo.Product AS p
		JOIN dbo.Category AS c
		ON p.CategoryID = c.CategoryID
		JOIN dbo.SubCategory AS sc
		ON p.SubcategoryID = sc.SubCategoryID
		WHERE p.ProductID = @ProductID AND IsActive = 1
	END TRY
	BEGIN CATCH
		SELECT ERROR_MESSAGE() AS ErrorMessage;
	END CATCH
END