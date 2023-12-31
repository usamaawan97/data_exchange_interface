/****** Object:  Table [dbo].[DEX_Interface_Files]    Script Date: 10/27/2022 8:36:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DEX_Interface_Files](
	[FileID] [bigint] IDENTITY(1,1) NOT NULL,
	[FileName] [nvarchar](max) NULL,
	[IsDownloaded] [bit] NULL,
	[IsProcessed] [bit] NULL,
	[DownloadedOn] [datetime] NULL,
	[ProcessedOn] [datetime] NULL,
 CONSTRAINT [PK_DEX_WC_Interface_Files] PRIMARY KEY CLUSTERED 
(
	[FileID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
