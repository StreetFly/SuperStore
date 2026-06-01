USE [Superstore]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Ryan Michael
-- Create date: 5/16/2026
-- Update date: 
-- Description:	Get all Categories
-- EXEC GetAllCategories
-- =============================================
CREATE PROCEDURE [dbo].[GetAllCategories]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    BEGIN TRY
		SELECT CategoryID,
		Category
		FROM dbo.Category;
	END TRY
	BEGIN CATCH
		SELECT ERROR_MESSAGE() AS ErrorMessage;
	END CATCH;
END