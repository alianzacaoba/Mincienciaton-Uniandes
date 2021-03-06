USE [AC_C19_DATA]
GO
SELECT dl.[department], dl.[population], dd.[value] AS [total_department], dl.[capital], cd.[value] AS [total_capital]
  FROM [dbo].[department_list] AS dl
  LEFT OUTER JOIN
       (SELECT [department], SUM([value]) AS [value]
		  FROM [dbo].[events_data]
		 WHERE [event] = 'SA'
		   AND [year] >= 2017
		 GROUP BY [department]) AS dd
	ON dl.[department] = dd.[department]
  LEFT OUTER JOIN
       (SELECT [capital], SUM([value]) AS [value]
		  FROM [dbo].[events_data_by_capital]
		 WHERE [event] = 'SA'
		   AND [year] >= 2017
		 GROUP BY [capital]) AS cd
	ON dl.[capital] = cd.[capital]
 --WHERE dl.[department] <> 'BOGOTA'
 ORDER BY [department];
GO
