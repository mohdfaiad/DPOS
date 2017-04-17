EXEC sp_RENAME 'tbl_Cutomers.CustomerGroupNameAr', 'CustomerNameAr', 'COLUMN'
GO
EXEC sp_RENAME 'tbl_Cutomers.CustomerGroupNameEn', 'CustomerNameEn', 'COLUMN'
GO


CREATE TABLE [dbo].[tbl_PrTrxPayment](
	[CompanyCode] [nvarchar](4) NOT NULL,
	[BranchCode] [nvarchar](4) NOT NULL,
	[TrxNo] [nvarchar](10) NOT NULL,
	[TrxType] [nvarchar](4) NOT NULL,
	[TrxLineNo] [nvarchar](10) NOT NULL,
	[PaymentType] [nvarchar](4) NULL,
	[Amount] [decimal](18, 4) NULL,
	[Balance] [decimal](18, 4) NULL,
	[TrxPaymentDescAr] [nvarchar](75) NULL,
	[TrxPaymentDescEn] [nvarchar](75) NULL,
	[VendoreCode] [nvarchar](6) NULL,
 CONSTRAINT [PK_tbl_PrTrxPayment] PRIMARY KEY CLUSTERED 
(
	[CompanyCode] ASC,
	[BranchCode] ASC,
	[TrxNo] ASC,
	[TrxType] ASC,
	[TrxLineNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
----------------------------------------

CREATE TABLE [dbo].[tbl_PrTrxHeader](
	[CompanyCode] [nvarchar](4) NOT NULL,
	[BranchCode] [nvarchar](4) NOT NULL,
	[TrxDate] [datetime] NOT NULL,
	[TrxNo] [nvarchar](10) NOT NULL,
	[TrxStatus] [char](1) NOT NULL,
	[TrxType] [nvarchar](4) NOT NULL,
	[WareHouseCode] [nvarchar](6) NULL,
	[VendoreCode] [nvarchar](6) NULL,
	[TrxAmount] [decimal](18, 4) NULL,
	[TrxBalance] [decimal](18, 4) NULL,
	[IntRefrence] [nvarchar](20) NULL,
	[TotalDiscount] [nvarchar](20) NULL,
	[VendoreInvoiceNumber] [nvarchar](20) NULL,
	[CreateDate] [datetime] NULL,
	[LastUpdateDate] [datetime] NULL,
	[CreateBy] [nvarchar](75) NULL,
	[TrxDescAr] [nvarchar](75) NULL,
	[TrxDescEn] [nvarchar](75) NULL,
 CONSTRAINT [PK_PrTrxHeader] PRIMARY KEY CLUSTERED 
(
	[CompanyCode] ASC,
	[BranchCode] ASC,
	[TrxNo] ASC,
	[TrxType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[tbl_PrTrxHeader]  WITH CHECK ADD  CONSTRAINT [FK_PrTrxHeader_PrTrxHeader] FOREIGN KEY([CompanyCode], [WareHouseCode])
REFERENCES [dbo].[tbl_WareHouse] ([CompanyCode], [WareHouseCode])
GO

ALTER TABLE [dbo].[tbl_PrTrxHeader] CHECK CONSTRAINT [FK_PrTrxHeader_PrTrxHeader]
GO

ALTER TABLE [dbo].[tbl_PrTrxHeader]  WITH CHECK ADD  CONSTRAINT [FK_PrTrxHeader_tbl_Users] FOREIGN KEY([CreateBy])
REFERENCES [dbo].[tbl_Users] ([UserID])
GO

ALTER TABLE [dbo].[tbl_PrTrxHeader] CHECK CONSTRAINT [FK_PrTrxHeader_tbl_Users]
GO

ALTER TABLE [dbo].[tbl_PrTrxHeader]  WITH CHECK ADD  CONSTRAINT [FK_PrTrxHeader_tbl_Vendors] FOREIGN KEY([CompanyCode], [VendoreCode])
REFERENCES [dbo].[tbl_Vendors] ([CompanyCode], [VendoreCode])
GO

ALTER TABLE [dbo].[tbl_PrTrxHeader] CHECK CONSTRAINT [FK_PrTrxHeader_tbl_Vendors]
GO

---------------------------------------------------------------
CREATE TABLE [dbo].[tbl_PrTrxDetails](
	[CompanyCode] [nvarchar](4) NOT NULL,
	[BranchCode] [nvarchar](4) NOT NULL,
	[TrxNo] [nvarchar](10) NOT NULL,
	[TrxType] [nvarchar](4) NOT NULL,
	[TraLineNo] [nvarchar](10) NOT NULL,
	[ItemService] [nvarchar](4) NULL,
	[ItemCode] [nvarchar](25) NULL,
	[ItemUnit] [nvarchar](4) NULL,
	[CostPrice] [decimal](18, 4) NULL,
	[Discount] [decimal](18, 4) NULL,
	[NetPrice] [decimal](18, 4) NULL,
	[UnitTransValue] [decimal](18, 4) NULL,
	[Quantity] [decimal](18, 4) NULL,
	[BarCode] [nvarchar](10) NULL,
	[WareHouseCode] [nvarchar](6) NULL,
	[ItemCost] [decimal](18, 4) NULL,
	[VendoreCode] [nvarchar](6) NULL,
	[CreateDate] [datetime] NULL,
	[LastUpdateDAte] [datetime] NULL,
	[CreateBy] [nvarchar](76) NULL,
 CONSTRAINT [PK_PrTrxDetails] PRIMARY KEY CLUSTERED 
(
	[CompanyCode] ASC,
	[BranchCode] ASC,
	[TrxNo] ASC,
	[TrxType] ASC,
	[TraLineNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[tbl_PrTrxDetails]  WITH CHECK ADD  CONSTRAINT [FK_PrTrxDetails_PrTrxDetails] FOREIGN KEY([CompanyCode], [BranchCode], [TrxNo], [TrxType], [TraLineNo])
REFERENCES [dbo].[tbl_PrTrxDetails] ([CompanyCode], [BranchCode], [TrxNo], [TrxType], [TraLineNo])
GO

ALTER TABLE [dbo].[tbl_PrTrxDetails] CHECK CONSTRAINT [FK_PrTrxDetails_PrTrxDetails]
GO

-------------------------------------
CREATE TABLE [dbo].[tbl_ItemSpecification](
	[CompanyCode] [nvarchar](4) NOT NULL,
	[ItemCode] [nvarchar](25) NOT NULL,
	[ItemService] [nchar](3) NOT NULL,
	[DetailItemCode] [nvarchar](25) NOT NULL,
	[DetailItemUnit] [nvarchar](6) NULL,
	[ItemQuantity] [decimal](18, 4) NULL,
	[UnitTransValue] [decimal](18, 4) NULL,
 CONSTRAINT [PK_tbl_ItemSpecification] PRIMARY KEY CLUSTERED 
(
	[CompanyCode] ASC,
	[ItemCode] ASC,
	[ItemService] ASC,
	[DetailItemCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[tbl_ItemSpecification]  WITH CHECK ADD  CONSTRAINT [FK_tbl_ItemSpecification_tbl_ItemSpecification] FOREIGN KEY([CompanyCode], [ItemCode], [ItemService], [DetailItemCode])
REFERENCES [dbo].[tbl_ItemSpecification] ([CompanyCode], [ItemCode], [ItemService], [DetailItemCode])
GO

ALTER TABLE [dbo].[tbl_ItemSpecification] CHECK CONSTRAINT [FK_tbl_ItemSpecification_tbl_ItemSpecification]
GO


---------------------------------------------------------------------------------------
