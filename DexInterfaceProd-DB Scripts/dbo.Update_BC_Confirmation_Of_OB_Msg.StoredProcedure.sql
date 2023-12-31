/****** Object:  StoredProcedure [dbo].[Update_BC_Confirmation_Of_OB_Msg]    Script Date: 10/27/2022 8:36:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      Usama Awan
-- Create Date: 03-08-21
-- Description: Update BC Confirmation  for BC Outbound Msg
-- =============================================

--EXEC [dbo].[Update_BC_Confirmation_Of_OB_Msg] '150'

CREATE PROCEDURE [dbo].[Update_BC_Confirmation_Of_OB_Msg]
@BCMessageID nvarchar(100)
AS
BEGIN
    
	SET NOCOUNT ON;

    UPDATE [dbo].[DEX_Interface_Document]
   SET 
      [ConfirmationSentToBC] = 1
      ,[ConfirmationSentOn] = GETDATE()

 WHERE BCMessageID = @BCMessageID

 Select * from [dbo].[DEX_Interface_Document] WHERE BCMessageID = @BCMessageID

END
GO
