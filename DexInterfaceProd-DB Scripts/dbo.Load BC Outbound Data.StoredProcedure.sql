/****** Object:  StoredProcedure [dbo].[Load BC Outbound Data]    Script Date: 10/27/2022 8:36:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      Kamran Shehzad
-- Create Date: 07/27/2021
-- Description: Load BC Outbound Data from Outbound Document Table.
-- =============================================
CREATE PROCEDURE [dbo].[Load BC Outbound Data]
AS
BEGIN
    SET NOCOUNT ON;

	INSERT INTO [DEX_Interface_Document]
		(SiteCOde, Direction,MessageDate,MessageType,Exported,CreatedOn,FileData,BCMessageID,InterfaceCode)
	SELECT 
		SiteCode,Direction,GetDate() as MessageData, MessageType ,0 as Exported,getdate() as CreatedOn,  
	   replace (
			replace( [PayLoad],'Ù‹<?xml version="1.0" encoding="utf-8"?>','<?xml version="1.0" encoding="utf-8"?>') ,
			'<?xml version="1.0" encoding="utf-8"?>','')
		as FileData ,
		BCMessageID,
		case MessageType when 'Order Confirmations' then 'OBWCORDCON' when 'Inventory' then 'OBWCINV' when 'Shipment' then 'OBWCSHIP' end as InterfaceCode

	from BC_Outbound_Document_Response
--	WHERE BCMessageID not IN (SELECT DISTINCT BCMessageID FROM [DEX_Interface_Document] WHERE Direction = 'Outbound') AND SiteCode NOT IN (SELECT DISTINCT SiteCode FROM [DEX_Interface_Document] WHERE Direction = 'Outbound')
	delete from BC_Outbound_Document_Response;

	SELECT TOP 1
		MessageID, SiteCode, MessageType, FileData,InterfaceCode
	FROM 
		DEX_Interface_Document 
	WHERE 
		Direction = 'Outbound' and Exported = 0
		
end
GO
