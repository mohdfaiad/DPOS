

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



IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_tbl_Barcodes_tbl_ItemDefinition]') AND parent_object_id = OBJECT_ID(N'[dbo].[tbl_Barcodes]'))
ALTER TABLE [dbo].[tbl_Barcodes] DROP CONSTRAINT [FK_tbl_Barcodes_tbl_ItemDefinition]
GO


/****** Object:  Table [dbo].[tbl_Barcodes]    Script Date: 04/16/2017 20:33:25 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_Barcodes]') AND type in (N'U'))
DROP TABLE [dbo].[tbl_Barcodes]
GO


/****** Object:  Table [dbo].[tbl_Barcodes]    Script Date: 04/16/2017 20:33:25 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[tbl_Barcodes](
	[CompanyCode] [nvarchar](4) NOT NULL,
	[ItemCode] [nvarchar](25) NOT NULL,
	[ItemService] [nvarchar](3) NOT NULL,
	[Barcode] [nvarchar](30) NOT NULL,
	[Status] [nvarchar](1) NULL,
	[ItemUnit] [nvarchar](6) NULL,
	[UnitTransValue] [decimal](18, 4) NULL,
	[Price] [decimal](18, 4) NULL,
	[ItemColorCode] [nvarchar](6) NULL,
	[ItemSizeCode] [nvarchar](6) NULL,
	[DiscountRatio] [decimal](18, 4) NULL,
	[DiscountValue] [decimal](18, 4) NULL,
	[CreateDate] [datetime] NULL,
	[LastUpdateDate] [datetime] NULL,
 CONSTRAINT [PK_tbl_Barcodes] PRIMARY KEY CLUSTERED 
(
	[CompanyCode] ASC,
	[Barcode] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[tbl_Barcodes]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Barcodes_tbl_ItemDefinition] FOREIGN KEY([CompanyCode], [ItemCode], [ItemService])
REFERENCES [dbo].[tbl_ItemDefinition] ([CompanyCode], [ItemCode], [ItemService])
GO

ALTER TABLE [dbo].[tbl_Barcodes] CHECK CONSTRAINT [FK_tbl_Barcodes_tbl_ItemDefinition]
GO
SET ANSI_NULLS ON
GO



SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[tbl_PosClose](
	[CompanyCode] [nvarchar](4) NOT NULL,
	[BranchCode] [nvarchar](4) NOT NULL,
	[TrxNo] [nvarchar](8) NOT NULL,
	[TrxDate] [datetime] NULL,
	[TrxStatus] [char](1) NULL,
	[TrxDescA] [nvarchar](100) NULL,
	[TrxDescE] [nvarchar](100) NULL,
	[POSCode] [nvarchar](4) NULL,
	[CashCode] [nvarchar](4) NULL,
	[BankCode] [nvarchar](4) NULL,
	[Cash] [decimal](18, 4) NULL,
	[CreditCard] [decimal](18, 4) NULL,
	[ATM] [decimal](18, 4) NULL,
	[Credit] [decimal](18, 4) NULL,
	[Checks] [decimal](18, 4) NULL,
	[Discount] [decimal](18, 4) NULL,
	[POSShift] [char](1) NULL,
	[OperatorCode] [nvarchar](6) NULL,
	[ActualCash] [decimal](18, 4) NULL,
	[OldOpenBalance] [decimal](18, 4) NULL,
	[NewOpenBalance] [decimal](18, 4) NULL,
	[MainCashCode] [char](4) NULL,
 CONSTRAINT [PK_tbl_PosClose] PRIMARY KEY CLUSTERED 
(
	[CompanyCode] ASC,
	[BranchCode] ASC,
	[TrxNo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[tbl_PosClose]  WITH CHECK ADD  CONSTRAINT [FK_tbl_PosClose_tbl_CashBank] FOREIGN KEY([CompanyCode], [CashCode])
REFERENCES [dbo].[tbl_CashBank] ([CompanyCode], [CB_Code])
GO

ALTER TABLE [dbo].[tbl_PosClose] CHECK CONSTRAINT [FK_tbl_PosClose_tbl_CashBank]
GO

ALTER TABLE [dbo].[tbl_PosClose]  WITH CHECK ADD  CONSTRAINT [FK_tbl_PosClose_tbl_CashBank1] FOREIGN KEY([CompanyCode], [BankCode])
REFERENCES [dbo].[tbl_CashBank] ([CompanyCode], [CB_Code])
GO

ALTER TABLE [dbo].[tbl_PosClose] CHECK CONSTRAINT [FK_tbl_PosClose_tbl_CashBank1]
GO

ALTER TABLE [dbo].[tbl_PosClose]  WITH CHECK ADD  CONSTRAINT [FK_tbl_PosClose_tbl_POS_Definition] FOREIGN KEY([CompanyCode], [POSCode])
REFERENCES [dbo].[tbl_POS_Definition] ([CompanyCode], [POSCode])
GO

ALTER TABLE [dbo].[tbl_PosClose] CHECK CONSTRAINT [FK_tbl_PosClose_tbl_POS_Definition]
GO

ALTER TABLE [dbo].[tbl_PosClose]  WITH CHECK ADD  CONSTRAINT [FK_tbl_PosClose_tbl_PosClose] FOREIGN KEY([CompanyCode], [OperatorCode])
REFERENCES [dbo].[tbl_operators] ([CompanyCode], [OperatorCode])
GO

ALTER TABLE [dbo].[tbl_PosClose] CHECK CONSTRAINT [FK_tbl_PosClose_tbl_PosClose]
GO




/****** Object:  Table [dbo].[sa_POS_TrxHeader]    Script Date: 04/19/2017 23:24:31 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[sa_POS_TrxHeader](
	[CompanyCode] [nvarchar](4) NOT NULL,
	[BranchCode] [nvarchar](4) NOT NULL,
	[TrxNo] [nvarchar](8) NOT NULL,
	[TrxType] [nvarchar](4) NOT NULL,
	[YearID] [nvarchar](4) NOT NULL,
	[PeriodID] [nvarchar](2) NOT NULL,
	[TrxDate] [datetime] NULL,
	[TrxStatus] [char](1) NULL,
	[TrxDescA] [nvarchar](4000) NULL,
	[TrxDescE] [nvarchar](4000) NULL,
	[IntRefrence] [nvarchar](15) NULL,
	[TrxAmount] [decimal](18, 4) NULL,
	[TrxBalance] [decimal](18, 4) NULL,
	[TotalDiscount] [decimal](18, 4) NULL,
	[CustomerCode] [nvarchar](6) NULL,
	[WarehouseCode] [nvarchar](6) NULL,
	[SourceDocNo] [nvarchar](8) NULL,
	[SourceDocType] [nvarchar](4) NULL,
	[TrxTime] [datetime] NULL,
	[POSShift] [char](1) NULL,
	[POSCode] [char](4) NULL,
	[OperatorCode] [nvarchar](6) NULL,
	[SourceDocYearId] [nvarchar](4) NULL,
	[SourceDocPeriodId] [nvarchar](2) NULL,
	[CashCode] [nvarchar](4) NULL,
	[BankCode] [nvarchar](4) NULL,
	[Cash] [decimal](18, 4) NULL,
	[ATM] [decimal](18, 4) NULL,
	[Visa] [decimal](18, 4) NULL,
	[Checks] [decimal](18, 4) NULL,
	[Credit] [decimal](18, 4) NULL,
	[CreateDate] [datetime] NULL,
	[LastUpdateDate] [datetime] NULL,
	[PayedValue] [decimal](18, 4) NULL,
	[RemainderValue] [decimal](18, 4) NULL,
 CONSTRAINT [PK_sa_POS_TrxHeader] PRIMARY KEY CLUSTERED 
(
	[CompanyCode] ASC,
	[BranchCode] ASC,
	[TrxNo] ASC,
	[TrxType] ASC,
	[YearID] ASC,
	[PeriodID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[sa_POS_TrxHeader]  WITH CHECK ADD  CONSTRAINT [FK_sa_POS_TrxHeader_tbl_Company] FOREIGN KEY([CompanyCode])
REFERENCES [dbo].[tbl_Company] ([CompanyCode])
GO

ALTER TABLE [dbo].[sa_POS_TrxHeader] CHECK CONSTRAINT [FK_sa_POS_TrxHeader_tbl_Company]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[sa_POS_TrxDetails](
	[CompanyCode] [nvarchar](4) NOT NULL,
	[BranchCode] [nvarchar](4) NOT NULL,
	[TrxNo] [nvarchar](8) NOT NULL,
	[TrxType] [nvarchar](4) NOT NULL,
	[YearID] [nvarchar](4) NOT NULL,
	[PeriodID] [nvarchar](2) NOT NULL,
	[TrxLineNo] [decimal](18, 0) NOT NULL,
	[Barcode] [nvarchar](30) NULL,
	[ItemCode] [nvarchar](25) NULL,
	[ItemService] [nvarchar](3) NULL,
	[Quantity] [decimal](18, 4) NULL,
	[ItemPrice] [decimal](18, 4) NULL,
	[Discount] [decimal](18, 4) NULL,
	[DiscountRatio] [decimal](18, 4) NULL,
	[NetPrice] [decimal](18, 4) NULL,
	[CostPrice] [decimal](18, 4) NULL,
	[ItemUnitCode] [nvarchar](6) NULL,
	[UnitTransValue] [decimal](18, 4) NULL,
	[TrxDetailDescA] [nvarchar](4000) NULL,
	[TrxDetailDescE] [nvarchar](4000) NULL,
	[SourceDocLineNo] [decimal](18, 0) NULL,
 CONSTRAINT [PK_sa_POS_TrxDetails] PRIMARY KEY CLUSTERED 
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

ALTER TABLE [dbo].[sa_POS_TrxDetails]  WITH CHECK ADD  CONSTRAINT [FK_sa_POS_TrxDetails_sa_POS_TrxHeader] FOREIGN KEY([CompanyCode], [BranchCode], [TrxNo], [TrxType], [YearID], [PeriodID])
REFERENCES [dbo].[sa_POS_TrxHeader] ([CompanyCode], [BranchCode], [TrxNo], [TrxType], [YearID], [PeriodID])
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[sa_POS_TrxDetails] CHECK CONSTRAINT [FK_sa_POS_TrxDetails_sa_POS_TrxHeader]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_DefaultSetting](
	[CompanyCode] [nvarchar](4) NOT NULL,
	[SettingDescription] [nvarchar](100) NOT NULL,
	[SettingValue] [nvarchar](100) NULL,
 CONSTRAINT [PK_tbl_DefaultSetting] PRIMARY KEY CLUSTERED 
(
	[CompanyCode] ASC,
	[SettingDescription] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[tbl_DefaultSetting] ([CompanyCode], [SettingDescription], [SettingValue]) VALUES (N'0001', N'CustomerCode', N'')
GO
INSERT [dbo].[tbl_DefaultSetting] ([CompanyCode], [SettingDescription], [SettingValue]) VALUES (N'0001', N'MainCash', N'')
GO
INSERT [dbo].[tbl_DefaultSetting] ([CompanyCode], [SettingDescription], [SettingValue]) VALUES (N'0001', N'POSCode', N'')
GO
INSERT [dbo].[tbl_DefaultSetting] ([CompanyCode], [SettingDescription], [SettingValue]) VALUES (N'0001', N'WarehouseCode', N'')
GO
INSERT [dbo].[tbl_DefaultSetting] ([CompanyCode], [SettingDescription], [SettingValue]) VALUES (N'0001', N'WorkByTouch', N'')
GO
-------



