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
-- Description:	Get all address types
-- EXEC GetAllAddressTypes
-- =============================================
CREATE PROCEDURE [dbo].[GetAllAddressTypes]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    BEGIN TRY
		SELECT 
		AddressTypeID,
		AddressType
		FROM dbo.AddressType;
	END TRY
	BEGIN CATCH
		SELECT ERROR_MESSAGE() AS ErrorMessage;
	END CATCH;
END