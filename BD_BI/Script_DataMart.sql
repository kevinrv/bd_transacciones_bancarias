USE dsrp_transacciones_bancarias_bi;

CREATE TABLE [dim_tiempo] (
	[id] INTEGER NOT NULL IDENTITY UNIQUE,
	[dia] VARCHAR,
	[mes] VARCHAR,
	[trimestre] VARCHAR,
	[anio] VARCHAR,
	PRIMARY KEY([id])
);
GO

CREATE TABLE [dim_cliente] (
	[id] INTEGER NOT NULL IDENTITY UNIQUE,
	[nombre] VARCHAR,
	[segmento] VARCHAR,
	PRIMARY KEY([id])
);
GO

CREATE TABLE [dim_cuenta] (
	[id] INTEGER NOT NULL IDENTITY UNIQUE,
	[numero_cuenta] VARCHAR,
	[tipo_cuenta] VARCHAR,
	PRIMARY KEY([id])
);
GO

CREATE TABLE [dim_sucursal] (
	[id] INTEGER NOT NULL IDENTITY UNIQUE,
	[nombre] VARCHAR,
	[ciudad] VARCHAR,
	[region] VARCHAR,
	PRIMARY KEY([id])
);
GO

CREATE TABLE [dim_transacciones] (
	[id] INTEGER NOT NULL IDENTITY UNIQUE,
	[tipo_transaccion] VARCHAR,
	PRIMARY KEY([id])
);
GO

CREATE TABLE [hechos_transacciones] (
	[id] INTEGER NOT NULL IDENTITY UNIQUE,
	[dim_tiempo_id] INTEGER,
	[dim_cuenta_id] INTEGER,
	[dim_cliente_id] INTEGER,
	[dim_sucursal_id] INTEGER,
	[dim_transaccion_id] INTEGER,
	[monto] MONEY,
	[saldo_antes] MONEY,
	[saldo_despues] MONEY,
	[numero_transacciones] INTEGER,
	PRIMARY KEY([id])
);
GO

-- Relaciones con la tabla hechos
SELECT*FROM hechos_transacciones;

ALTER TABLE [hechos_transacciones]
ADD CONSTRAINT FK_hechos_dim_tiempo FOREIGN KEY (dim_tiempo_id) REFERENCES dim_tiempo(id);

ALTER TABLE [hechos_transacciones]
ADD CONSTRAINT FK_hechos_dim_cuenta FOREIGN KEY (dim_cuenta_id) REFERENCES dim_cuenta(id);

ALTER TABLE [hechos_transacciones]
ADD CONSTRAINT FK_hechos_dim_cliente FOREIGN KEY (dim_cliente_id) REFERENCES dim_cliente(id);

ALTER TABLE [hechos_transacciones]
ADD CONSTRAINT FK_hechos_dim_sucursal FOREIGN KEY (dim_sucursal_id) REFERENCES dim_sucursal(id);

ALTER TABLE [hechos_transacciones]
ADD CONSTRAINT FK_hechos_dim_transacciones FOREIGN KEY (dim_transaccion_id) REFERENCES dim_transacciones(id);

