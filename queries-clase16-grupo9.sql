SELECT * FROM CATEGORIAS
LEFT JOIN productos
ON categorias.CategoriaID = productos.CategoriaID;

SELECT * FROM clientes
LEFT JOIN facturas
ON clientes.ClienteID = facturas.ClienteID
WHERE facturas.FacturaID IS NULL;

SELECT ProductoNombre, CategoriaID, contacto FROM productos
LEFT JOIN PROVEEDORES
ON productos.ProveedorID = proveedores.ProveedorID;

SELECT avg(PrecioUnitario), categorias.CategoriaNombre FROM productos
INNER JOIN categorias
ON categorias.CategoriaID = productos.CategoriaID
group by categorias.CategoriaID;

SELECT clientes.Contacto, max(facturas.FacturaID) from facturas
right join clientes
on clientes.ClienteID = facturas.ClienteID
group by clientes.Contacto;

select correos.Compania, count(FacturaID) as 'Cantidad Facturas' FROM facturas
right join correos
on correos.CorreoID = facturas.EnvioVia
group by correos.CorreoID;


