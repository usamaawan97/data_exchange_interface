/****** Object:  StoredProcedure [dbo].[Load_BC_Outbound_Document_Response]    Script Date: 10/27/2022 8:36:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:     Usama Awan
-- Create Date: 04-08-2021
-- Description: To Load Outbound Messages
-- =============================================
CREATE PROCEDURE [dbo].[Load_BC_Outbound_Document_Response]
(
	@BCMessageID INT,
	@MessageType nvarchar(MAX),
	@Direction nvarchar(MAX),
	@PayLoad nvarchar(MAX),
	@SiteCode nvarchar(MAX)

)
AS
BEGIN
    -- SET NOCOUNT ON added to prevent extra result sets from
    SET NOCOUNT ON



	INSERT INTO [dbo].[BC_Outbound_Document_Response]
           ([BCMessageID]
           ,[MessageType]
           ,[Direction]
           ,[PayLoad]
           ,[SiteCode])
     VALUES
           (@BCMessageID
           ,@MessageType
           ,@Direction
           ,@PayLoad
           ,@SiteCode)

  select * from dbo.BC_Outbound_Document_Response where BCMessageID = @BCMessageID
end
GO
