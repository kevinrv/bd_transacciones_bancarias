USE dsrp_transacciones_bancarias;
/*Introducción
En esta masterclass, analizaremos un caso práctico basado en un modelo de datos de transacciones bancarias. Abordaremos buenas prácticas de diseño, optimización de consultas y estrategias de escalabilidad para mejorar el rendimiento de bases de datos a gran escala.
1. Explicación del Modelo de Datos
1.1. Entidades Principales
El modelo de datos está compuesto por las siguientes tablas:
Clientes: Contiene información personal y segmentación de los clientes.
Cuentas: Registra las cuentas bancarias con información como saldo, fecha de apertura y estado.
Transacciones: Almacena operaciones realizadas entre cuentas.
Sucursales: Lista las sucursales del banco.
Tipos de Cuenta y Tipos de Transacción: Catálogos de tipos de cuentas y tipos de transacciones disponibles.
1.2. Relación entre las Tablas
Cada cliente puede tener varias cuentas (relación 1 a N).
Una cuenta puede estar asociada a varias transacciones.
Cada transacción está relacionada con una sucursal y un tipo de transacción.
2. Optimización del Modelo de Datos
2.1. Normalización vs. Desnormalización
Se recomienda normalizar hasta la 3FN para evitar redundancia de datos.
En escenarios de consultas analíticas, se pueden aplicar técnicas de desnormalización para mejorar el rendimiento.
2.2. Indexación Estratégica
Índices Clustered en claves primarias.
Índices No Clustered en campos frecuentemente filtrados (e.g., numero_documento, numero_cuenta).
Fill Factor ajustado según la tasa de inserción y actualización de datos.
2.3. Particionamiento de Datos
Dividir tablas grandes como transacciones por rango de fechas.
Considerar filegroups separados para mejorar el acceso a datos históricos.

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
    c.nombre, 
    t.fecha_transaccion, 
    t.monto, 
    s.nombre AS sucursal
FROM 
    clientes c
JOIN 
    cuentas cu ON c.cliente_id = cu.cliente_id
JOIN 
    transacciones t ON cu.numero_cuenta_id = t.numero_cuenta_origen_id
JOIN 
    sucursales s ON t.sucursal_id = s.sucursal_id
WHERE 
    t.fecha_transaccion BETWEEN '2024-01-01' AND '2024-12-31'
    AND s.nombre = 'Sucursal Central';

-- Crear indices:
CREATE INDEX IX_cuentas_cliente
ON cuentas (cliente_id);


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
