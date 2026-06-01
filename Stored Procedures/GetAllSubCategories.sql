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
-- Description:	Get all Sub-Categories
-- EXEC GetAllSubCategories
-- =============================================
CREATE PROCEDURE [dbo].[GetAllSubCategories]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    BEGIN TRY
		SELECT SubCategoryID,
		SubCategory
		FROM dbo.SubCategory;
	END TRY
	BEGIN CATCH
		SELECT ERROR_MESSAGE() AS ErrorMessage;
	END CATCH;
END