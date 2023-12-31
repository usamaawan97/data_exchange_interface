/****** Object:  StoredProcedure [dbo].[Load_Recon_Files]    Script Date: 10/27/2022 8:36:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:      Usama Awan
-- Create Date: 03-Feb-2021
-- Description Created to load recon data files 
-- =============================================

--

--EXEC [Load_Recon_Files] 'Outbound','TLUS','<Shipment>2022-01-13</Shipment>'


CREATE PROCEDURE [dbo].[Load_Recon_Files]
	@Direction nvarchar(50),
	@SiteCode nvarchar(10),
	@ReconXML nvarchar(MAX)
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @SQLStr nvarchar(MAX) 

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
			   ,[FileData])
		SELECT
			  '''+	 
			  @SiteCode  + ''', ' +
			  ''''+ @Direction +
			  ''', Getdate(),''' +
			  'Recon' +
			  ''', SYSDATETIME(), 0, ''' 
			  +''  + ''', ' 
			  +''''+'OBWCREC' + ''', ' 
			  + '''' + @ReconXML+ '''; ' 
			  + 'SELECT SCOPE_IDENTITY() AS NewFileID;'

	EXEC (@SQLStr)


END
GO
