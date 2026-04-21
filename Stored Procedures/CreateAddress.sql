USE [Superstore]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Ryan Michael
-- Create date: 4/21/2026
-- Update date: 
-- Description:	Create an Address
-- EXEC CreateAddress @AddressLine1 = '2320 South 19th street', @AddressLine2 = '', @City = 'Tacoma', @StateID = '49', @CountryID = '228', @PostalCode = '98405', @RegionID = '4', @AddressTypeID = '1', @CustomerID = '794'
-- =============================================
CREATE PROCEDURE [dbo].[CreateAddress]
	@AddressLine1 NVARCHAR(25),
	@AddressLine2 NVARCHAR(25) = NULL,
	@City NVARCHAR(50),
	@StateID INT,
	@CountryID INT,
	@PostalCode INT,
	@RegionID INT,
	@AddressTypeID INT,
	@CustomerID INT

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	BEGIN TRY
		INSERT INTO dbo.Address (
		AddressLine1,
		AddressLine2,
		City,
		StateID,
		CountryID,
		PostalCode,
		RegionID,
		AddressTypeID,
		CustomerID)
		VALUES (
		@AddressLine1,
		@AddressLine2,
		@City,
		@StateID,
		@CountryID,
		@PostalCode,
		@RegionID,
		@AddressTypeID,
		@CustomerID);
	END TRY
	BEGIN CATCH
		SELECT ERROR_MESSAGE() AS ErrorMessage;
	END CATCH
END