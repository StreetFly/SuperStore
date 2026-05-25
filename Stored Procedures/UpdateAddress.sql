USE [Superstore]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Ryan Michael
-- Create date: 4/23/2026
-- Update date: 5/19/2026
-- Description:	Update an Address
-- EXEC UpdateAddress @AddressID = 794 @AddressLine1 = '2320 South 19th street', @AddressLine2 = '', @City = 'Tacoma', @StateID = '49', @CountryID = '228', @PostalCode = '98405', @RegionID = '4', @AddressTypeID = '1', @CustomerID = '794'
-- =============================================
CREATE PROCEDURE [dbo].[UpdateAddress]
	@AddressID INT = NULL,
	@AddressLine1 NVARCHAR(25) = NULL,
	@AddressLine2 NVARCHAR(25) = NULL,
	@City NVARCHAR(50) = NULL,
	@StateID INT = NULL,
	@CountryID INT = NULL,
	@PostalCode INT = NULL,
	@RegionID INT = NULL,
	@AddressTypeID INT = NULL,
	@CustomerID INT = NULL

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	BEGIN TRY
		UPDATE dbo.Address
		SET AddressLine1 = COALESCE(@AddressLine1, AddressLine1), 
			AddressLine2 = COALESCE(@AddressLine2, AddressLine2), 
			City = COALESCE(@City, City), 
			StateID = COALESCE(@StateID, StateID), 
			CountryID = COALESCE(@CountryID, CountryID), 
			PostalCode = COALESCE(@PostalCode, PostalCode), 
			RegionID = COALESCE(@RegionID, RegionID), 
			AddressTypeID = COALESCE(@AddressTypeID, AddressTypeID), 
			CustomerID = COALESCE(@CustomerID, CustomerID),
			DateUpdated = GETDATE()
		WHERE AddressID = @AddressID;
	END TRY
	BEGIN CATCH
		SELECT ERROR_MESSAGE() AS ErrorMessage;
	END CATCH
END