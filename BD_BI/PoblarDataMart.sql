USE dsrp_transacciones_bancarias;
GO


-- Consulta para poblar la dimensión cliente

CREATE VIEW VW_KV_DIMENSION_CLIENTES AS
SELECT
	CONCAT(nombres,' ',apellidos) AS 'nombre',
	segemento AS 'segmento',
	id AS 'cliente_id'
FROM clientes;

--Insertando data en la dimensión Cliente
INSERT INTO dsrp_transacciones_bancarias_bi.dbo.dim_cliente
SELECT*FROM VW_KV_DIMENSION_CLIENTES;

-- Consulta para poblar la dimensión cuenta

SELECT 
	tc.nombre AS 'tipo_cuenta',
	tc.id AS 'tipo_cuenta_id'
FROM  tipos_cuenta tc

-- Insertando data en tabla dimensión cuentas

INSERT INTO dsrp_transacciones_bancarias_bi.dbo.dim_cuenta
SELECT 
	tc.nombre AS 'tipo_cuenta',
	tc.id AS 'tipo_cuenta_id'
FROM  tipos_cuenta tc


-- Consulta para poblar la dimensión sucursal

SELECT
	nombre,
	SUBSTRING(nombre,10,20) AS 'ciudad',
	SUBSTRING(nombre,10,20) AS 'region',
	id AS 'sucursal_id'
FROM sucursales;

-- Consulta para poblar la dimensión transacciones

SELECT
	nombre AS 'tipo_transaccion',
	id AS 'tipo_transaccion_id'
FROM tipos_transaccion;


-- Consulta para poblar la dimensión tiempo

SELECT 
	DISTINCT 
	CAST(DAY(fecha_transaccion)AS VARCHAR) AS 'dia',
	CAST(MONTH(fecha_transaccion) AS VARCHAR) AS 'mes',
	CAST(DATEPART(QUARTER,fecha_transaccion) AS VARCHAR) AS 'trimestre',
	CAST(YEAR(fecha_transaccion)AS VARCHAR) AS 'anio',
	fecha_transaccion,
	CAST(DATENAME(MONTH,fecha_transaccion) AS VARCHAR) AS 'nombre_mes'
FROM transacciones; 

-- Consulta para poblar la tabla hechos transacciones

SELECT
	t.fecha_transaccion,
	c.tipo_cuenta_id,
	dc.cliente_id,
	t.sucursal_id,
	t.tipo_transaccion_id,
	t.monto,
	c.saldo-t.monto AS 'saldo_antes',
	c.saldo AS 'saldo_despues',
	COUNT(t.id) AS 'numero_transacciones'
FROM transacciones t
INNER JOIN cuentas c ON c.id=t.numero_cuenta_destino_id
INNER JOIN detalle_cuentas dc ON dc.cuenta_id=c.id
WHERE t.tipo_transaccion_id='10'
GROUP BY 
	t.fecha_transaccion,
	c.tipo_cuenta_id,
	dc.cliente_id,
	t.sucursal_id,
	t.tipo_transaccion_id,
	t.monto,
	c.saldo
UNION
SELECT
	t.fecha_transaccion,
	c.tipo_cuenta_id,
	dc.cliente_id,
	t.sucursal_id,
	t.tipo_transaccion_id,
	t.monto,
	c.saldo+t.monto AS 'saldo_antes',
	c.saldo AS 'saldo_despues',
	COUNT(t.id) AS 'numero_transacciones'
FROM transacciones t
INNER JOIN cuentas c ON c.id=t.numero_cuenta_origen_id
INNER JOIN detalle_cuentas dc ON dc.cuenta_id=c.id
WHERE t.tipo_transaccion_id='11'
GROUP BY 
	t.fecha_transaccion,
	c.tipo_cuenta_id,
	dc.cliente_id,
	t.sucursal_id,
	t.tipo_transaccion_id,
	t.monto,
	c.saldo;

SELECT*FROM tipos_transaccion;
SELECT*FROM tipos_cuenta;
SELECT*FROM transacciones;
SELECT*FROM cuentas;

USE dsrp_transacciones_bancarias_bi;
go

SELECT*FROM dim_tiempo;
SELECT*FROM dim_cliente;
SELECT*FROM dim_sucursal;
SELECT*FROM dim_cuenta;
SELECT*FROM dim_transacciones;
SELECT*FROM hechos_transacciones;


