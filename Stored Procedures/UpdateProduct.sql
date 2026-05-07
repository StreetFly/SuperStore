USE [Superstore]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Ryan Michael
-- Create date: 4/23/2026
-- Update date: 5/7/2026
-- Description:	Update a Product
-- EXEC UpdateProduct ProductID = '1863', ProductName= 'Snapdragon X Plus', CategoryID = '3', SubCategoryID = '4', UnitPrice = '200.00', Quantity = '10'
-- EXEC UpdateProduct @Product ID = '1863', @Quantity = '15'
-- =============================================
CREATE PROCEDURE [dbo].[UpdateProduct]
	@ProductID INT,
	@ProductName NVARCHAR(150) = NULL,
	@CategoryID INT = NULL,
	@SubCategoryID INT = NULL,
	@UnitPrice DECIMAL(18,2) = NULL,
	@Quantity INT = NULL
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	BEGIN TRY
		UPDATE dbo.Product
		SET
		ProductName = COALESCE(@ProductName, ProductName),
		CategoryID = COALESCE(@CategoryID, CategoryID),
		SubCategoryID = COALESCE(@SubCategoryID, SubCategoryID),
		UnitPrice = COALESCE(@UnitPrice, UnitPrice),
		Quantity = COALESCE(@Quantity, Quantity)
		WHERE ProductID = @ProductID
	END TRY
	BEGIN CATCH
		SELECT ERROR_MESSAGE() AS ErrorMessage;
	END CATCH
END
