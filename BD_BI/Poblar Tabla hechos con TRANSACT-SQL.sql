USE dsrp_transacciones_bancarias;
GO


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
INTO #t01
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
	c.saldo;

INSERT INTO dsrp_transacciones_bancarias_bi.dbo.hechos_transacciones
SELECT
	tm.id AS 'dim_tiempo_id',
	c.id AS 'dim_cuenta_id',
	cl.id AS 'dim_cliente_id',
	s.id AS 'dim_sucursal_id',
	tr.id AS 'dim_transaccion_id',
	t.monto,
	t.saldo_antes,
	t.saldo_despues,
	t.numero_transacciones
FROM #t01 t
INNER JOIN dsrp_transacciones_bancarias_bi.dbo.dim_tiempo tm ON tm.fecha_transaccion=t.fecha_transaccion
INNER JOIN dsrp_transacciones_bancarias_bi.dbo.dim_cuenta c ON c.tipo_cuenta_id=t.tipo_cuenta_id
INNER JOIN dsrp_transacciones_bancarias_bi.dbo.dim_cliente cl ON cl.cliente_id=t.cliente_id
INNER JOIN dsrp_transacciones_bancarias_bi.dbo.dim_sucursal s ON s.sucursal_id=t.sucursal_id
INNER JOIN dsrp_transacciones_bancarias_bi.dbo.dim_transacciones tr ON tr.tipo_transaccion_id=t.tipo_transaccion_id;

SELECT*FROM dsrp_transacciones_bancarias_bi.dbo.hechos_transacciones;
