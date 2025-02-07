USE dsrp_transacciones_bancarias;
/*Introducción
2. Optimización del Modelo de Datos
2.1. Normalización vs. Desnormalización
Se recomienda normalizar hasta la 3FN para evitar redundancia de datos.
En escenarios de consultas analíticas, se pueden aplicar técnicas de desnormalización para mejorar el rendimiento.
2.2. Indexación Estratégica
Índices Clustered en claves primarias.
Índices No Clustered en campos frecuentemente filtrados (e.g., numero_documento, numero_cuenta).
Fill Factor ajustado según la tasa de inserción y actualización de datos.


Tasa de Inserción/Actualización	Recomendación de Fill Factor
Baja (consultas mayormente de lectura)	90-100%
Moderada (mezcla de lecturas y escrituras)	80-90%
Alta (frecuentes inserciones/actualizaciones)	70-80%
Muy Alta (intenso flujo de datos, como registros de transacciones)	50-70%
*/
CREATE INDEX IX_transacciones_fecha
ON transacciones (fecha_transaccion)
WITH (FILLFACTOR = 80);

/*
2.3. Particionamiento de Datos
Dividir tablas grandes como transacciones por rango de fechas.
Considerar filegroups separados para mejorar el acceso a datos históricos.

*/
-- Crear filegroup para 2022
ALTER DATABASE dsrp_transacciones_bancarias
ADD FILEGROUP FG_Transacciones_2022;

ALTER DATABASE dsrp_transacciones_bancarias
ADD FILE (
    NAME = 'Transacciones_2022',
    FILENAME = 'C:\Data\Transacciones_2022.ndf'
) TO FILEGROUP FG_Transacciones_2022;

-- Crear filegroup para 2023
ALTER DATABASE dsrp_transacciones_bancarias
ADD FILEGROUP FG_Transacciones_2023;

ALTER DATABASE dsrp_transacciones_bancarias
ADD FILE (
    NAME = 'Transacciones_2023',
    FILENAME = 'C:\Data\Transacciones_2023.ndf'
) TO FILEGROUP FG_Transacciones_2023;

-- Filegroup predeterminado para datos actuales (2024-2025)
ALTER DATABASE dsrp_transacciones_bancarias
MODIFY FILEGROUP [PRIMARY] DEFAULT;


CREATE PARTITION FUNCTION PF_TransaccionesPorFecha (DATE)
AS RANGE LEFT FOR VALUES 
('2022-12-31', '2023-12-31');
/*

3. Optimización de Consultas
3.1. Uso de EXPLAIN y STATISTICS

Ejemplo de análisis de una consulta:*/

SET STATISTICS IO, TIME ON;
SELECT * FROM transacciones WHERE monto > 10;

/*Evaluar lecturas lógicas y tiempos de ejecución.

Agregar índices si la búsqueda es recurrente.

3.2. Evitar Escaneos Ineficientes

Reemplazar SELECT * por columnas específicas.

Optimizar JOIN con índices adecuados.*/
SELECT 
    c.nombres, 
    t.fecha_transaccion, 
    t.monto, 
    s.nombre AS sucursal
FROM 
    clientes c
INNER JOIN
	detalle_cuentas dt ON dt.cliente_id=c.id
INNER JOIN 
    cuentas cu ON cu.id = dt.cuenta_id
INNER JOIN 
    transacciones t ON cu.id = t.numero_cuenta_origen_id
INNER JOIN 
    sucursales s ON t.sucursal_id = s.id
WHERE 
    t.fecha_transaccion BETWEEN '2022-01-01' AND '2024-12-31'
    AND s.nombre = 'Sucursal Lima Centro';

SELECT*FROM sucursales;
-- Crear indices:
CREATE INDEX IX_cuentas_cliente
ON detalle_cuentas (cliente_id);


/*
Usar COVERING INDEX en consultas comunes.
*/
CREATE INDEX IX_transacciones_covering
ON transacciones (numero_cuenta_origen_id, sucursal_id, fecha_transaccion)
INCLUDE (monto);

/*
Activar estadisticas
SET STATISTICS TIME ON;
SET STATISTICS IO ON;

4. Estrategias de Escalabilidad
4.1. Implementación de Query Store
Habilitar QUERY_STORE para monitoreo de consultas.
Identificar y optimizar consultas de alto consumo.

4.2. Uso de Snapshot Isolation
Habilitar READ_COMMITTED_SNAPSHOT para reducir bloqueos.

4.3. Arquitectura para Big Data
Implementar particionamiento horizontal si la carga de datos es muy alta.
Usar Columnstore Index en consultas analíticas.*/
