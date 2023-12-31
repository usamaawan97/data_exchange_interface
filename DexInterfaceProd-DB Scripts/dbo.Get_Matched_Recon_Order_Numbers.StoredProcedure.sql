/****** Object:  StoredProcedure [dbo].[Get_Matched_Recon_Order_Numbers]    Script Date: 10/27/2022 8:36:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:      Usama Awan
-- Create Date: 04/Feb/2022
-- Description: Get all Order Numbers from existing shipments and insert in new table. After that match orders we get from file to match and return matching orders from our existing orders.
-- =============================================

-- EXEC [dbo].[Get_Matched_Recon_Order_Numbers] 'IOPUS'

CREATE PROCEDURE [dbo].[Get_Matched_Recon_Order_Numbers]
@SiteCode nvarchar(250)
AS
BEGIN
   
 INSERT INTO DEX_Rec_Interface_Shipment_Order (MessageID,SiteCode,Order_Number)
 SELECT MessageID,SiteCode,shipment.value('(No)[1]','varchar(100)') AS Order_Number FROM DEX_Interface_Document  
 CROSS APPLY FileData.nodes('(/Shipments/*)') Shipments(shipment) 
 WHERE SiteCode = @SiteCode AND MessageType = 'Shipment'


SELECT dris.MessageID AS DexInterfaceDocMID,drid.MessageID AS DexRecInterfaceMID, drid.SiteCode,drid.Order_Number 
FROM DEX_Rec_Interface_Document drid
INNER JOIN DEX_Rec_Interface_Shipment_Order dris ON dris.Order_Number = drid.Order_Number
Where drid.SiteCode = @SiteCode
END

GO
