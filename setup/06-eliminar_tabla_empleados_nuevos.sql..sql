-- Script de Eliminación

-- Script para eliminar la tabla EmpleadosNuevos
USE AdventureWorks2019;


IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'EmpleadosNuevos')
DROP TABLE dbo.EmpleadosNuevos;

