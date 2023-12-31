/****** Object:  Table [dbo].[DEX_Rec_Interface_Document]    Script Date: 10/27/2022 8:36:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DEX_Rec_Interface_Document](
	[MessageID] [int] IDENTITY(1,1) NOT NULL,
	[SiteCode] [nvarchar](10) NULL,
	[Direction] [nvarchar](10) NULL,
	[MessageType] [nvarchar](100) NULL,
	[CreatedOn] [datetime] NULL,
	[Order_Date] [datetime2](7) NULL,
	[Order_Status] [nvarchar](100) NULL,
	[Order_Number] [nvarchar](100) NULL,
	[FileName] [nvarchar](80) NULL,
	[InterfaceCode] [nvarchar](40) NULL,
	[FileData] [xml] NULL,
 CONSTRAINT [PK_DEX_Rec_Interface_Document_1] PRIMARY KEY CLUSTERED 
(
	[MessageID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
