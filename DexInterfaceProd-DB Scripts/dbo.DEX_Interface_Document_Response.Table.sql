/****** Object:  Table [dbo].[DEX_Interface_Document_Response]    Script Date: 10/27/2022 8:36:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DEX_Interface_Document_Response](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[MessageID] [int] NULL,
	[BCMessageID] [int] NULL,
 CONSTRAINT [PK_BC_Inbound_Documents_Response] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
