USE [AC_C19_DATA]
GO

SELECT COUNT(*) AS [count], 
	   SUM(area) AS [total_area], 
	   SUM(population) AS [total_population],
	   SUM(pib) AS [total_pib],
	   SUM(last_births) AS [total_last_births],
	   SUM(population * perc_women) AS [total_women]
  FROM [dbo].[department_list];
GO

SELECT [department], 
	   CAST(100.0 * [area] / [total_area] AS numeric(5, 2)) AS [area],
	   CAST(100.0 * [population] / [total_population] AS numeric(5, 2)) AS [population],
	   CAST(100.0 * [pib] / [total_pib] AS numeric(5, 2)) AS [pib],
	   CAST(100.0 * [last_births] / [total_last_births] AS numeric(5, 2)) AS [last_births],
	   CAST(100.0 * [perc_women] AS numeric(5, 2)) AS [perc_women]
  FROM 
	  (SELECT 33 AS [key], [department], [area], [population], [pib], [last_births], [perc_women]
         FROM [department_list]) AS dpt
 INNER JOIN
      (SELECT COUNT(*) AS [count], 
			  SUM(area) AS [total_area], 
			  SUM(population) AS [total_population],
			  SUM(pib) AS [total_pib],
			  SUM(last_births) AS [total_last_births],
			  SUM(population * perc_women) AS [total_women]
		 FROM [dbo].[department_list]) AS tot
	ON dpt.[key] = tot.[count]
 ORDER BY [department];
GO
