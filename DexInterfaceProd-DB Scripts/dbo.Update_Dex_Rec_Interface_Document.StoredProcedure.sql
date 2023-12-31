/****** Object:  StoredProcedure [dbo].[Update_Dex_Rec_Interface_Document]    Script Date: 10/27/2022 8:36:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:      Usama Awan
-- Create Date: 04/Feb/2022
-- Description: Updates the File Data Of Matching Shipments.
-- =============================================

-- EXEC [dbo].[Update_Dex_Rec_Interface_Document] '<Shipment><No>TLUS-102664</No><ShipmentDate>2021-11-19</ShipmentDate><Line><ItemNo>100105</ItemNo><QtyOrdered>0.00000000000000000000</QtyOrdered><QtyShipped>0.00000000000000000000</QtyShipped><TrackingNo>9400111899220595743993</TrackingNo><TotalPackages>1</TotalPackages></Line></Shipment>','TLUS','TLUS-102668'

CREATE PROCEDURE [dbo].[Update_Dex_Rec_Interface_Document]
@ReconXML xml,
@SiteCode nvarchar(50),
@Order_Number nvarchar(50)
AS

BEGIN
/*
	DECLARE @result xml
	
	SELECT @result = FileData 
	FROM DEX_Rec_Interface_Document 
	WHERE	SiteCode = @SiteCode AND Order_Number = @Order_Number

	   
	IF (Cast(@result as nvarchar(max)) is null or Cast(@result as nvarchar(max))  = '')
		 BEGIN
*/			 Update  DEX_Rec_Interface_Document
			 Set FileData = @ReconXML
			 WHERE SiteCode = @SiteCode AND Order_Number = @Order_Number
/*		 END
	ELSE
		 BEGIN
			 Update  DEX_Rec_Interface_Document
			 Set FileData.modify('insert sql:variable("@ReconXML") into (/)[1]')
			 WHERE SiteCode = @SiteCode AND Order_Number = @Order_Number
		 END
*/
END

GO
