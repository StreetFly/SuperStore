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
-- Description:	Get all States
-- EXEC GetAllStates
-- =============================================
CREATE PROCEDURE [dbo].[GetAllStates]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    BEGIN TRY
		SELECT 
        StateID,
		State,
		Latitude,
		Longitude,
		[Name]
		FROM dbo.State;
	END TRY
	BEGIN CATCH
		SELECT ERROR_MESSAGE() AS ErrorMessage;
	END CATCH;
END