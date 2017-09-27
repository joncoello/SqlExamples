USE master
GO

IF NOT EXISTS ( SELECT * FROM sys.databases WHERE name = 'SeedTest' )
	CREATE DATABASE SeedTest
GO

USE SeedTest
GO

IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'SeedTable')
	CREATE TABLE SeedTable(
		SeedID	INT	NOT NULL IDENTITY(1,1),
		SeeName VARCHAR(100) NOT NULL,

		CONSTRAINT PK_SeedTable PRIMARY KEY CLUSTERED (SeedID)
	)
GO

IF NOT EXISTS (SELECT * FROM dbo.SeedTable)
	INSERT INTO dbo.SeedTable
	(
		SeeName
	)
	VALUES ('one' -- SeeName - varchar(100)
		   ),
		   ('two' -- SeeName - varchar(100)
		   ),
		   ('three' -- SeeName - varchar(100)
		   )
GO

IF NOT EXISTS (SELECT * FROM dbo.SeedTable WHERE SeedID = 5)
BEGIN 

	SET IDENTITY_INSERT [dbo].SeedTable ON

	INSERT INTO dbo.SeedTable
	(
		SeedID,
		SeeName
	)
	VALUES (5, 'five' -- SeeName - varchar(100)
		   )

	SET IDENTITY_INSERT [dbo].SeedTable OFF	

END
GO

IF NOT EXISTS (SELECT * FROM dbo.SeedTable WHERE SeedID = 4)
	INSERT INTO dbo.SeedTable
	(
		SeeName
	)
	VALUES ('four' -- SeeName - varchar(100)
		   ),
		   ('five' -- SeeName - varchar(100)
		   )
GO