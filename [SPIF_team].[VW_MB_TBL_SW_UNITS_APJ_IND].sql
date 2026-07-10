USE [SPIF]
GO

/****** Object:  View [SPIF_team].[VW_MB_TBL_SW_UNITS_APJ_IND]    Script Date: 6/4/2026 6:36:35 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [SPIF_team].[VW_MB_TBL_SW_UNITS_APJ_IND] AS
SELECT SR_BADGE,
       VENDOR_NAME,
       SUM(CSPG_ITM_QTY) AS CSPG_ITM_QTY,
       SUM(PAYOUT) AS PAYOUT,
       QUARTER_ID
FROM
(
    SELECT Units.SR_BADGE,
           Units.VENDOR_NAME,
           CONVERT(INT, Units.CSPG_ITM_QTY) AS CSPG_ITM_QTY,
           Units.QUARTER_ID,
           CASE 
               WHEN Units.VENDOR_NAME = 'Microsoft' 
                    AND CONVERT(INT, Units.CSPG_ITM_QTY) >= 20 
               THEN CONVERT(INT, Units.CSPG_ITM_QTY) * SKU.ITEM_PAY

               WHEN Units.VENDOR_NAME <> 'Microsoft' 
                    AND CONVERT(INT, Units.CSPG_ITM_QTY) > 40 
               THEN CONVERT(INT, Units.CSPG_ITM_QTY) * SKU.ITEM_PAY
               ELSE 0 
           END AS PAYOUT
    FROM SPIF_team.MB_TBL_SW_UNITS_APJ_IND Units
    INNER JOIN SPIF_team.MB_TBL_ITEM_MASTER_SKU_APJ_IND SKU
        ON SKU.QTD_ID = Units.QUARTER_ID 
       AND SKU.ITEM_NUM = Units.CSPG_ITM_NBR
    INNER JOIN SPIF_team.MB_TBL_ORG_HC_APJ_IND ORG
        ON ORG.RPT_QUEUE = SKU.RPT_QUEUE 
       AND ORG.SR_BADGE = Units.SR_BADGE
    WHERE SKU.ACTIVE_FLAG = 'Y'
      AND Units.VENDOR_NAME IN ('McAfee', 'Foxit', 'Cyberlink', 'Microsoft', 'Adobe')
) UNIT
GROUP BY SR_BADGE, VENDOR_NAME, QUARTER_ID;
GO


