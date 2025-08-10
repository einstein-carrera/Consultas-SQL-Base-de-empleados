/*
Proyecto: Consultas SQL - Base de Empleados
Archivo: crear_tabla_empleados_nuevos.sql
Descripción: Crea tabla permanente con 1000 empleados nuevos en la base de datos AdventureWorks2019
Autor: E CCH
Fecha: 2025-08-10
*/

USE AdventureWorks2019;

-- Eliminar la tabla si ya existe
IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'EmpleadosNuevos')
DROP TABLE dbo.EmpleadosNuevos;


-- Crear tabla para empleados nuevos
CREATE TABLE dbo.EmpleadosNuevos (
    ID INT IDENTITY(1,1) PRIMARY KEY,
    BusinessEntityID INT NOT NULL,
    NationalIDNumber NVARCHAR(15) NOT NULL,
    LoginID NVARCHAR(256) NOT NULL,
    JobTitle NVARCHAR(50) NOT NULL,
    BirthDate DATE NOT NULL,
    MaritalStatus NCHAR(1) NOT NULL,
    Gender NCHAR(1) NOT NULL,
    HireDate DATE NOT NULL,
    SalariedFlag BIT NOT NULL,
    VacationHours SMALLINT NOT NULL,
    SickLeaveHours SMALLINT NOT NULL,
    Salary DECIMAL(10,2) NULL,
    DepartmentID INT NULL,
    CreatedDate DATETIME2 DEFAULT GETDATE()
);


-- Generar números del 1 al 1000 primero, luego calcular datos
WITH Numeros AS (
  -- Genera números del 1 al 1000
  SELECT TOP 1000 ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) AS Num
  FROM master.dbo.spt_values s1
  CROSS JOIN master.dbo.spt_values s2
),
NuevosEmpleados AS (
  SELECT
    Num + 290 AS BusinessEntityID,  -- IDs del 291 al 1290
    CAST(ABS(CHECKSUM(NEWID())) % 900000000 + 100000000 AS NVARCHAR(15)) AS NationalIDNumber,
    'adventure-works\emp' + CAST(Num + 290 AS NVARCHAR(10)) AS LoginID,
    CASE (Num % 10)
      WHEN 1 THEN 'Software Developer'
      WHEN 2 THEN 'Data Analyst'
      WHEN 3 THEN 'Project Manager'
      WHEN 4 THEN 'Sales Representative'
      WHEN 5 THEN 'Marketing Specialist'
      WHEN 6 THEN 'HR Coordinator'
      WHEN 7 THEN 'Quality Assurance'
      WHEN 8 THEN 'Business Analyst'
      WHEN 9 THEN 'Technical Writer'
      WHEN 0 THEN 'Customer Support'
    END AS JobTitle,
    DATEADD(day, -(ABS(CHECKSUM(NEWID())) % 15000 + 6570), GETDATE()) AS BirthDate,
    CASE (Num % 3) WHEN 1 THEN 'S' WHEN 2 THEN 'M' ELSE 'S' END AS MaritalStatus,
    CASE (Num % 2) WHEN 1 THEN 'M' ELSE 'F' END AS Gender,
    DATEADD(day, -(ABS(CHECKSUM(NEWID())) % 3650), GETDATE()) AS HireDate,
    CASE WHEN (Num % 5) = 0 THEN 0 ELSE 1 END AS SalariedFlag,
    (ABS(CHECKSUM(NEWID())) % 80) + 40 AS VacationHours,
    (ABS(CHECKSUM(NEWID())) % 60) + 20 AS SickLeaveHours,
    CAST((ABS(CHECKSUM(NEWID())) % 50000 + 35000) AS DECIMAL(10,2)) AS Salary,
    (ABS(CHECKSUM(NEWID())) % 16) + 1 AS DepartmentID
  FROM Numeros
)
INSERT INTO dbo.EmpleadosNuevos (
    BusinessEntityID, NationalIDNumber, LoginID, JobTitle,
    BirthDate, MaritalStatus, Gender, HireDate,
    SalariedFlag, VacationHours, SickLeaveHours, Salary, DepartmentID
)
SELECT * FROM NuevosEmpleados;


-- Verificar la tabla
SELECT * FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_NAME = 'EmpleadosNuevos';


-- Conteo de registros
SELECT COUNT(*) AS TotalRegistrosInsertados FROM dbo.EmpleadosNuevos;


-- Ver muestra de los datos creados
SELECT TOP 10
    BusinessEntityID,
    LoginID,
    JobTitle,
    BirthDate,
    Gender,
    HireDate,
    Salary
FROM dbo.EmpleadosNuevos
ORDER BY BusinessEntityID;


-- Estadísticas rápidas
SELECT
    COUNT(*) AS TotalEmpleados,
    COUNT(DISTINCT JobTitle) AS PuestosDistintos,
    MIN(Salary) AS SalarioMinimo,
    MAX(Salary) AS SalarioMaximo,
    AVG(Salary) AS SalarioPromedio
FROM dbo.EmpleadosNuevos;




-- Consulta para agrupar empleados por título de trabajo
SELECT JobTitle, COUNT(*) AS NumeroEmpleados
FROM dbo.EmpleadosNuevos
GROUP BY JobTitle
ORDER BY NumeroEmpleados DESC;

-- Consulta para calcular el salario promedio por departamento
SELECT DepartmentID, AVG(Salary) AS SalarioPromedio
FROM dbo.EmpleadosNuevos
GROUP BY DepartmentID
ORDER BY SalarioPromedio DESC;

-- Consulta para encontrar empleados con más de 60 horas de vacaciones
SELECT BusinessEntityID, LoginID, VacationHours
FROM dbo.EmpleadosNuevos
WHERE VacationHours > 60
ORDER BY VacationHours DESC;

