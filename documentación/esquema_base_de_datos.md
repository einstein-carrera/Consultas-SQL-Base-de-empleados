# Esquema de la Base de Datos

Este documento describe el esquema de la base de datos utilizado en el proyecto "Consultas SQL - Base de Empleados".

## Tablas Principales

### EmpleadosNuevos

Esta tabla contiene información sobre los empleados.

| Columna | Tipo | Descripción |
|--------|------|-------------|
| ID | INT | Identificador único del empleado. |
| BusinessEntityID | INT | Identificador de la entidad de negocio asociada al empleado. |
| NationalIDNumber | NVARCHAR(15) | Número de identificación nacional del empleado. |
| LoginID | NVARCHAR(256) | Identificador de inicio de sesión del empleado. |
| JobTitle | NVARCHAR(50) | Título del trabajo del empleado. |
| BirthDate | DATE | Fecha de nacimiento del empleado. |
| MaritalStatus | NCHAR(1) | Estado civil del empleado. |
| Gender | NCHAR(1) | Género del empleado. |
| HireDate | DATE | Fecha de contratación del empleado. |
| SalariedFlag | BIT | Indica si el empleado es asalariado. |
| VacationHours | SMALLINT | Horas de vacaciones del empleado. |
| SickLeaveHours | SMALLINT | Horas de licencia por enfermedad del empleado. |
| Salary | DECIMAL(10,2) | Salario del empleado. |
| DepartmentID | INT | Identificador del departamento al que pertenece el empleado. |
| CreatedDate | DATETIME2 | Fecha de creación del registro. |

### HumanResources.Department

Esta tabla contiene información sobre los departamentos.

| Columna | Tipo | Descripción |
|--------|------|-------------|
| DepartmentID | INT | Identificador único del departamento. |
| Name | NVARCHAR(50) | Nombre del departamento. |
| GroupName | NVARCHAR(50) | Nombre del grupo al que pertenece el departamento. |

## Relaciones

- **EmpleadosNuevos** está relacionada con **HumanResources.Department** a través del campo `DepartmentID`.
- **EmpleadosNuevos** también se relaciona con varias tablas en el esquema `Person` para obtener información de ubicación, como `Person.BusinessEntityAddress`, `Person.Address`, `Person.StateProvince`, y `Person.CountryRegion`.
