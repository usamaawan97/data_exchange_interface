/****** Object:  Table [dbo].[DEX_Site_Config]    Script Date: 10/27/2022 8:36:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DEX_Site_Config](
	[SiteCode] [nvarchar](100) NOT NULL,
	[Prefix] [nvarchar](1000) NULL,
	[TennantID] [nvarchar](1000) NULL,
	[CompanyName] [nvarchar](1000) NULL,
	[ActiveEnvironment] [nvarchar](1000) NULL,
 CONSTRAINT [PK_WB_Site_Config_1] PRIMARY KEY CLUSTERED 
(
	[SiteCode] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
