USE [SPIF]
GO

/****** Object:  View [SPIF_team].[VW_APJ_MB_TBL_ORG]    Script Date: 7/12/2026 6:47:12 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




 CREATE VIEW  [SPIF_team].[VW_APJ_MB_TBL_ORG] AS
SELECT QUARTER_ID,
       RPT_QUEUE,
       SR_BADGE SR_BADGE,
       SR_NAME SR_NAME,
       'ISR' RPT_ROLE,
       MGR_BADGE,
       MGR_NAME,
       RSM_BADGE,
       RSM_NAME,
       DIR_BADGE,
       DIR_NAME,
       SR_BADGE IC_BADGE,
       (SELECT SUM(CSPG_CLNT_QTY)
        FROM [SPIF_team].[MB_TBL_CLNT_UNITS_APJ]
        WHERE SR_BADGE IN (
              SELECT SR_BADGE
              FROM [SPIF_team].[MB_TBL_ORG_HC_APJ]
              WHERE SR_BADGE = ORG.SR_BADGE
                AND RPT_QUEUE = ORG.RPT_QUEUE)) AS System_qty,
       (SELECT SUM(CSPG_CLNT_QTY)
        FROM [SPIF_team].[MB_TBL_CLNT_UNITS_APJ]
        WHERE SR_BADGE IN (
              SELECT SR_BADGE
              FROM [SPIF_team].[MB_TBL_ORG_HC_APJ]
              WHERE SR_BADGE = ORG.SR_BADGE
                AND RPT_QUEUE = ORG.RPT_QUEUE)
          AND week BETWEEN '2027-W15' AND '2027-W22') AS MS_System_qty
FROM [SPIF_team].[MB_TBL_ORG_HC_APJ] ORG

UNION

SELECT QUARTER_ID,
       RPT_QUEUE,
       MGR_BADGE SR_BADGE,
       MGR_NAME SR_NAME,
       'MGR' RPT_ROLE,
       MGR_BADGE,
       MGR_NAME,
       RSM_BADGE,
       RSM_NAME,
       DIR_BADGE,
       DIR_NAME,
       SR_BADGE IC_BADGE,
       (SELECT SUM(CSPG_CLNT_QTY)
        FROM [SPIF_team].[MB_TBL_CLNT_UNITS_APJ]
        WHERE SR_BADGE IN (
              SELECT SR_BADGE
              FROM [SPIF_team].[MB_TBL_ORG_HC_APJ]
              WHERE MGR_BADGE = ORG.MGR_BADGE
                AND RPT_QUEUE = ORG.RPT_QUEUE)) AS System_qty,
       (SELECT SUM(CSPG_CLNT_QTY)
        FROM [SPIF_team].[MB_TBL_CLNT_UNITS_APJ]
        WHERE SR_BADGE IN (
              SELECT SR_BADGE
              FROM [SPIF_team].[MB_TBL_ORG_HC_APJ]
              WHERE MGR_BADGE = ORG.MGR_BADGE
                AND RPT_QUEUE = ORG.RPT_QUEUE)
          AND week BETWEEN '2027-W15' AND '2027-W22') AS MS_System_qty
FROM [SPIF_team].[MB_TBL_ORG_HC_APJ] ORG
WHERE MGR_BADGE > 0

UNION

SELECT QUARTER_ID,
       RPT_QUEUE,
       RSM_BADGE SR_BADGE,
       RSM_NAME SR_NAME,
       'RSM' RPT_ROLE,
       '' MGR_BADGE,
       '' MGR_NAME,
       RSM_BADGE,
       RSM_NAME,
       DIR_BADGE,
       DIR_NAME,
       SR_BADGE IC_BADGE,
       (SELECT SUM(CSPG_CLNT_QTY)
        FROM [SPIF_team].[MB_TBL_CLNT_UNITS_APJ]
        WHERE SR_BADGE IN (
              SELECT SR_BADGE
              FROM [SPIF_team].[MB_TBL_ORG_HC_APJ]
              WHERE RSM_BADGE = ORG.RSM_BADGE
                AND RPT_QUEUE = ORG.RPT_QUEUE)) AS System_qty,
       (SELECT SUM(CSPG_CLNT_QTY)
        FROM [SPIF_team].[MB_TBL_CLNT_UNITS_APJ]
        WHERE SR_BADGE IN (
              SELECT SR_BADGE
              FROM [SPIF_team].[MB_TBL_ORG_HC_APJ]
              WHERE RSM_BADGE = ORG.RSM_BADGE
                AND RPT_QUEUE = ORG.RPT_QUEUE)
          AND week BETWEEN '2027-W15' AND '2027-W22') AS MS_System_qty
FROM [SPIF_team].[MB_TBL_ORG_HC_APJ] ORG
WHERE RSM_BADGE > 0

UNION

SELECT QUARTER_ID,
       RPT_QUEUE,
       DIR_BADGE SR_BADGE,
       DIR_NAME SR_NAME,
       'DIR' RPT_ROLE,
       '' MGR_BADGE,
       '' MGR_NAME,
       RSM_BADGE,
       RSM_NAME,
       DIR_BADGE,
       DIR_NAME,
       SR_BADGE IC_BADGE,
       (SELECT SUM(CSPG_CLNT_QTY)
        FROM [SPIF_team].[MB_TBL_CLNT_UNITS_APJ]
        WHERE SR_BADGE IN (
              SELECT SR_BADGE
              FROM [SPIF_team].[MB_TBL_ORG_HC_APJ]
              WHERE DIR_BADGE = ORG.DIR_BADGE
                AND RPT_QUEUE = ORG.RPT_QUEUE)) AS System_qty,
       (SELECT SUM(CSPG_CLNT_QTY)
        FROM [SPIF_team].[MB_TBL_CLNT_UNITS_APJ]
        WHERE SR_BADGE IN (
              SELECT SR_BADGE
              FROM [SPIF_team].[MB_TBL_ORG_HC_APJ]
              WHERE DIR_BADGE = ORG.DIR_BADGE
                AND RPT_QUEUE = ORG.RPT_QUEUE)
          AND week BETWEEN '2027-W15' AND '2027-W22') AS MS_System_qty
FROM [SPIF_team].[MB_TBL_ORG_HC_APJ] ORG
WHERE DIR_BADGE > 0;
GO


