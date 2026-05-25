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
-- Description:	Get all Countries
-- EXEC GetAllCountries
-- =============================================
CREATE PROCEDURE [dbo].[GetAllCountries]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    BEGIN TRY
		SELECT 
		CountryID,
		Country,
		Latitude,
		Longitude,
		[Name]
		FROM dbo.Country;
	END TRY
	BEGIN CATCH
		SELECT ERROR_MESSAGE() AS ErrorMessage;
	END CATCH;
END