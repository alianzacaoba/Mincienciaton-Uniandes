USE [AC_C19_DATA]
GO

SELECT [department], SUM([value]) AS [total]
  FROM [dbo].[events_data]
 WHERE [event] = 'IM'
   AND [year] >= 2017
 GROUP BY [department]
 ORDER BY [department];
GO

SELECT [capital], SUM([value]) AS [total]
  FROM [dbo].[events_data_by_capital]
 WHERE [event] = 'IM'
   AND [year] >= 2017
 GROUP BY [capital]
 ORDER BY [capital];
GO