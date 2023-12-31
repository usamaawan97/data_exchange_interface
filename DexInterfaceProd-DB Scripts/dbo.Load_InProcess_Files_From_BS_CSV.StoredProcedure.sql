/****** Object:  StoredProcedure [dbo].[Load_InProcess_Files_From_BS_CSV]    Script Date: 10/27/2022 8:36:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:      Usama Awan / kshehzad
-- Create Date: 07-21-2021
-- Description Created to load interface data files 
-- =============================================

--

--EXEC [Load_InProcess_Files_From_BS_CSV] 'ILGEU_EDI Sale Order_dispatch_confirmation2022-05-111839.csv','ibinprocess','Inbound', 'AzureStorage'


CREATE PROCEDURE [dbo].[Load_InProcess_Files_From_BS_CSV]
	@FileName nvarchar(MAX),
	@ContainerName nvarchar(1000),
	@Direction nvarchar(1000),
	@DataSource nvarchar(1000),
	@SiteCode nvarchar(1000),
	@MessageType nvarchar(1000)
AS
BEGIN
	SET NOCOUNT ON;

    DECLARE @Path nvarchar(MAX) = @ContainerName + '/' + @FileName
	DECLARE @SQLStr nvarchar(MAX) 
	DECLARE @InterfaceCode nvarchar(1000)

	

	SET @InterfaceCode  = case @MessageType when 'ILG Sale Order' then 'IBILGDC' when 'ILG Purchase Order' then 'IBILGPOC' end;
	SET @SQLStr =
		'INSERT INTO [dbo].[DEX_Interface_Document]
			   ([SiteCode]
			   ,[Direction]
			   ,[MessageDate]
			   ,[MessageType]
			   ,[CreatedOn]
			   ,[Exported]
			   ,[FileName]
			   ,[InterfaceCode]
			   ,[FileDataCsv])
		SELECT
			  '''+	 
			  @SiteCode  + ''', ' +
			  ''''+ @Direction +
			  ''', Getdate(),''' +
			  @MessageType +
			  ''', SYSDATETIME(), 0, ''' 
			  +@FileName  + ''', ' +
			  ''''+@InterfaceCode + ''',
					BulkColumn
					FROM OPENROWSET (
					BULK ' + CHAR(39) + @Path + Char(39) +
					',SINGLE_BLOB
					,DATA_SOURCE =' + CHAR(39)  + @DataSource + Char(39) + ') as FileData;'

	EXEC (@SQLStr)



END

GO
