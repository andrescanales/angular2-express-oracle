CREATE OR REPLACE VIEW kardex_transactions AS
SELECT prod.cod_producto,
prod.nombre AS producto,
prov.cod_proveedor,
prov.nombre AS proveedor,
prod.precio_venta,
kar.costo_unitario,
prod.existencia,
kar.fecha_transaccion,
kar.tipo_transaccion
FROM kardex kar
INNER JOIN productos prod ON prod.cod_producto = kar.cod_producto
INNER JOIN proveedores prov ON prod.cod_proveedor = prov.cod_proveedor
ORDER BY kar.fecha_transaccion DESC

--Calling view:
--SELECT * FROM kardex_transactions