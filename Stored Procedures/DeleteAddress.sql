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
-- Description:	Either going to delete or deactivate address
-- EXEC DeleteAddress @CustomerID = 794
-- EXEC DeleteAddress @CustomerID = 794, @Delete = 1
-- =============================================
CREATE PROCEDURE [dbo].[DeleteAddress]
	@CustomerID INT,
	@Delete BIT = 0
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	BEGIN TRY
	IF @Delete = 1
		BEGIN
			DELETE
			FROM dbo.Address
			WHERE CustomerID = @CustomerID
		END
	ELSE
		BEGIN
			UPDATE dbo.Address
			SET IsActive = 0, DateUpdated = GETDATE()
			WHERE CustomerID = @CustomerID
		END
	END TRY
	BEGIN CATCH
		SELECT ERROR_MESSAGE() AS ErrorMessage;
	END CATCH
END