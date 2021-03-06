USE [AC_C19_DATA]
GO

SELECT [zone], COUNT(*) AS [count]
  FROM [dbo].[department_list]
 GROUP BY [zone];
GO

SELECT [zone],[department],[capital],[municipalities]
  FROM [dbo].[department_list]
 ORDER BY [zone],[department];
GO
