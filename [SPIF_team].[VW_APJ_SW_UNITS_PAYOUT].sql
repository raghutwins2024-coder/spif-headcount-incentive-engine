USE [SPIF]
GO

/****** Object:  View [SPIF_team].[VW_APJ_SW_UNITS_PAYOUT]    Script Date: 7/12/2026 6:40:07 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE VIEW [SPIF_team].[VW_APJ_SW_UNITS_PAYOUT] AS
SELECT ORG.[QUARTER_ID]
      ,ORG.[RPT_QUEUE]
      ,ORG.[SR_BADGE]
      ,ORG.[SR_NAME]
      ,ORG.[RPT_ROLE]
      ,ORG.[MGR_BADGE]
      ,ORG.[MGR_NAME]
      ,ORG.[RSM_BADGE]
      ,ORG.[RSM_NAME]
      ,ORG.[DIR_BADGE] 
      ,ORG.[DIR_NAME]  
      ,Units.ORDER_NUMBER
      ,Units.DATE AS Order_date
      ,Units.WEEK
      ,Units.CSPG_ITM_NBR AS Sku
      ,Units.CSPG_ITM_DESC AS Sku_desc
      ,Units.VENDOR_NAME
      ,CASE Units.VENDOR_NAME
            WHEN 'Microsoft' THEN MS_System_qty
            ELSE System_qty
       END AS System_qty
      ,Units.CSPG_ITM_QTY AS Item_qty
      ,SKU.ITEM_PAY
      ,Units.CSPG_ITM_QTY * SKU.ITEM_PAY AS Payout
FROM [SPIF_team].[VW_APJ_MB_TBL_ORG] ORG
JOIN [SPIF_TEAM].[MB_TBL_SW_UNITS_APJ] Units
     ON Units.QUARTER_ID = ORG.QUARTER_ID
    AND Units.SR_BADGE   = ORG.IC_BADGE   
	   	      AND NOT (
    Units.VENDOR_NAME = 'Microsoft'
    AND (
         CAST(Units.DATE AS DATE) < '2026-05-15'
         OR CAST(Units.DATE AS DATE) > '2026-06-30'
        )
)
JOIN
[SPIF_team].[MB_TBL_ITEM_MASTER_SKU_APJ] SKU
     ON SKU.QTD_ID    = Units.QUARTER_ID
    AND SKU.ITEM_NUM  = Units.CSPG_ITM_NBR
    AND SKU.RPT_QUEUE = ORG.RPT_QUEUE;
GO


