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
--Tabla tipo de cuentas

CREATE TABLE tipos_cuenta (
id INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
nombre VARCHAR(100) NOT NULL,
descripcion VARCHAR(1000)
);

-- Tabla cuentas

CREATE TABLE cuentas (
id INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
tipo_cuenta_id INT,
numero_cuenta VARCHAR(55) UNIQUE NOT NULL,
saldo MONEY NOT NULL,
fecha_apertura DATETIME DEFAULT GETDATE() NOT NULL,
estado VARCHAR(20) NOT NULL
CONSTRAINT fk_cuentas_tipo_cuenta FOREIGN KEY (tipo_cuenta_id) REFERENCES tipos_cuenta(id)
);


-- Tabla detalle cuentas
CREATE TABLE detalle_cuentas(
id INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
cliente_id INT NOT NULL,
cuenta_id INT NOT NULL
CONSTRAINT fk_cliente_detalle_cuentas FOREIGN KEY (cliente_id) REFERENCES clientes(id),
CONSTRAINT fk_cuentas_detalle_cuentas FOREIGN KEY (cuenta_id) REFERENCES cuentas(id)
);

-- Tabla tipos transacción 

CREATE TABLE tipos_transaccion (
id INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
nombre VARCHAR(100) NOT NULL,
descripcion VARCHAR(1000)
);

-- Tabla sucursales

CREATE TABLE sucursales (
id INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
nombre VARCHAR(100) NOT NULL,
dirección VARCHAR(255) NOT NULL,
telefono VARCHAR(20) NULL
)

-- Tabla transacciones

CREATE TABLE transacciones (
id INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
tipo_transaccion_id INT NOT NULL,
sucursal_id INT NOT NULL,
numero_cuenta_origen_id INT NULL,
numero_cuenta_destino_id INT NULL,
fecha_transaccion DATETIME DEFAULT GETDATE() NOT NULL,
monto MONEY NOT NULL,
created_at DATETIME DEFAULT GETDATE() NOT NULL,
updated_at DATETIME NULL,
deleted_at DATETIME NULL,
created_by INT NOT NULL,
updated_by INT NULL,
deleted_by INT NULL
CONSTRAINT fk_transacciones_tipo_transaccion FOREIGN KEY (tipo_transaccion_id) REFERENCES tipos_transaccion(id),
CONSTRAINT fk_transacciones_sucursales FOREIGN KEY (sucursal_id) REFERENCES sucursales(id),
CONSTRAINT fk_transacciones_cuenta_origen FOREIGN KEY (numero_cuenta_origen_id) REFERENCES cuentas(id),
CONSTRAINT fk_transacciones_cuenta_destino FOREIGN KEY (numero_cuenta_destino_id) REFERENCES cuentas(id)
);

-- modificaciones

-- Agregar un nueva columna a la tabla cuentas
ALTER TABLE cuentas 
ADD sucursal_origen_id INT;
--- Editar columna tiene que ser not null
ALTER TABLE cuentas 
ALTER COLUMN sucursal_origen_id INT NOT NULL;

-- Agregar un FK
ALTER TABLE cuentas
ADD CONSTRAINT fk_cuentas_sucursal_origen FOREIGN KEY (sucursal_origen_id) REFERENCES sucursales(id);