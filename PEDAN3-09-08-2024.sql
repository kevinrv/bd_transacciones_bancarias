-- Creación de la base de datos
CREATE DATABASE dsrp_transacciones_bancarias;
Go
-- Seleccionamos la base de datos creada

USE dsrp_transacciones_bancarias;

-- Creación de schemas
CREATE schema Prueba;
DROP schema Prueba;

--Creación de tablas

CREATE TABLE clientes (
id INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
numero_documento VARCHAR(20) UNIQUE NOT NULL,
nombres VARCHAR(100) NOT NULL,
apellidos VARCHAR(100) NOT NULL,
direccion VARCHAR(255) NULL,
celular VARCHAR(15) NULL,
segemento VARCHAR(100) NULL
);

CREATE TABLE detalle_cuentas(
id INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
cliente_id INT NOT NULL,
cuenta_id INT NOT NULL
CONSTRAINT fk_cliente_detalle_cuentas FOREIGN KEY (cliente_id) REFERENCES clientes(id)
)

SELECT
	numero_documento,
	nombres
INTO #t01
FROM clientes;

SELECT*FROM #t01;