/****** Object:  StoredProcedure [dbo].[Update_Exported_Message]    Script Date: 10/27/2022 8:36:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:     Usama Awan/ K shehzad
-- Create Date: 07-26-2021
-- Description: Updating Msg Status
-- =============================================
CREATE PROCEDURE [dbo].[Update_Exported_Message] 
(
	@MessageID int
)
AS
BEGIN

	SET NOCOUNT ON;

	UPDATE DEX_Interface_Document
	SET Exported = 1 , ExportedOn = GetDate()
	WHERE MessageID = @MessageID

	SELECT * FROM DEX_Interface_Document WHERE MessageID = @MessageID
END
GO
