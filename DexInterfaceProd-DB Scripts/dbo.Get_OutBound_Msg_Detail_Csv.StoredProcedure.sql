/****** Object:  StoredProcedure [dbo].[Get_OutBound_Msg_Detail_Csv]    Script Date: 10/27/2022 8:36:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:      Usama Awan
-- Create Date: 03-21-2022
-- Description: To return message details
-- =============================================
-- exec [Get_OutBound_Msg_Detail_Csv] '439'
CREATE PROCEDURE [dbo].[Get_OutBound_Msg_Detail_Csv]
(
    -- Add the parameters for the stored procedure here
   @MessageID int
)
AS
BEGIN
    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON;

	 SELECT 
		MessageID, SiteCode, MessageType,FileDataCsv  ,InterfaceCode
	 FROM 
		[DEX_Interface_Document] 
	WHERE 
		Direction = 'Outbound' and Exported = 0 AND MessageID = @MessageID
END
GO
