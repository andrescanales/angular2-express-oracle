-- SP:
CREATE OR REPLACE FUNCTION sp_entradas_salidas(v_codproducto IN INT, v_cantidad IN INT, v_tipo IN VARCHAR2)
RETURN VARCHAR2 IS
PRAGMA AUTONOMOUS_TRANSACTION;
v_existensias INTEGER;
v_codkardex INTEGER;
v_preciounitario NUMBER;
BEGIN
    
    SELECT existencia INTO v_existensias FROM productos WHERE cod_producto = v_codproducto;
    SELECT costo_unitario INTO v_preciounitario FROM productos WHERE cod_producto = v_codproducto;
    SELECT NVL(MAX(COD_KARDEX + 1), 1) INTO v_codkardex FROM KARDEX;
    IF (v_tipo = 'IN') THEN
        IF (v_existensias > 0) THEN
            UPDATE productos SET existencia=(v_existensias + v_cantidad) WHERE cod_producto = v_codproducto;
            INSERT INTO kardex(cod_kardex,cod_producto,tipo_transaccion,cantidad_producto,costo_unitario,fecha_transaccion,created_at)
            VALUES(v_codkardex, v_codproducto, 'IN', v_cantidad, v_preciounitario, CURRENT_DATE, CURRENT_DATE);
            COMMIT;
            RETURN 'TRUE';
        ELSE
            RETURN 'Producto no existe';
        END IF;
    ELSIF (v_tipo = 'OUT') THEN
        IF (v_existensias > 0 AND v_existensias >= v_cantidad) THEN
            UPDATE productos SET existencia=(v_existensias - v_cantidad) WHERE cod_producto = v_codproducto;
            INSERT INTO kardex(cod_kardex,cod_producto,tipo_transaccion,cantidad_producto,costo_unitario,fecha_transaccion,created_at)
            VALUES(v_codkardex, v_codproducto, 'OUT', v_cantidad, v_preciounitario, CURRENT_DATE, CURRENT_DATE);
            COMMIT;
            RETURN 'TRUE';
        ELSE
            RETURN 'Producto no existe o no hay suficientes existencias';
        END IF;
    ELSE
        RETURN 'Tipo unicamente IN o OUT';
    END IF;
END;

--Testing queries:
--SELECT sp_entradas_salidas(1, 25, 'IN') FROM dual;
--SELECT sp_entradas_salidas(1, 25, 'OUT') FROM dual;