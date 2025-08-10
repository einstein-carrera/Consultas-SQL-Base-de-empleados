-- Consulta para obtener información de los departamentos
/*
Tablas Utilizadas:
dbo.EmpleadosNuevos: Contiene información básica de los empleados.
HumanResources.Department: Proporciona detalles sobre los departamentos, como el nombre del departamento
y el grupo al que pertenece.
*/

SELECT
    e.BusinessEntityID,
    e.LoginID,
    e.JobTitle,
    d.Name AS DepartmentName,
    d.GroupName
FROM dbo.EmpleadosNuevos e
JOIN HumanResources.Department d ON e.DepartmentID = d.DepartmentID;

-- Consulta para obtener información de ubicación de los empleados
/*
Tablas Utilizadas:
dbo.EmpleadosNuevos: Información básica de los empleados.
Person.BusinessEntityAddress: Relaciona las entidades de negocio (empleados) con sus direcciones.
Person.Address: Contiene información detallada de las direcciones.
Person.StateProvince: Proporciona información sobre las provincias o estados.
Person.CountryRegion: Contiene información sobre los países o regiones.
*/

SELECT
    e.BusinessEntityID,
    e.LoginID,
    a.AddressLine1,
    a.City,
    sp.Name AS StateProvinceName,
    cr.Name AS CountryName
FROM dbo.EmpleadosNuevos e
JOIN Person.BusinessEntityAddress bea ON e.BusinessEntityID = bea.BusinessEntityID
JOIN Person.Address a ON bea.AddressID = a.AddressID
JOIN Person.StateProvince sp ON a.StateProvinceID = sp.StateProvinceID
JOIN Person.CountryRegion cr ON sp.CountryRegionCode = cr.CountryRegionCode;


-- Consulta para obtener información de ventas asociadas a empleados
/*
Tablas Utilizadas:
dbo.EmpleadosNuevos: Información básica de los empleados.
Sales.SalesPerson: Contiene información sobre el desempeño de ventas de los empleados.
*/

SELECT 
    e.BusinessEntityID,
    e.LoginID,
    e.JobTitle,
    sp.SalesYTD,
    sp.SalesLastYear
FROM HumanResources.Employee e
INNER JOIN Sales.SalesPerson sp ON e.BusinessEntityID = sp.BusinessEntityID;
