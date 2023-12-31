/****** Object:  StoredProcedure [dbo].[Update_BC_Message ID_From_Response]    Script Date: 10/27/2022 8:36:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      Kamran Shehzad
-- Create Date: 07-27-21
-- Description: Update MSG ID for BC Inbound
-- =============================================
CREATE PROCEDURE [dbo].[Update_BC_Message ID_From_Response]
AS
BEGIN
    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON

    -- Insert statements for procedure here
	UPDATE DEX_Interface_Document
	SET BCMessageID = R.BCMessageID, LastUpdatedOn = GETDATE()
	FROM DEX_Interface_Document D 
	INNER JOIN  DEX_Interface_Document_Response R
	ON D.[MessageID] = R.[MessageID]
	WHERE ISNULL( D.[BCMessageID] ,'')=''

	DELETE FROM DEX_Interface_Document_Response

END
GO
