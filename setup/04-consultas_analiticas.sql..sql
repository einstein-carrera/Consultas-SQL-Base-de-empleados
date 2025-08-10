-- Script para Consultas Anal�ticas

/*
Proyecto: Consultas SQL - Base de Empleados
Archivo: consultas_analiticas.sql
Descripci�n: Script con consultas anal�ticas para la tabla EmpleadosNuevos
Autor: Einstein Carrera Chavez
Fecha: 2025-08-10
*/

USE AdventureWorks2019;


-- Consulta 1: N�mero de empleados por t�tulo de trabajo
SELECT
    JobTitle,
    COUNT(*) AS NumeroEmpleados
FROM dbo.EmpleadosNuevos
GROUP BY JobTitle
ORDER BY NumeroEmpleados DESC;


-- Consulta 2: Salario promedio por departamento
SELECT
    DepartmentID,
    AVG(Salary) AS SalarioPromedio
FROM dbo.EmpleadosNuevos
GROUP BY DepartmentID
ORDER BY SalarioPromedio DESC;


-- Consulta 3: Empleados con m�s de 60 horas de vacaciones
SELECT
    BusinessEntityID,
    LoginID,
    VacationHours
FROM dbo.EmpleadosNuevos
WHERE VacationHours > 60
ORDER BY VacationHours DESC;


-- Consulta 4: Distribuci�n de empleados por estado civil
SELECT
    MaritalStatus,
    COUNT(*) AS NumeroEmpleados
FROM dbo.EmpleadosNuevos
GROUP BY MaritalStatus;


-- Consulta 5: Empleados contratados en los �ltimos 5 a�os
SELECT
    BusinessEntityID,
    LoginID,
    HireDate
FROM dbo.EmpleadosNuevos
WHERE HireDate >= DATEADD(YEAR, -5, GETDATE())
ORDER BY HireDate DESC;


-- Consulta 6: Top 10 empleados con los salarios m�s altos
SELECT TOP 10
    BusinessEntityID,
    LoginID,
    JobTitle,
    Salary
FROM dbo.EmpleadosNuevos
ORDER BY Salary DESC;

