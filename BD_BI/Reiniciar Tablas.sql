
DELETE FROM hechos_transacciones;
DBCC CHECKIDENT ('hechos_transacciones', RESEED, 0); 

DELETE FROM dim_tiempo;
DBCC CHECKIDENT ('dim_tiempo', RESEED, 0); 

DELETE FROM dim_cliente;
DBCC CHECKIDENT ('dim_cliente', RESEED, 0); 

DELETE FROM dim_sucursal;
DBCC CHECKIDENT ('dim_sucursal', RESEED, 0); 

DELETE FROM dim_transacciones;
DBCC CHECKIDENT ('dim_transacciones', RESEED, 0); 

DELETE FROM dim_cuenta;
DBCC CHECKIDENT ('dim_cuenta', RESEED, 0); 