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
-- Description:	Get Address by ID
-- EXEC GetAddress @AddressID = 1
-- =============================================
CREATE PROCEDURE [dbo].[GetAddress]
	@AddressID INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	BEGIN TRY
		SELECT TOP 100 a.AddressID,
		a.AddressLine1,
		a.AddressLine2,
		a.City,
		s.State,
		c.Country,
		a.PostalCode,
		r.Region,
		at.AddressType,
		a.CustomerID
		FROM dbo.Address AS a
		JOIN dbo.AddressType AS at
		ON a.AddressTypeID = at.AddressTypeID
		JOIN dbo.Country AS c
		ON a.CountryID = c.CountryID
		JOIN dbo.State AS s
		ON a.StateID = s.StateID
		JOIN dbo.Region AS r
		ON a.RegionID = r.RegionID
		WHERE IsActive = 1 AND AddressID = @AddressID
	END TRY
	BEGIN CATCH
		SELECT ERROR_MESSAGE() AS ErrorMessage;
	END CATCH
END