/****** Object:  StoredProcedure [dbo].[Update_Processed_File_From_WC]    Script Date: 10/27/2022 8:36:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:     Usama Awan/ K shehzad
-- Create Date: 07-26-2021
-- Description: Updating Processed File Status
-- =============================================
CREATE PROCEDURE [dbo].[Update_Processed_File_From_WC] 
(
	@FileID int
)
AS
BEGIN

	SET NOCOUNT ON;

	UPDATE dbo.DEX_Interface_Files
	SET IsProcessed = 1 , ProcessedOn = GetDate()
	WHERE FileID = @FileID

	SELECT * FROM dbo.DEX_Interface_Files WHERE FileID = @FileID
END
GO
