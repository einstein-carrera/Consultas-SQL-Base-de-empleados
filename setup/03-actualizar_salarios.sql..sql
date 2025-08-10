-- Script para Actualización de Datos

/*
Proyecto: Consultas SQL - Base de Empleados
Archivo: actualizar_salarios.sql
Descripción: Script para actualizar los salarios de los empleados
Autor: Einstein Carrera Chavez
Fecha: 2025-08-10
*/

USE AdventureWorks2019;


-- Actualizar salarios: Incrementar en un 5% los salarios de los empleados en un departamento específico
UPDATE dbo.EmpleadosNuevos
SET Salary = Salary * 1.05
WHERE DepartmentID = 1; -- Cambia el DepartmentID según sea necesario


-- Verificar la actualización
SELECT
    BusinessEntityID,
    LoginID,
    Salary
FROM dbo.EmpleadosNuevos
WHERE DepartmentID = 1; -- Cambia el DepartmentID según sea necesario

