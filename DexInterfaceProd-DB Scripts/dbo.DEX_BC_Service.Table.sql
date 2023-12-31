/****** Object:  Table [dbo].[DEX_BC_Service]    Script Date: 10/27/2022 8:36:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DEX_BC_Service](
	[ServiceCode] [nvarchar](80) NOT NULL,
	[ServiceName] [nvarchar](80) NULL,
	[APIVersion] [nvarchar](4) NULL,
	[IsOdata] [bit] NULL,
	[ODataVersion] [nvarchar](10) NULL,
	[SoapAction] [nvarchar](200) NULL,
	[ContentType] [nvarchar](50) NULL,
 CONSTRAINT [PK_WB_BC_Service] PRIMARY KEY CLUSTERED 
(
	[ServiceCode] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
