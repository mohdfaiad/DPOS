

/****** Object:  Table [dbo].[tbl_CashBank]    Script Date: 04/13/2017 21:03:30 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[tbl_CashBank](
	[CompanyCode] [nvarchar](4) NOT NULL,
	[CB_Code] [nvarchar](4) NOT NULL,
	[CB_Type] [char](1) NOT NULL,
	[CB_NameA] [nvarchar](100) NULL,
	[CB_NameE] [nvarchar](100) NULL,
 CONSTRAINT [PK_tbl_CashBank] PRIMARY KEY CLUSTERED 
(
	[CompanyCode] ASC,
	[CB_Code] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


