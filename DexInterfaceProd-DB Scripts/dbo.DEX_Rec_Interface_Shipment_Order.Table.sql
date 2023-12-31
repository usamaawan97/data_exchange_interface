/****** Object:  Table [dbo].[DEX_Rec_Interface_Shipment_Order]    Script Date: 10/27/2022 8:36:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DEX_Rec_Interface_Shipment_Order](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[MessageID] [int] NULL,
	[SiteCode] [nvarchar](50) NULL,
	[Order_Number] [nvarchar](50) NULL,
 CONSTRAINT [PK_DEX_Rec_Interface_Shipment_Order] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
