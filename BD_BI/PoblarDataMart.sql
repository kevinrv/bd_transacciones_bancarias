USE dsrp_transacciones_bancarias;
GO

-- Consulta para poblar la dimensión cliente

SELECT
	CONCAT(nombres,' ',apellidos) AS 'nombre',
	segemento AS 'segmento',
	id AS 'cliente_id'
FROM clientes;

-- Consulta para poblar la dimensión cuenta

SELECT 
	c.numero_cuenta,
	tc.nombre AS 'tipo_cuenta',
	c.id AS 'cuenta_id'
FROM cuentas c
	INNER JOIN tipos_cuenta tc ON tc.id=c.tipo_cuenta_id;

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
	DAY(fecha_transaccion) AS 'dia',
	MONTH(fecha_transaccion) AS 'mes',
	DATEPART(QUARTER,fecha_transaccion) AS 'trimestre',
	YEAR(fecha_transaccion) AS 'anio',
	fecha_transaccion,
	DATENAME(MONTH,fecha_transaccion) 'nombre_mes'
FROM transacciones; 

-- Consulta para poblar la tabla hechos transacciones

SELECT
	t.fecha_transaccion,
	c.tipo_cuenta_id,
	dc.cliente_id,
	t.sucursal_id,
	t.tipo_transaccion_id,
	SUM(monto),
	COUNT(*)
FROM transacciones t
INNER JOIN cuentas c ON c.id=numero_cuenta_origen_id
INNER JOIN detalle_cuentas dc ON dc.cuenta_id=c.id
GROUP BY 
	t.fecha_transaccion,
	c.tipo_cuenta_id,
	dc.cliente_id,
	t.sucursal_id,
	t.tipo_transaccion_id,
	monto;

SELECT*FROM tipos_cuenta;