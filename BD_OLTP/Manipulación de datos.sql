USE dsrp_transacciones_bancarias;

-- Manipulación de datos
SELECT*FROM tipos_transaccion;
SELECT*FROM transacciones;

-- Optimizando transacciones según tipo de transacción.

--- Depositos
SELECT 
	tt.nombre AS 'tipo_transaccion',
	t.numero_cuenta_origen_id,
	t.numero_cuenta_destino_id
FROM transacciones t
INNER JOIN tipos_transaccion tt ON tt.id=t.tipo_transaccion_id
WHERE tt.id=10 AND t.numero_cuenta_destino_id IS NULL;

-- actualiza cuenta destino y poner en null cuenta origen para depositos
UPDATE transacciones SET numero_cuenta_destino_id=numero_cuenta_origen_id, numero_cuenta_origen_id = NULL
WHERE tipo_transaccion_id=10 AND numero_cuenta_destino_id IS NULL;

-- Poner en null cuenta origen para depositos

UPDATE transacciones SET numero_cuenta_origen_id = NULL
WHERE tipo_transaccion_id=10 AND numero_cuenta_origen_id IS NOT NULL;

--- Retiros
SELECT 
	tt.nombre AS 'tipo_transaccion',
	t.numero_cuenta_origen_id,
	t.numero_cuenta_destino_id
FROM transacciones t
INNER JOIN tipos_transaccion tt ON tt.id=t.tipo_transaccion_id
WHERE tt.id=11 AND t.numero_cuenta_origen_id IS NULL;


UPDATE transacciones SET numero_cuenta_origen_id=numero_cuenta_destino_id, numero_cuenta_destino_id = NULL
WHERE tipo_transaccion_id=11 AND numero_cuenta_origen_id IS NULL;

UPDATE transacciones SET numero_cuenta_destino_id = NULL
WHERE tipo_transaccion_id=11 AND numero_cuenta_destino_id IS NOT NULL;

--- Transferencias
SELECT 
	tt.nombre AS 'tipo_transaccion',
	t.numero_cuenta_origen_id,
	t.numero_cuenta_destino_id
FROM transacciones t
INNER JOIN tipos_transaccion tt ON tt.id=t.tipo_transaccion_id
WHERE tt.id=12 AND (t.numero_cuenta_origen_id IS NULL OR t.numero_cuenta_destino_id IS NULL);

--Actualizar cuenta destino
UPDATE transacciones SET numero_cuenta_destino_id=ROUND(RAND()*100,0)
WHERE numero_cuenta_destino_id IS NULL AND tipo_transaccion_id=12;
--Actualizar cuenta origen
UPDATE transacciones SET numero_cuenta_origen_id=ROUND(RAND()*100,0)
WHERE numero_cuenta_origen_id IS NULL AND tipo_transaccion_id=12;


