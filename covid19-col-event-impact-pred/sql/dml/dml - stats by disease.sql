USE [AC_C19_DATA]
GO

SELECT [year], SUM([value]) AS [cases]
  FROM [dbo].[events_data]
 WHERE [event] = 'TB'
 GROUP BY [year]
 ORDER BY [year];
GO

SELECT [sub_event], SUM([value]) AS [cases]
  FROM [dbo].[events_data]
 WHERE [event] = 'TB'
 GROUP BY [sub_event]
 ORDER BY [sub_event];
GO

SELECT [year], [sub_event], SUM([value]) AS [cases]
  FROM [dbo].[events_data]
 WHERE [event] = 'TB'
 GROUP BY [year], [sub_event]
 ORDER BY [year], [sub_event];
GO
