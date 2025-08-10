/*
Proyecto: Consultas SQL - Base de Empleados
Archivo: 01-exploracion-inicial.sql
Descripción: Explorar estructura de AdventureWorks2019 antes de crear datos
*/

USE AdventureWorks2019; 

-- Verificar base de datos activa
SELECT DB_NAME() AS BaseDatosActual;

-- Ver las tablas principales de empleados
SELECT 
    TABLE_SCHEMA,
    TABLE_NAME
FROM INFORMATION_SCHEMA.TABLES 
WHERE TABLE_NAME LIKE '%Employee%' 
   OR TABLE_NAME LIKE '%Person%'
ORDER BY TABLE_SCHEMA, TABLE_NAME;

-- Ver estructura de la tabla Employee
SELECT 
    COLUMN_NAME,
    DATA_TYPE,
    IS_NULLABLE,
    CHARACTER_MAXIMUM_LENGTH
FROM INFORMATION_SCHEMA.COLUMNS 
WHERE TABLE_NAME = 'Employee' 
  AND TABLE_SCHEMA = 'HumanResources'
ORDER BY ORDINAL_POSITION;

 -- ===============================================
-- Ver rango de IDs y cantidad actual de empleados
SELECT 
    COUNT(*) AS TotalEmpleados,
    MIN(BusinessEntityID) AS MinID,
    MAX(BusinessEntityID) AS MaxID
FROM HumanResources.Employee;

-- Ver ejemplos de datos para entender patrones
SELECT TOP 5
    BusinessEntityID,
    NationalIDNumber,
    LoginID,
    JobTitle,
    BirthDate,
    MaritalStatus,
    Gender,
    HireDate
FROM HumanResources.Employee
ORDER BY BusinessEntityID;