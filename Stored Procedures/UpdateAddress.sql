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
-- Description:	Update an Address
-- EXEC UpdateAddress @AddressID = 794 @AddressLine1 = '2320 South 19th street', @AddressLine2 = '', @City = 'Tacoma', @StateID = '49', @CountryID = '228', @PostalCode = '98405', @RegionID = '4', @AddressTypeID = '1', @CustomerID = '794'
-- =============================================
CREATE PROCEDURE [dbo].[UpdateAddress]
	@AddressID INT,
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
		UPDATE dbo.Address
		SET
		AddressLine1 = @AddressLine1,
		AddressLine2 = @AddressLine2,
		City = @City,
		StateID = @StateID,
		CountryID = @CountryID,
		PostalCode = @PostalCode,
		RegionID = @RegionID,
		AddressTypeID = @AddressTypeID,
		CustomerID = @CustomerID,
		DateUpdated = GETDATE()
	WHERE AddressID = @AddressID;
	END TRY
	BEGIN CATCH
		SELECT ERROR_MESSAGE() AS ErrorMessage;
	END CATCH
END