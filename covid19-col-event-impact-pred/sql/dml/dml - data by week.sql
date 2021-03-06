USE [AC_C19_DATA]
GO

SELECT [department], [date], SUM([value]) AS [value]
  FROM [dbo].[events_data]
 WHERE [event] = 'TB'
   AND [department] NOT IN ('EXTERIOR', 'PROCEDENCIA DESCONOCIDA')
   AND [department] = 'AMAZONAS'
 GROUP BY [department], [date]
 ORDER BY [date], [department]
GO

WITH cte_data AS (
	SELECT [department], [week], SUM([value]) AS [value]
	  FROM [dbo].[events_data]
	 WHERE [event] = 'TB'
	   AND [year] IN (2017, 2018, 2019)
	   AND [department] NOT IN ('EXTERIOR', 'PROCEDENCIA DESCONOCIDA')
	 GROUP BY [department], [week]
)
SELECT [Department],[1],[2],[3],[4],[5],[6],[7],[8],[9],[10],[11],[12],[13],[14],[15],[16],[17],[18],[19],[20],[21],[22],[23],[24],[25],[26],[27],[28],[29],[30],[31],[32],[33],[34],[35],[36],[37],[38],[39],[40],[41],[42],[43],[44],[45],[46],[47],[48],[49],[50],[51],[52]
  FROM cte_data AS a
 PIVOT (SUM([value]) FOR [week] IN ([1],[2],[3],[4],[5],[6],[7],[8],[9],[10],[11],[12],[13],[14],[15],[16],[17],[18],[19],[20],[21],[22],[23],[24],[25],[26],[27],[28],[29],[30],[31],[32],[33],[34],[35],[36],[37],[38],[39],[40],[41],[42],[43],[44],[45],[46],[47],[48],[49],[50],[51],[52])) AS b
 ORDER BY [department];
GO
