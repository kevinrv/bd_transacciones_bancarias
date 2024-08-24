 /*Consulta básica de selección
Ejercicio: Escribe una consulta que devuelva todos los clientes cuyo apellido sea "García".
Tablas involucradas: clientes
Pistas: Usa la cláusula WHERE con la columna apellidos.*/

SELECT*
FROM clientes
WHERE apellidos = 'Garcia';

SELECT*
FROM clientes
WHERE apellidos LIKE '%Garcia%';

/*Escribe una consulta para seleccionar todos los clientes cuyo nombre comience con la letra 'A'
y que pertenezcan al segmento "Empresarial".*/

SELECT*
FROM clientes
WHERE nombres LIKE 'A%' AND segemento='Empresarial';

/*Encuentra el saldo promedio de todas las cuentas en cada sucursal. 
Muestra el nombre de la sucursal junto con el saldo promedio.*/

SELECT
	s.nombre AS 'sucursal', 
	AVG(C.saldo) AS 'saldo_promedio'
FROM sucursales s
INNER JOIN cuentas c ON c.sucursal_origen_id=s.id
GROUP BY s.nombre
ORDER BY 2 DESC;

SELECT
	s.nombre AS 'sucursal', 
	AVG(C.saldo) AS 'saldo_promedio'
FROM sucursales s
INNER JOIN cuentas c ON c.sucursal_origen_id=s.id
GROUP BY s.nombre
HAVING AVG(c.saldo)>'50000'
ORDER BY s.nombre ASC;

/*Escribe una consulta que encuentre el nombre del cliente que tiene 
la cuenta con el saldo más alto*/


SELECT 
	c.nombres AS 'cliente',	
	cu.numero_cuenta, cu.saldo
FROM clientes c
	INNER JOIN detalle_cuentas dc ON dc.cliente_id=c.id
	INNER JOIN cuentas cu ON cu.id=dc.cuenta_id 
WHERE cu.saldo IN (SELECT MAX(saldo) FROM cuentas)
ORDER BY cu.saldo DESC;


