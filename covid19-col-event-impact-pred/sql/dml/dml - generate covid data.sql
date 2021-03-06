USE [AC_C19_DATA]
GO

-- Total deaths by year
SELECT [year], MIN([date]) AS [min_date], MAX([date]) AS [max_date], SUM([deaths]) AS [deaths]
  FROM [dbo].[c19_col_data]
 GROUP BY [year]
 ORDER BY [year];
GO

-- Total deaths by year, period
SELECT [year], [period], SUM([deaths]) AS [total_deaths]
 FROM [dbo].[c19_col_data]
 GROUP BY [year], [period]
 ORDER BY [year], [period];
GO

-- Total deaths by year, period
SELECT [department], [year], [period], SUM([deaths]) AS [total_deaths]
  FROM [dbo].[c19_col_data]
 GROUP BY [department], [year], [period]
 ORDER BY [department], [year], [period];
GO
