/****** Object:  StoredProcedure [dbo].[Check For Processed File]    Script Date: 10/27/2022 8:36:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:     K Shehzad
-- Create Date: 07-23-2021
-- Description: Created to Check if File exists
-- =============================================
CREATE PROCEDURE [dbo].[Check For Processed File]
(
	@FileName nvarchar(80)

)
AS
BEGIN
    -- SET NOCOUNT ON added to prevent extra result sets from
    SET NOCOUNT ON

	DECLARE @SQLStr nvarchar(MAX) 
	SET @SQLStr =
		'select Count(*) as FileCount from [dbo].[DEX_Interface_Document] WHERE [FileName] = '''  + @FileName + ''''

	EXEC ( @SQLStr)
end


--exec [Check For Processed File] 'TUK_orders_202104071305.xml'
GO
