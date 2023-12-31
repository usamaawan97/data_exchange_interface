/****** Object:  Table [dbo].[DEX_Interface_Document]    Script Date: 10/27/2022 8:36:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DEX_Interface_Document](
	[MessageID] [int] IDENTITY(1,1) NOT NULL,
	[SiteCode] [nvarchar](100) NULL,
	[Direction] [nvarchar](100) NULL,
	[MessageDate] [date] NULL,
	[MessageType] [nvarchar](1000) NULL,
	[CreatedOn] [datetime] NULL,
	[Exported] [bit] NULL,
	[ExportedOn] [datetime] NULL,
	[LastUpdatedOn] [datetime] NULL,
	[FileData] [xml] NULL,
	[FileDataCsv] [varchar](max) NULL,
	[FileName] [nvarchar](max) NULL,
	[BCMessageID] [nvarchar](400) NULL,
	[ConfirmationSentToBC] [bit] NULL,
	[ConfirmationSentOn] [datetime] NULL,
	[InterfaceCode] [nvarchar](1000) NULL,
 CONSTRAINT [PK_WB_Inbound_BC_Document] PRIMARY KEY CLUSTERED 
(
	[MessageID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
