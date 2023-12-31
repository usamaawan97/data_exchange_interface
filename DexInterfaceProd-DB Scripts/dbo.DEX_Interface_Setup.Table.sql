/****** Object:  Table [dbo].[DEX_Interface_Setup]    Script Date: 10/27/2022 8:36:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DEX_Interface_Setup](
	[WB_Interface_Setup_Id] [int] IDENTITY(1,1) NOT NULL,
	[AZKeyVaultURL] [nvarchar](1000) NULL,
	[BCBaseURL] [nvarchar](1000) NULL,
	[Version] [nvarchar](10) NULL,
	[DefaultTennantID] [nvarchar](40) NULL,
	[ActiveEnvironment] [nvarchar](40) NULL,
	[ExchangeRateAPIUrl] [nvarchar](1000) NULL,
	[InterfaceSuccessAlertEmails] [nvarchar](max) NULL,
	[InterfaceFailureAlertEmails] [nvarchar](max) NULL,
	[InterfaceInboundFilesBasePath] [nvarchar](1000) NULL,
	[InterfaceOutboundFilesBasePath] [nvarchar](1000) NULL,
 CONSTRAINT [PK_WB_Interface_Setup] PRIMARY KEY CLUSTERED 
(
	[WB_Interface_Setup_Id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
