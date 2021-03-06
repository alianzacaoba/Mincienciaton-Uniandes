USE [AC_C19_DATA]
GO

-- Validate indicator data
SELECT [event],[entity],[department],[year],[week],[date],[value]
  FROM [dbo].[events_data]
 WHERE [event] = 'EM'
 ORDER BY [year], [week];
GO

-- Validate grouped data
SELECT [year], COUNT(*), SUM([value])
  FROM [dbo].[events_data]
 WHERE [event] = 'EM'
 GROUP BY [year]
 ORDER BY [year];
GO

-- Validate department list
SELECT [department], [entity], COUNT(*) AS [count]
  FROM [dbo].[events_data]
 WHERE [event] = 'EM'
  -- AND [entity] <> [department]
 GROUP BY [department], [entity]
 ORDER BY [department];
GO

-- Update deparments from entities
UPDATE [events_data]
   SET [department] = 'BOLIVAR' --SELECT * FROM [indicator_data]
     , [entity] = 'CARTAGENA'
 WHERE [event] = 'EDA'
   AND [entity] = 'CARTAGENA'
   AND [department] = 'CARTAGENA';
GO

-- Validate NULLs date
SELECT [year], [week], MIN([date]) AS [date]
		  FROM (
			SELECT c.[year], c.[week], d.date
			  FROM [AC_C19_DATA].[dbo].[events_data] AS c
			 INNER JOIN
				   [DEVOPS].[dbo].[dim_date] AS d
				ON c.year = d.year AND c.week = d.week_of_year
			 WHERE [event] = 'EDA') AS t
		 GROUP BY [year], [week]
		 ORDER BY [year], [week];
GO

-- Update NULLs date
UPDATE a
   SET a.[date] = b.[date]
  FROM [AC_C19_DATA].[dbo].[events_data] AS a
 INNER JOIN
	(SELECT [year],[week_of_year],MIN([date]) AS [date]
       FROM [DEVOPS].[dbo].[dim_date]
      GROUP BY [year],[week_of_year]) AS b
  ON a.[week] = b.[week_of_year] AND a.[year] = b.[year]
 WHERE a.[date] IS NULL
   AND [event] = 'EM';
GO

-- Update Department name
UPDATE [dbo].[department_list]
   SET [zone] = RTRIM(LTRIM(UPPER([zone]))),
	   [capital] = RTRIM(LTRIM(UPPER([capital])));

UPDATE [dbo].[events_data]
   SET [department] = RTRIM(LTRIM(UPPER([department]))),
	   [entity] = RTRIM(LTRIM(UPPER([entity]))); 
GO

-- Validate date blocks
SELECT [date], COUNT(*) AS [count]
  FROM [dbo].[events_data]
 WHERE [year] >= 2017
 GROUP BY [date]
 ORDER BY [date];

SELECT [event], [date], COUNT(*) AS [count]
  FROM [dbo].[events_data] 
 WHERE [date] IN ('20200101', '20190101', '20180101')
 GROUP BY [event], [date]
 ORDER BY [event], [date];

-- Fix min date
UPDATE [dbo].[events_data] 
   SET [date] = '20141228'
 WHERE [event] = 'EM'
   AND [date] = '20150101';
UPDATE [dbo].[events_data] 
   SET [date] = '20151227'
 WHERE [event] = 'EM'
   AND [date] = '20160101';
UPDATE [dbo].[events_data] 
   SET [date] = '20171231'
 WHERE [event] = 'EM'
   AND [date] = '20180101';
UPDATE [dbo].[events_data] 
   SET [date] = '20181230'
 WHERE [event] = 'EM'
   AND [date] = '20190101';
UPDATE [dbo].[events_data] 
   SET [date] = '20191229'
 WHERE [event] = 'EM'
   AND [date] = '20200101';
GO
