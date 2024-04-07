CREATE DATABASE Kaggle

USE Kaggle

select*from sys.tables

if not exists (select*from sys.tables where object_id=OBJECT_ID(N'dbo.starbucks')and type='U')
	CREATE TABLE dbo.starbucks (
		Beverage_category VARCHAR(200),
		Beverage VARCHAR(200),
		Beverage_prep VARCHAR(200),
		Calories INT,
		Total_Fat_g DECIMAL,
		Trans_Fat_g DECIMAL,
		Saturated_Fat_g DECIMAL,
		Sodium_mg DECIMAL,
		Total_Carbohydrates_g INT,
		Cholesterol_mg INT,
		Dietary_Fibre_g INT,
		Sugars_g INT,
		Protein_g DECIMAL,
		Vitamin_A_DV VARCHAR(10),
		Vitamin_C_DV VARCHAR(10),
		Calcium_DV VARCHAR(10),
		Iron_DV VARCHAR(10),
		Caffeine_mg VARCHAR(10)
)
GO

--SI LA TABLA YA EXISTE, SE PROCEDERA A LIMPIAR
TRUNCATE TABLE dbo.starbucks;
GO

BULK INSERT dbo.starbucks
FROM 'C:\Users\Desktop\Desktop\proyecto_parcial\dataset\starbucks.csv' --UBICACION DE MI ARCHIVO
WITH
(
	FIRSTROW=2,--empieza insertar data desde la fila 2
	FIELDTERMINATOR=',', --terminador de las columnas
	rowterminator ='0x0a' --terminador de las filas, salto de linea
)
GO


select*from starbucks

BULK INSERT dbo.starbucks
FROM 'C:\Users\Desktop\Desktop\proyecto_parcial\dataset\starbucks.csv' 
WITH
(
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '0x0a',
    CODEPAGE = '65001' -- UTF-8
)