/****** Object:  StoredProcedure [dbo].[Get_Recon_File]    Script Date: 10/27/2022 8:36:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:      Usama Awan
-- Create Date: 03-Feb-22
-- Description: Get One Recon XML File
-- =============================================

--EXEC [dbo].[Get_Recon_File] 'TLUK'

CREATE PROCEDURE [dbo].[Get_Recon_File]
@SiteCode nvarchar(100)
AS
BEGIN
    SELECT(
				SELECT(
						SELECT
						[FileData].query('Shipment') 
						FROM dbo.DEX_Rec_Interface_Document
						Where SiteCode = @SiteCode AND FileData IS NOT NULL
						FOR XML PATH(''), TYPE
					  )
				FOR XML PATH('Shipments') ,TYPE
		  )AS ReconXML

END
GO
