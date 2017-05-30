/****** Object:  Table [dbo].[tbl_Tables]    Script Date: 05/07/2017 20:29:37 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[tbl_Tables](
	[CompanyCode] [nvarchar](4) NOT NULL,
	[TableCode] [nvarchar](6) NOT NULL,
	[TableNameAr] [nvarchar](255) NULL,
	[TableNameEn] [nvarchar](255) NULL,
	[CreateDate] [datetime] NULL,
	[LastUpdateDate] [datetime] NULL,
 CONSTRAINT [PK_tbl_Tables] PRIMARY KEY CLUSTERED 
(
	[CompanyCode] ASC,
	[TableCode] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

/****** Object:  Table [dbo].[sa_POS_TrxItemSpecification]    Script Date: 05/07/2017 20:30:15 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[sa_POS_TrxItemSpecification](
	[CompanyCode] [nvarchar](4) NOT NULL,
	[BranchCode] [nvarchar](4) NOT NULL,
	[TrxNo] [nvarchar](8) NOT NULL,
	[TrxType] [nvarchar](4) NOT NULL,
	[YearID] [nvarchar](4) NOT NULL,
	[PeriodID] [nvarchar](2) NOT NULL,
	[TrxLineNo] [decimal](18, 0) NOT NULL,
	[ItemCode] [nvarchar](25) NULL,
	[DetailsItemCode] [nvarchar](25) NULL,
	[ItemService] [nvarchar](3) NULL,
	[Quantity] [decimal](18, 4) NULL,
	[CostPrice] [decimal](18, 4) NULL,
	[ItemUnitCode] [nvarchar](6) NULL,
	[UnitTransValue] [decimal](18, 4) NULL,
 CONSTRAINT [PK_sa_POS_TrxItemSpecification] PRIMARY KEY CLUSTERED 
(
	[CompanyCode] ASC,
	[BranchCode] ASC,
	[TrxNo] ASC,
	[TrxType] ASC,
	[YearID] ASC,
	[PeriodID] ASC,
	[TrxLineNo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[sa_POS_TrxItemSpecification]  WITH CHECK ADD  CONSTRAINT [FK_sa_POS_TrxItemSpecification_sa_POS_TrxHeader] FOREIGN KEY([CompanyCode], [BranchCode], [TrxNo], [TrxType], [YearID], [PeriodID])
REFERENCES [dbo].[sa_POS_TrxHeader] ([CompanyCode], [BranchCode], [TrxNo], [TrxType], [YearID], [PeriodID])
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[sa_POS_TrxItemSpecification] CHECK CONSTRAINT [FK_sa_POS_TrxItemSpecification_sa_POS_TrxHeader]
GO

ALTER TABLE [dbo].[sa_POS_TrxHeader] ADD
	[InvoiceType] [nvarchar](1) NULL,
	[TableCode] [nvarchar](6) NULL
GO

INSERT INTO [dbo].[tbl_DefaultSetting]
           ([CompanyCode]
           ,[SettingDescription]
           ,[SettingValue])
VALUES
           ('0001'
           ,'InvoiceType'
           ,'H')
GO


INSERT INTO [dbo].[tbl_DefaultSetting]
           ([CompanyCode]
           ,[SettingDescription]
           ,[SettingValue])
VALUES
           ('0001'
           ,'CountOfInvPrint'
           ,'1')
GO

ALTER TABLE [dbo].[tbl_PrTrxDetails] ADD
	[DiffQty] [decimal](18, 4) NULL
GO




