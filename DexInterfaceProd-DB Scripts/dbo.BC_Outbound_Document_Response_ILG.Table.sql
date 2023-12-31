/****** Object:  Table [dbo].[BC_Outbound_Document_Response_ILG]    Script Date: 10/27/2022 8:36:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BC_Outbound_Document_Response_ILG](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[BCMessageID] [int] NULL,
	[MessageType] [nvarchar](1000) NULL,
	[Direction] [nvarchar](1000) NULL,
	[PayLoad] [nvarchar](max) NULL,
	[SiteCode] [nvarchar](1000) NULL,
 CONSTRAINT [PK_BC_Outbound_Document_ILG] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
