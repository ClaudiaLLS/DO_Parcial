use Kaggle
GO


--Este script sirve para asegurarnos de que no exista otra tabla y no se pueda duplicar.
--EN CASO NO EXISTA LA TABLA dbo.starbucks
IF NOT EXISTS (SELECT * FROM SYS.TABLES WHERE object_id=OBJECT_ID(N'dbo.starbucks') AND type='U') 
--CREAR TABLA
create table dbo.starbucks (
			beverage_category VARCHAR (50),
			beverage VARCHAR(100),
			beverage_prep VARCHAR(50),
			calories DECIMAL (6,3),
			total_fat_g VARCHAR(10),
			trans_fat_g DECIMAL(6,3),
			saturated_fat_g DECIMAL(6,3),
			sodium_mg DECIMAL(6,3),
			total_carbohydrates_g DECIMAL(6,3),
			cholesterol_mg DECIMAL(6,3),
			dietary_fibre_g DECIMAL(6,3),
			sugars_g DECIMAL(6,3),
			protein_g DECIMAL(6,3),
			vitamin_a_pct VARCHAR(10),
			vitamin_c_pct VARCHAR(10),
			calcium_pct VARCHAR(10),
			iron_pct VARCHAR(10),
			caffeine_mg VARCHAR(10)
)
GO

--SI YA EXISTE LA TABLA dbo.starbucks LIMPIAR TABLA
TRUNCATE TABLE dbo.starbucks
GO

--IMPORTAR DATA DESDE ARCHIVO
BULK INSERT dbo.starbucks
FROM 'C:\proyecto_parcial\dataset\starbucks.csv'
WITH
(
	FIRSTROW = 2, --empieza en la segunda fila, ya que la primera es la cabecera
	FIELDTERMINATOR = ',', --indicamos separador de columnas
	ROWTERMINATOR = '0X0a' --hace referencia a un salto de linea
)
GO

SELECT * FROM dbo.starbucks
