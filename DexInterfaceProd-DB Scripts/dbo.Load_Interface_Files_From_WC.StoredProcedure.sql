/****** Object:  StoredProcedure [dbo].[Load_Interface_Files_From_WC]    Script Date: 10/27/2022 8:36:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:      Usama Awan
-- Create Date: 11-Nov-2021
-- Description Created to load WC  files 
-- =============================================

--

--EXEC [Load_Interface_Files_From_WC] 'TUK_Orders_20210907_055606.xml',0,0


CREATE PROCEDURE [dbo].[Load_Interface_Files_From_WC]
	(
		@FileName nvarchar(250)
	)
	
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @SQLStr NVARCHAR(MAX)
    SET @SQLStr =

	'INSERT INTO [dbo].[DEX_Interface_Files]
           ([FileName]
           ,[IsDownloaded]
           ,[IsProcessed])
     VALUES'+
           '('''+@FileName+''', '+
           '0' + ', '+
           '0'+') 
		   SELECT SCOPE_IDENTITY() AS NewFileID  ';


	EXEC (@SQLStr)

	

END
GO
