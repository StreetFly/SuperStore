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
-- Description:	Get all Products
-- EXEC GetAllProducts
-- =============================================
CREATE PROCEDURE [dbo].[GetAllProducts]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	BEGIN TRY
		SELECT TOP 100 p.ProductID, p.ProductName, c.Category, sc.SubCategory, p.UnitPrice, p.Quantity
		FROM dbo.Product AS p
		JOIN dbo.Category AS c
		ON p.CategoryID = c.CategoryID
		JOIN dbo.SubCategory AS sc
		ON p.SubcategoryID = sc.SubCategoryID
		WHERE IsActive = 1
	END TRY
	BEGIN CATCH
		SELECT ERROR_MESSAGE() AS ErrorMessage;
	END CATCH
END