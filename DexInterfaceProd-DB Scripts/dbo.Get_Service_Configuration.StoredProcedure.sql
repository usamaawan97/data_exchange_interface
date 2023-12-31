/****** Object:  StoredProcedure [dbo].[Get_Service_Configuration]    Script Date: 10/27/2022 8:36:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      K Shehzad
-- Create Date: 07-26-2021
-- Description: Created to get configuration for services
-- =============================================

--EXEC dbo.[Get_Service_Configuration] 'IOPUS' , 'UpdateOutboundMessages'

CREATE PROCEDURE [dbo].[Get_Service_Configuration]
(
   @SiteCode nvarchar(10),
   @ServiceCode nvarchar(80)
)
AS
BEGIN
    SET NOCOUNT ON;
	DECLARE @BCBaseURL nvarchar(80)
	DECLARE @CurrEnv nvarchar(20)
	DECLARE @TennantID nvarchar(40)
	DECLARE @CompanyName nvarchar(80)
	DECLARE @ApiVersion nvarchar(4)
	DECLARE @ServiceName nvarchar(80)
	DECLARE @SOAPAction nvarchar(250)
	DECLARE @IsOData bit
	DECLARE @ODataVersion nvarchar(4)
	DECLARE @RelativeURL nvarchar(1000)
	DECLARE @FullURL nvarchar(1000)
	DECLARE @ContentType nvarchar(50)

	SELECT @BCBaseURL = BCBaseURL from [Dex_Interface_Setup] 
	
	SELECT @TennantID = SC.TennantID, @CompanyName = SC.CompanyName , @CurrEnv = ActiveEnvironment FROM [dbo].[DEX_Site_Config] SC WHERE SiteCode = @SiteCode
	
	SELECT @ContentType = ContentType ,@ApiVersion = APIVersion, @SOAPAction = SoapAction , @ServiceName = ServiceName , @IsOData = IsOdata, @ODataVersion = ODataVersion
	from dbo.[DEX_BC_Service] BCS  WHERE ServiceCode = @ServiceCode
	
	if @IsOData= 0 begin 
		--https://api.businesscentral.dynamics.com/v2.0/ac636b3d-2eb0-41e7-b5a6-7e15645731e9/SandboxDev/WS/We%20Are%20Luxe%20-%20Live/Codeunit/MessageMgmt
		--SELECT  @BCBaseURL + '/' + @ApiVersion + '/' + @TennantID  +'/'  + @CurrEnv + '/WS/'+ +@CompanyName + '/' + @ServiceName
		SET  @RelativeURL =  @ApiVersion + '/' + @TennantID  +'/'  + @CurrEnv + '/WS/'+ +@CompanyName + '/' + @ServiceName
		
		SET  @FullURL =  RTRIM( LTRIM(@BCBaseURL))  + @ApiVersion + '/' + @TennantID  +'/'  + @CurrEnv + '/WS/'+ +@CompanyName + '/' + @ServiceName
	end else 
		--SELECT @BCBaseURL + '/' + @ApiVersion + '/' + @TennantID  +'/'  + @CurrEnv + '/' + @ODataVersion + '/Company(''' + @CompanyName + ''')/' + @ServiceName
		SET  @RelativeURL = @ApiVersion + '/' + @TennantID  +'/'  + @CurrEnv + '/' + @ODataVersion + '/Company(''' + @CompanyName + ''')/' + @ServiceName
		SET @FullURL = RTRIM(LTRIM(@BCBaseURL)) + @ApiVersion + '/' + @TennantID  +'/'  + @CurrEnv + '/WS/'+ +@CompanyName + '/' + @ServiceName
		--https://api.businesscentral.dynamics.com/v2.0/ac636b3d-2eb0-41e7-b5a6-7e15645731e9/SandboxDev/ODataV4/Company('We%20Are%20Luxe%20-%20Live')/Analysis_View_Entries

	SELECT @FullURL  as ServiceURL , @BCBaseURL as BaseURL , @RelativeURL as RelativeURL , @SOAPAction as SoapAction, @ContentType as ContentType

END
GO
