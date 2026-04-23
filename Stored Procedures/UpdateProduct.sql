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
-- Description:	Update a Product
-- EXEC UpdateProduct ProductName= 'Snapdragon X Plus', CategoryID = '3', SubCategoryID = '4', UnitPrice = '200.00', ProductID = '1863'
-- =============================================
CREATE PROCEDURE [dbo].[UpdateProduct]
	@ProductName NVARCHAR(150),
	@CategoryID INT,
	@SubCategoryID INT,
	@UnitPrice DECIMAL(18,2),
	@ProductID INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	BEGIN TRY
		UPDATE dbo.Product
		SET
		ProductName = @ProductName,
		CategoryID = @CategoryID,
		SubCategoryID = @SubCategoryID,
		UnitPrice = @UnitPrice
		WHERE ProductID = @ProductID
	END TRY
	BEGIN CATCH
		SELECT ERROR_MESSAGE() AS ErrorMessage;
	END CATCH
END
