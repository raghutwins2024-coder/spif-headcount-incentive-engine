USE [SPIF]
GO

/****** Object:  Table [SPIF_team].[MB_TBL_BUDGET_APJ_AR]    Script Date: 7/12/2026 6:43:01 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [SPIF_team].[MB_TBL_BUDGET_APJ_AR](
	[QUARTER_ID] [nvarchar](20) NULL,
	[RPT_QUEUE] [nvarchar](20) NULL,
	[VENDOR_NAME] [nvarchar](20) NULL,
	[BUDGET] [float] NULL,
	[Submission_Code] [varchar](500) NULL
) ON [PRIMARY]
GO


