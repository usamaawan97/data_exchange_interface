/****** Object:  StoredProcedure [dbo].[Get BC Inbound Response]    Script Date: 10/27/2022 8:36:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      <Author, , Usama Awan>
-- Create Date: <Create Date, , >
-- Description: <Description, , >
-- =============================================
CREATE PROCEDURE [dbo].[Get BC Inbound Response] 
@FilePath nvarchar(100), 
@FileName nvarchar(100), 
@DataSource nvarchar(100)
AS
BEGIN

    DECLARE @Path nvarchar(100) = @FilePath + '/' + @FileName
	DECLARE @SQL nvarchar(200) = 'INSERT INTO dbo.DEX_Interface_Document_Response (ResponseData)'+
	' SELECT BulkColumn
    FROM OPENROWSET (
    BULK ' + CHAR(39) + @Path + Char(39) +
	',SINGLE_BLOB
    ,DATA_SOURCE =' + CHAR(39)  + @DataSource + Char(39) +
	') AS DataFile;'
	
EXEC(@SQL);

END
GO
