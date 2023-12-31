/****** Object:  StoredProcedure [dbo].[Load BC Outbound Data CSV ILG]    Script Date: 10/27/2022 8:36:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:      Usama Awan
-- Create Date: 03/21/2022
-- Description: Load BC Outbound Data from Outbound Document Table.
-- =============================================
CREATE PROCEDURE [dbo].[Load BC Outbound Data CSV ILG]
@BCMessageID INT
AS
BEGIN
    SET NOCOUNT ON;

	INSERT INTO [DEX_Interface_Document]
		(SiteCOde, Direction,MessageDate,MessageType,Exported,CreatedOn,FileDataCsv,BCMessageID,InterfaceCode)
	SELECT 
		SiteCode,Direction,GetDate() as MessageData, MessageType ,0 as Exported,getdate() as CreatedOn,  
		PayLoad,BCMessageID,
		case MessageType  
		when 'ILG Sale Order' then 'OBILGSO' when 'ILG Purchase Order' then 'OBILGPO'
		when 'Master Data' then 'OBILGMD'
		end as InterfaceCode

	from BC_Outbound_Document_Response_ILG WHERE BCMessageID = @BCMessageID
	delete from BC_Outbound_Document_Response_ILG where BCMessageID = @BCMessageID ;

		
end
GO
