USE [SPIF]
GO

/****** Object:  Table [SPIF_team].[MB_TBL_SW_UNITS_APJ]    Script Date: 7/12/2026 5:09:20 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [SPIF_team].[MB_TBL_SW_UNITS_APJ](
	[SR_BADGE] [float] NOT NULL,
	[Sales_BU_ID] [nvarchar](20) NULL,
	[QUARTER_ID] [nvarchar](20) NULL,
	[VENDOR_NAME] [nvarchar](20) NULL,
	[CSPG_ITM_QTY] [nvarchar](20) NOT NULL,
	[ORDER_NUMBER] [nvarchar](50) NOT NULL,
	[MONTH] [nvarchar](50) NOT NULL,
	[WEEK] [nvarchar](50) NOT NULL,
	[CSPG_ITM_NBR] [nvarchar](50) NOT NULL,
	[CSPG_ITM_DESC] [nvarchar](150) NOT NULL,
	[DATE] [nvarchar](50) NOT NULL,
	[UPDATE_COMMENT] [nvarchar](255) NULL,
	[CREATE_DATE] [datetime] NULL,
	[CREATED_BY] [sysname] NOT NULL,
	[UPDATE_DATE] [datetime] NULL,
	[UPDATED_BY] [sysname] NOT NULL
) ON [PRIMARY]
GO

ALTER TABLE [SPIF_team].[MB_TBL_SW_UNITS_APJ] ADD  DEFAULT ('NO COMMENT') FOR [UPDATE_COMMENT]
GO

ALTER TABLE [SPIF_team].[MB_TBL_SW_UNITS_APJ] ADD  DEFAULT (getdate()) FOR [CREATE_DATE]
GO

ALTER TABLE [SPIF_team].[MB_TBL_SW_UNITS_APJ] ADD  DEFAULT (suser_sname()) FOR [CREATED_BY]
GO

ALTER TABLE [SPIF_team].[MB_TBL_SW_UNITS_APJ] ADD  DEFAULT (getdate()) FOR [UPDATE_DATE]
GO

ALTER TABLE [SPIF_team].[MB_TBL_SW_UNITS_APJ] ADD  DEFAULT (suser_sname()) FOR [UPDATED_BY]
GO


