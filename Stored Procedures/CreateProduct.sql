USE [Superstore]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Ryan Michael
-- Create date: 4/23/2026
-- Update date: 5/26/2026
-- Description:	Create a Product
-- EXEC CreateProduct @ProductName = 'Samsung GalaxyBook', @CategoryID = '2', @SubCategoryID = '5', @UnitPrice = '596.25', @Inventory = '10'
-- =============================================
CREATE PROCEDURE [dbo].[CreateProduct]
	@ProductName NVARCHAR(150),
	@CategoryID INT,
	@SubCategoryID INT,
	@UnitPrice DECIMAL(18,2),
	@Inventory INT

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	BEGIN TRY
		IF EXISTS (
			SELECT 1
			FROM dbo.Product
			WHERE ProductName = @ProductName
				AND CategoryID = @CategoryID
				AND SubCategoryID = @SubCategoryID
		)
		BEGIN
			DECLARE @ExistingProductID INT = (
				SELECT ProductID
				FROM dbo.Product
				WHERE ProductName = @ProductName
					AND CategoryID = @CategoryID
					AND SubCategoryID = @SubCategoryID
			);

			EXEC GetProduct @ProductID = @ExistingProductID
			RETURN;
		END


		INSERT INTO dbo.Product (
		ProductName,
		CategoryID,
		SubCategoryID,
		UnitPrice,
		Inventory)
		VALUES (
		@ProductName,
		@CategoryID,
		@SubCategoryID,
		@UnitPrice,
		@Inventory);
		
		-- Return the newly created product
		DECLARE @NewProductID INT = SCOPE_IDENTITY();

		-- Return the newly created product
		EXEC GetProduct @ProductID = @NewProductID
	END TRY
	BEGIN CATCH
		SELECT ERROR_MESSAGE() AS ErrorMessage;
	END CATCH
END