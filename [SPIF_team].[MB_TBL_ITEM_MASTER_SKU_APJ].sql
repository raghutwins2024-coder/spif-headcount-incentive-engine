USE [SPIF]
GO

/****** Object:  Table [SPIF_team].[MB_TBL_ITEM_MASTER_SKU_APJ]    Script Date: 7/12/2026 4:48:13 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [SPIF_team].[MB_TBL_ITEM_MASTER_SKU_APJ](
	[PERIOD_ID] [float] NULL,
	[QTD_ID] [nvarchar](7) NULL,
	[MONTH_ID] [nvarchar](7) NULL,
	[ITEM_NUM] [nvarchar](20) NULL,
	[ITEM_CATEGORY] [nvarchar](20) NULL,
	[ITEM_SUB_CAT] [nvarchar](255) NULL,
	[ITEM_DESC] [nvarchar](255) NULL,
	[ITEM_PAY] [float] NULL,
	[RPT_QUEUE] [nvarchar](255) NULL,
	[RPT_ROLE] [nvarchar](255) NULL,
	[START_DT] [datetime] NULL,
	[END_DT] [datetime] NULL,
	[ACTIVE_FLAG] [nvarchar](5) NULL,
	[LIST_PRICE] [float] NULL,
	[ITEM_TYPE] [nvarchar](100) NULL,
	[EXTRA_NOTES] [nvarchar](255) NULL,
	[UPDATE_COMMENT] [nvarchar](255) NULL,
	[CREATE_DATE] [datetime] NULL,
	[CREATED_BY] [sysname] NOT NULL,
	[UPDATE_DATE] [datetime] NULL,
	[UPDATED_BY] [sysname] NOT NULL,
	[Model] [varchar](50) NULL
) ON [PRIMARY]
GO

ALTER TABLE [SPIF_team].[MB_TBL_ITEM_MASTER_SKU_APJ] ADD  DEFAULT ('NO COMMENT') FOR [UPDATE_COMMENT]
GO

ALTER TABLE [SPIF_team].[MB_TBL_ITEM_MASTER_SKU_APJ] ADD  DEFAULT (getdate()) FOR [CREATE_DATE]
GO

ALTER TABLE [SPIF_team].[MB_TBL_ITEM_MASTER_SKU_APJ] ADD  DEFAULT (suser_sname()) FOR [CREATED_BY]
GO

ALTER TABLE [SPIF_team].[MB_TBL_ITEM_MASTER_SKU_APJ] ADD  DEFAULT (getdate()) FOR [UPDATE_DATE]
GO

ALTER TABLE [SPIF_team].[MB_TBL_ITEM_MASTER_SKU_APJ] ADD  DEFAULT (suser_sname()) FOR [UPDATED_BY]
GO


