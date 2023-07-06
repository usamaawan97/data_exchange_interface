/****** Object:  Table [dbo].[DEX_Oauth_Access_Token]    Script Date: 10/27/2022 8:36:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DEX_Oauth_Access_Token](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[AccessToken] [nvarchar](max) NULL,
	[AccessTokenILG] [nvarchar](max) NULL,
	[AccessTokenEDI] [nvarchar](max) NULL,
 CONSTRAINT [PK_DEX_Oauth_Access_Token] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
