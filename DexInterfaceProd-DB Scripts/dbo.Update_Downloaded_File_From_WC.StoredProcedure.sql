/****** Object:  StoredProcedure [dbo].[Update_Downloaded_File_From_WC]    Script Date: 10/27/2022 8:36:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:     Usama Awan/ K shehzad
-- Create Date: 07-26-2021
-- Description: Updating Downloaded File Status
-- =============================================
CREATE PROCEDURE [dbo].[Update_Downloaded_File_From_WC] 
(
	@FileID int
)
AS
BEGIN

	SET NOCOUNT ON;

	UPDATE dbo.DEX_Interface_Files
	SET IsDownloaded = 1 , DownloadedOn = GetDate()
	WHERE FileID = @FileID

	SELECT * FROM dbo.DEX_Interface_Files WHERE FileID = @FileID
END
GO
