/****** Object:  Table [dbo].[DEX_Interface]    Script Date: 10/27/2022 8:36:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DEX_Interface](
	[InterfaceCode] [nvarchar](100) NOT NULL,
	[Name] [nvarchar](500) NULL,
	[Enabled] [bit] NULL,
	[CopyToOutboundFolder] [bit] NULL,
	[CopyToOutboundInterfaceID] [int] NULL,
	[Type] [nvarchar](100) NULL,
	[Direction] [nvarchar](100) NULL,
	[FTPDropDir] [nvarchar](500) NULL,
	[FTPProcessedDir] [nvarchar](500) NULL,
 CONSTRAINT [PK_WB_Interface_1] PRIMARY KEY CLUSTERED 
(
	[InterfaceCode] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
