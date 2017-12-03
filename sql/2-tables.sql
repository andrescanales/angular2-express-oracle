CREATE TABLE productos(
    cod_producto INT NOT NULL,
    nombre VARCHAR2(250),
    descripcion VARCHAR2(1000),
    cod_proveedor INT,
    costo_unitario NUMBER,
    costo_promedio NUMBER,
    precio_venta NUMBER,
    existencia NUMBER,
    created_at TIMESTAMP WITH TIME ZONE,
    updated_at TIMESTAMP WITH TIME ZONE,
    CONSTRAINT cod_producto_pk PRIMARY KEY (cod_producto)
);
CREATE TABLE proveedores(
    cod_proveedor INT NOT NULL,
    nombre VARCHAR2(250),
    descripcion VARCHAR2(1000),
    telefono VARCHAR2(11),
    created_at TIMESTAMP WITH TIME ZONE,
    updated_at TIMESTAMP WITH TIME ZONE,
    CONSTRAINT cod_proveedor_pk PRIMARY KEY(cod_proveedor)
);
CREATE TABLE kardex(
    cod_kardex INT NOT NULL,
    cod_producto INT NOT NULL,
    tipo_transaccion VARCHAR2(3) NOT NULL,
    cantidad_producto NUMBER,
    costo_unitario NUMBER,
    fecha_transaccion TIMESTAMP WITH TIME ZONE,
    created_at TIMESTAMP WITH TIME ZONE,
    updated_at TIMESTAMP WITH TIME ZONE,
    CONSTRAINT cod_kardex_pk PRIMARY KEY(cod_kardex)
);