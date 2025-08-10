-- Script para Consultas Analíticas

/*
Proyecto: Consultas SQL - Base de Empleados
Archivo: consultas_analiticas.sql
Descripción: Script con consultas analíticas para la tabla EmpleadosNuevos
Autor: Einstein Carrera Chavez
Fecha: 2025-08-10
*/

USE AdventureWorks2019;


-- Consulta 1: Número de empleados por título de trabajo
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


-- Consulta 3: Empleados con más de 60 horas de vacaciones
SELECT
    BusinessEntityID,
    LoginID,
    VacationHours
FROM dbo.EmpleadosNuevos
WHERE VacationHours > 60
ORDER BY VacationHours DESC;


-- Consulta 4: Distribución de empleados por estado civil
SELECT
    MaritalStatus,
    COUNT(*) AS NumeroEmpleados
FROM dbo.EmpleadosNuevos
GROUP BY MaritalStatus;


-- Consulta 5: Empleados contratados en los últimos 5 años
SELECT
    BusinessEntityID,
    LoginID,
    HireDate
FROM dbo.EmpleadosNuevos
WHERE HireDate >= DATEADD(YEAR, -5, GETDATE())
ORDER BY HireDate DESC;


-- Consulta 6: Top 10 empleados con los salarios más altos
SELECT TOP 10
    BusinessEntityID,
    LoginID,
    JobTitle,
    Salary
FROM dbo.EmpleadosNuevos
ORDER BY Salary DESC;

