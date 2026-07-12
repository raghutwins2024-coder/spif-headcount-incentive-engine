USE [SPIF]
GO

/****** Object:  View [SPIF_team].[VW_APJ_SW_UNITS_PAYOUT_TOTAL_AR]    Script Date: 7/12/2026 5:25:36 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [SPIF_team].[VW_APJ_SW_UNITS_PAYOUT_TOTAL_AR] AS
SELECT [QUARTER_ID]
      ,[RPT_QUEUE]
	  ,[SR_BADGE]
      ,[SR_NAME]
      ,[RPT_ROLE]
      --,[MGR_BADGE]
      --,[MGR_NAME]
      --,[RSM_BADGE]
      --,[RSM_NAME]
	-- ,[DIR_BADGE]
    --  ,[DIR_NAME]
      ,[VENDOR_NAME]
	  ,System_qty
	  , round(sum(cast([Item_qty] as float))/ NULLIF(System_qty,0),3,1) AS SW_AR
      ,sum(cast([Item_qty] as float)) as [Item_qty]
      ,sum(cast([Payout] as float)) as [Payout]
	  --,[Period_id]
  FROM [SPIF_team].[VW_APJ_SW_UNITS_PAYOUT]
  GROUP BY [QUARTER_ID]
      ,[RPT_QUEUE]
	   ,[SR_BADGE]
      ,[SR_NAME]
      ,[RPT_ROLE]
      --,[MGR_BADGE]
      --,[MGR_NAME]
      --,[RSM_BADGE]
      --,[RSM_NAME]
     -- ,[DIR_BADGE]
      --,[DIR_NAME]
      ,[VENDOR_NAME]
	  ,System_qty
	  ;
GO


