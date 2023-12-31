/****** Object:  StoredProcedure [dbo].[Load_InProcess_Files_From_BS]    Script Date: 10/27/2022 8:36:14 AM ******/
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

--EXEC [Load_InProcess_Files_From_BS] 'TUK_Orders_20210922_203812.xml','ibinprocess','Inbound', 'AzureStorage'


CREATE PROCEDURE [dbo].[Load_InProcess_Files_From_BS]
	@FileName nvarchar(MAX),
	@ContainerName nvarchar(1000),
	@Direction nvarchar(1000),
	@DataSource nvarchar(1000)
AS
BEGIN
	SET NOCOUNT ON;

    DECLARE @Path nvarchar(MAX) = @ContainerName + '/' + @FileName
	DECLARE @SiteCode nvarchar(1000)
	DECLARE @TempStr nvarchar(1000)
	DECLARE @MessageType nvarchar(1000)
	DECLARE @Index int
	DECLARE @SQLStr nvarchar(MAX) 
	DECLARE @InterfaceCode nvarchar(1000)


	SET @TempStr = @FileName;
	SET @Index = CHARINDEX('_',@TempStr,0)
	SET @SiteCode = SUBSTRING( @TempStr,0,@Index)
	SET @TempStr = SUBSTRING( @TempStr,@Index+1, LEN(@TempStr))
	SET @Index = CHARINDEX('_',@TempStr,0)
	SET @MessageType = SUBSTRING( @TempStr,0,@Index) 

	SET @InterfaceCode  = case @MessageType when 'Orders' then 'IBWCSO'	when 'Shipment' then 'IBPDRSHIP' 
											when 'Inventory' then 'IBPDRSHIP' 
											when 'EDIShipment' then 'IBEDISC' end;
	SET @SQLStr =
		'INSERT INTO [DEXInterfaceProd].[dbo].[DEX_Interface_Document]
			   ([SiteCode]
			   ,[Direction]
			   ,[MessageDate]
			   ,[MessageType]
			   ,[CreatedOn]
			   ,[Exported]
			   ,[FileName]
			   ,[InterfaceCode]
			   ,[FileData])
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
	--print @sqlstr

	-- fix broken tags
	--Plain_Orders_Payment type
	--Plain_Orders_Paypal transaction fee
	

	--UPDATE DEX_Interface_Document 
	--SET  RawFileData =  replace( RawFileData ,'Plain_Orders_Payment type','Plain_Orders_Payment_type')
	--WHERE UPPER(Direction) = 'INBOUND' and Exported = 0

	--UPDATE DEX_Interface_Document 
	--SET RawFileData =  replace( RawFileData,'Plain_Orders_Paypal transaction fee','Plain_Orders_Paypal_transaction_fee')
	--WHERE UPPER(Direction) = 'INBOUND' and Exported = 0

	--UPDATE DEX_Interface_Document 
	--SET  FileData =  cast (RawFileData as xml)  
	--WHERE UPPER(Direction) = 'INBOUND' and Exported = 0


END


--select * from DEX_Interface_Document where MessageID = 87
GO
