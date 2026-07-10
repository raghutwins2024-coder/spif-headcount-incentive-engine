USE [SPIF]
GO

/****** Object:  Table [SPIF_team].[MB_TBL_ORG_HC_APJ_IND]    Script Date: 6/5/2026 9:00:51 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [SPIF_team].[MB_TBL_ORG_HC_APJ_IND](
	[PERIOD_ID] [float] NOT NULL,
	[QUARTER_ID] [nvarchar](20) NULL,
	[RPT_QUEUE] [nvarchar](100) NULL,
	[SR_BADGE] [float] NOT NULL,
	[SR_NAME] [nvarchar](150) NULL,
	[RPT_ROLE] [nvarchar](150) NULL,
	[MGR_BADGE] [float] NULL,
	[MGR_NAME] [nvarchar](150) NULL,
	[COACH_BADGE] [float] NULL,
	[COACH_NAME] [nvarchar](150) NULL,
	[LOR_BADGE] [float] NULL,
	[LOR_NAME] [nvarchar](150) NULL,
	[RSM_BADGE] [float] NULL,
	[RSM_NAME] [nvarchar](150) NULL,
	[TEAM_LEAD_BADGE] [float] NULL,
	[TEAM_LEAD_NAME] [nvarchar](150) NULL,
	[EXTRA_COMMENT] [nvarchar](255) NULL,
	[CREATE_DATE] [datetime] NULL,
	[CREATED_BY] [sysname] NOT NULL,
	[UPDATE_DATE] [datetime] NULL,
	[UPDATED_BY] [sysname] NOT NULL,
	[DIR_BADGE] [float] NULL,
	[DIR_NAME] [nvarchar](200) NULL
) ON [PRIMARY]
GO

ALTER TABLE [SPIF_team].[MB_TBL_ORG_HC_APJ_IND] ADD  DEFAULT (getdate()) FOR [CREATE_DATE]
GO

ALTER TABLE [SPIF_team].[MB_TBL_ORG_HC_APJ_IND] ADD  DEFAULT (suser_sname()) FOR [CREATED_BY]
GO

ALTER TABLE [SPIF_team].[MB_TBL_ORG_HC_APJ_IND] ADD  DEFAULT (getdate()) FOR [UPDATE_DATE]
GO

ALTER TABLE [SPIF_team].[MB_TBL_ORG_HC_APJ_IND] ADD  DEFAULT (suser_sname()) FOR [UPDATED_BY]
GO


