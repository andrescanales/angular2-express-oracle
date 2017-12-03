--Initial dummy data for proveedores:
INSERT INTO PROVEEDORES(cod_proveedor,nombre,descripcion,telefono,created_at)
VALUES(1,'Annies','Homeground organic products','5032881001',CURRENT_DATE);

--Initial dummy data for productos:
INSERT INTO productos(cod_producto,nombre,descripcion,cod_proveedor,costo_unitario,precio_venta,existencia,created_at)
VALUES(1,'Chocolate chips','Granola bar covered with chocolate chips',1,1,2,25,CURRENT_DATE);

INSERT INTO productos(cod_producto,nombre,descripcion,cod_proveedor,costo_unitario,precio_venta,existencia,created_at)
VALUES(2,'Snickers','Chocolate bar with almonds',1,2,3,25,CURRENT_DATE);

--Initial dummy data for kardex:
INSERT INTO kardex(cod_kardex,cod_producto,tipo_transaccion,cantidad_producto,costo_unitario,fecha_transaccion,created_at)
VALUES(1,1,'IN',25,1,CURRENT_DATE,CURRENT_DATE);