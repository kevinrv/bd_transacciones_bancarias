USE dsrp_transacciones_bancarias;

-- Insercion de datos

-- Tipos_transaccion
INSERT INTO [dbo].[tipos_transaccion] ([nombre], [descripcion])
VALUES 
    ('Dep�sito', 'Ingreso de fondos a una cuenta bancaria.'),
    ('Retiro', 'Extracci�n de fondos de una cuenta bancaria.'),
    ('Transferencia', 'Movimiento de fondos de una cuenta a otra dentro del mismo banco.'),
    ('Pago de servicios', 'Pago de servicios como electricidad, agua, etc.'),
    ('Pago de pr�stamos', 'Pago de cuotas de pr�stamos o cr�ditos.'),
    ('Compra', 'Compra realizada a trav�s de una cuenta bancaria.'),
    ('Transferencia internacional', 'Movimiento de fondos de una cuenta a otra en un banco diferente en otro pa�s.');

SELECT*FROM tipos_transaccion;
DELETE FROM tipos_transaccion WHERE id=9; 

-- sucursales 
SELECT*FROM sucursales;

INSERT INTO [dbo].[sucursales] ([nombre], [direcci�n], [telefono])
VALUES 
    ('Sucursal Lima Centro', 'Av. Abancay 1234, Lima, Lima', '01-1234567'),
    ('Sucursal Arequipa', 'Calle Mercaderes 567, Arequipa, Arequipa', '054-234567'),
    ('Sucursal Trujillo', 'Av. Espa�a 789, Trujillo, La Libertad', '044-345678'),
    ('Sucursal Cusco', 'Av. El Sol 101, Cusco, Cusco', '084-456789'),
    ('Sucursal Piura', 'Av. Grau 202, Piura, Piura', '073-567890'),
    ('Sucursal Chiclayo', 'Calle Balta 303, Chiclayo, Lambayeque', '074-678901'),
    ('Sucursal Huancayo', 'Av. Ferrocarril 404, Huancayo, Jun�n', '064-789012'),
    ('Sucursal Iquitos', 'Calle Nauta 505, Iquitos, Loreto', '065-890123'),
    ('Sucursal Puno', 'Av. La Torre 606, Puno, Puno', '051-901234'),
    ('Sucursal Tacna', 'Av. San Martin 707, Tacna, Tacna', '052-012345'),    ('Sucursal Ayacucho', 'Av. Mariscal C�ceres 808, Ayacucho, Ayacucho', '066-123456'),
    ('Sucursal Cajamarca', 'Jr. Del Comercio 909, Cajamarca, Cajamarca', '076-234567'),
    ('Sucursal Hu�nuco', 'Av. Alameda de la Rep�blica 1010, Hu�nuco, Hu�nuco', '062-345678'),
    ('Sucursal Ica', 'Av. San Mart�n 1111, Ica, Ica', '056-456789'),
    ('Sucursal Juliaca', 'Av. Circunvalaci�n 1212, Juliaca, Puno', '051-567890'),
    ('Sucursal Tarapoto', 'Jr. Lima 1313, Tarapoto, San Mart�n', '042-678901'),
    ('Sucursal Tumbes', 'Av. Tumbes 1414, Tumbes, Tumbes', '072-789012'),
    ('Sucursal Chimbote', 'Av. Pardo 1515, Chimbote, �ncash', '043-890123'),
    ('Sucursal Moquegua', 'Av. Balta 1616, Moquegua, Moquegua', '053-901234'),
    ('Sucursal Pucallpa', 'Av. Centenario 1717, Pucallpa, Ucayali', '061-012345');

-- Inserci�n de datos en la tabla tipos_cuenta
INSERT INTO [dbo].[tipos_cuenta] ([nombre], [descripcion])
VALUES 
    ('Cuenta de Ahorros', 'Cuenta destinada a acumular dinero con la posibilidad de generar intereses.'),
    ('Cuenta Corriente', 'Cuenta que permite realizar dep�sitos y retiros frecuentes, adem�s de emitir cheques.'),
    ('Cuenta a Plazo Fijo', 'Cuenta que requiere mantener un dep�sito por un per�odo espec�fico para ganar un inter�s fijo.'),
    ('Cuenta Remunerada', 'Cuenta que ofrece una tasa de inter�s m�s alta a cambio de mantener un saldo m�nimo.'),
    ('Cuenta Empresarial', 'Cuenta dise�ada para manejar las finanzas de empresas o negocios.'),
    ('Cuenta en Moneda Extranjera', 'Cuenta que permite manejar dinero en divisas extranjeras, como d�lares o euros.'),
    ('Cuenta de Ahorro Programado', 'Cuenta para ahorrar regularmente con un objetivo espec�fico a largo plazo.'),
    ('Cuenta CTS', 'Cuenta para la Compensaci�n por Tiempo de Servicios, destinada a trabajadores en planilla.'),
    ('Cuenta de N�mina', 'Cuenta utilizada por empleados para recibir sus salarios de manera directa.'),
    ('Cuenta de Inversi�n', 'Cuenta dise�ada para manejar fondos destinados a inversiones en diferentes instrumentos financieros.');

-- Verificaci�n de los datos insertados
SELECT * FROM [dbo].[tipos_cuenta];
GO

INSERT INTO [dbo].[clientes] ([numero_documento], [nombres], [apellidos], [direccion], [celular], [segemento])
VALUES 
    ('DNI12345678', 'Juan', 'Perez Garcia', 'Av. Los Olivos 123, Lima', '987654321', 'Personal'),
    ('DNI87654321', 'Maria', 'Lopez Fernandez', 'Calle Las Flores 456, Arequipa', '987654322', 'Personal'),
    ('DNI23456789', 'Carlos', 'Sanchez Torres', 'Jr. Amazonas 789, Trujillo', '987654323', 'Personal'),
    ('DNI98765432', 'Ana', 'Martinez Ramirez', 'Av. Los Andes 101, Cusco', '987654324', 'Personal'),
    ('DNI34567890', 'Luis', 'Diaz Chavez', 'Calle San Martin 202, Piura', '987654325', 'Personal'),
    ('DNI09876543', 'Elena', 'Mendoza Rojas', 'Jr. Progreso 303, Chiclayo', '987654326', 'Personal'),
    ('DNI45678901', 'Ricardo', 'Vega Paredes', 'Av. La Paz 404, Huancayo', '987654327', 'Empresarial'),
    ('DNI10987654', 'Sofia', 'Cruz Vargas', 'Calle Independencia 505, Iquitos', '987654328', 'Personal'),
    ('DNI56789012', 'Jorge', 'Gomez Diaz', 'Av. Grau 606, Puno', '987654329', 'Empresarial'),
    ('DNI21098765', 'Patricia', 'Gutierrez Soto', 'Jr. Union 707, Tacna', '987654330', 'Personal'),
    ('DNI67890123', 'Fernando', 'Reyes Huaman', 'Av. Arequipa 808, Lima', '987654331', 'Personal'),
    ('DNI32100876', 'Lucia', 'Ortiz Flores', 'Calle Lima 909, Ayacucho', '987654332', 'Empresarial'),
    ('DNI78901234', 'Alberto', 'Paredes Lujan', 'Av. Salaverry 1010, Cajamarca', '987654333', 'Personal'),
    ('DNI43210987', 'Camila', 'Ramos Espinoza', 'Jr. San Francisco 1111, Hu�nuco', '987654334', 'Personal'),
    ('DNI89012345', 'Martin', 'Salazar Aquino', 'Av. Panamericana 1212, Ica', '987654335', 'Empresarial'),
    ('DNI54321098', 'Andrea', 'Quispe Salas', 'Calle Amazonas 1313, Juliaca', '987654336', 'Personal'),
    ('DNI90123456', 'Gonzalo', 'Soto Guevara', 'Jr. Loreto 1414, Tarapoto', '987654337', 'Empresarial'),
    ('DNI65432109', 'Daniela', 'Montes Torres', 'Av. Los H�roes 1515, Tumbes', '987654338', 'Personal'),
    ('DNI01234567', 'Raul', 'C�ceres Flores', 'Calle Grau 1616, Chimbote', '987654339', 'Empresarial'),
    ('DNI76543210', 'Veronica', 'Palacios Reyes', 'Av. San Mart�n 1717, Moquegua', '987654340', 'Personal'),
	 ('DNI12345987', 'Esteban', 'Navarro Calder�n', 'Calle Los Jardines 18, Lima', '987654341', 'Empresarial'),
    ('DNI87654432', 'Valeria', 'Suarez Campos', 'Av. Grau 19, Arequipa', '987654342', 'Personal'),
    ('DNI23456776', 'Gabriel', 'Fernandez Aguilar', 'Jr. La Uni�n 20, Trujillo', '987654343', 'Empresarial'),
    ('DNI98765487', 'Monica', 'Pe�a Arce', 'Av. Las Palmeras 21, Cusco', '987654344', 'Personal'),
    ('DNI34567865', 'Nicolas', 'Mora Villanueva', 'Calle Lima 22, Piura', '987654345', 'Empresarial'),
    ('DNI09876554', 'Adriana', 'Rios Benavides', 'Av. El Sol 23, Chiclayo', '987654346', 'Personal'),
    ('DNI45678943', 'Emilio', 'Salas Estrada', 'Calle La Merced 24, Huancayo', '987654347', 'Empresarial'),
    ('DNI10987698', 'Karina', 'Carrasco Guerrero', 'Av. Los Incas 25, Iquitos', '987654348', 'Personal'),
    ('DNI56789087', 'Diego', 'Arroyo Olivares', 'Calle San Miguel 26, Puno', '987654349', 'Empresarial'),
    ('DNI21098754', 'Isabella', 'Hernandez Chacon', 'Av. Amazonas 27, Tacna', '987654350', 'Personal'),
    ('DNI67890145', 'Mateo', 'Castro Romero', 'Calle Col�n 28, Lima', '987654351', 'Empresarial'),
    ('DNI32109876', 'Samantha', 'Le�n Padilla', 'Av. Per� 29, Ayacucho', '987654352', 'Personal'),
    ('DNI78901209', 'Francisco', 'Ortega Sol�s', 'Calle La Paz 30, Cajamarca', '987654353', 'Empresarial'),
    ('DNI43210965', 'Natalia', 'Ramirez Cabrera', 'Av. Central 31, Hu�nuco', '987654354', 'Personal'),
    ('DNI89012320', 'Hector', 'Delgado Escobar', 'Calle Arica 32, Ica', '987654355', 'Empresarial'),
    ('DNI54321089', 'Ximena', 'Paredes Villanueva', 'Av. Argentina 33, Juliaca', '987654356', 'Personal'),
    ('DNI90123409', 'Pablo', 'Reyes Villegas', 'Calle San Mart�n 34, Tarapoto', '987654357', 'Empresarial'),
    ('DNI65432199', 'Florencia', 'Silva C�ceres', 'Av. Pardo 35, Tumbes', '987654358', 'Personal'),
    ('DNI01234589', 'Sebastian', 'Valverde Contreras', 'Calle Grau 36, Chimbote', '987654359', 'Empresarial'),
    ('DNI76543219', 'Mia', 'Torres Sotomayor', 'Av. Tupac Amaru 37, Moquegua', '987654360', 'Personal'),
    ('DNI12345689', 'Alonso', 'Zambrano Ojeda', 'Calle 28 de Julio 38, Lima', '987654361', 'Empresarial'),
    ('DNI87654388', 'Luciana', 'Cordero Torres', 'Av. Ej�rcito 39, Arequipa', '987654362', 'Personal'),
    ('DNI23456898', 'Tomas', 'Mu�oz Gonzales', 'Calle Bol�var 40, Trujillo', '987654363', 'Empresarial'),
    ('DNI98765334', 'Fernanda', 'Guzm�n Ch�vez', 'Av. Sucre 41, Cusco', '987654364', 'Personal'),
    ('DNI34567987', 'Mario', 'Serrano Ramos', 'Calle Larco 42, Piura', '987654365', 'Empresarial'),
    ('DNI09876532', 'Angela', 'Lozano Mel�ndez', 'Av. Benavides 43, Chiclayo', '987654366', 'Personal'),
    ('DNI45678977', 'Ignacio', 'Vega Palacios', 'Calle Jun�n 44, Huancayo', '987654367', 'Empresarial'),
    ('DNI10987643', 'Mariana', 'Sandoval D�az', 'Av. El Sol 45, Iquitos', '987654368', 'Personal'),
    ('DNI56789056', 'Cesar', 'Mendoza Campos', 'Calle San Jos� 46, Puno', '987654369', 'Empresarial'),
    ('DNI21098734', 'Paola', 'Herrera Cruz', 'Av. Bol�var 47, Tacna', '987654370', 'Personal'),
    ('DNI67890234', 'Joaqu�n', 'Romero Delgado', 'Calle Los Pr�ceres 48, Lima', '987654371', 'Empresarial'),
    ('DNI32109854', 'Daniela', 'V�squez Cuenca', 'Av. Grau 49, Ayacucho', '987654372', 'Personal'),
    ('DNI78901345', 'Rodrigo', 'Gonz�lez Morales', 'Calle Arequipa 50, Cajamarca', '987654373', 'Empresarial'),
    ('DNI43210911', 'Andrea', 'Luna Villanueva', 'Av. Espa�a 51, Hu�nuco', '987654374', 'Personal'),
    ('DNI89012432', 'Benjamin', 'Jim�nez Cabrera', 'Calle Grau 52, Ica', '987654375', 'Empresarial'),
    ('DNI54321234', 'Valentina', 'Pe�a Torres', 'Av. La Marina 53, Juliaca', '987654376', 'Personal'),
    ('DNI90123546', 'Oliver', 'Rivera Mendoza', 'Calle Los H�roes 54, Tarapoto', '987654377', 'Empresarial'),
    ('DNI65432345', 'Camila', '�vila Jim�nez', 'Av. Los Pinos 55, Tumbes', '987654378', 'Personal'),
    ('DNI01234678', 'Julian', 'Cruz Villanueva', 'Calle Las Palmeras 56, Chimbote', '987654379', 'Empresarial'),
    ('DNI76543323', 'Renata', 'Garc�a Benavides', 'Av. Cusco 57, Moquegua', '987654380', 'Personal'),
    ('DNI12345789', 'Leonardo', 'Castillo Zamora', 'Calle Los �lamos 58, Lima', '987654381', 'Empresarial'),
    ('DNI87654422', 'Sofia', 'Guzm�n Aguirre', 'Av. Aviaci�n 59, Arequipa', '987654382', 'Personal'),
    ('DNI23456987', 'Diego', 'Montoya Flores', 'Calle Ayacucho 60, Trujillo', '987654383', 'Empresarial'),
    ('DNI98765234', 'Ariana', 'Santos G�mez', 'Av. Los Libertadores 61, Cusco', '987654384', 'Personal'),
    ('DNI34567822', 'Felipe', 'Cornejo Aguirre', 'Calle Bol�var 62, Piura', '987654385', 'Empresarial'),
    ('DNI09876509', 'Alicia', 'L�pez Fern�ndez', 'Av. Javier Prado 63, Chiclayo', '987654386', 'Personal');


	SELECT*FROM clientes;

	-- Insertar datos en la tabla cuentas y detalle_cuentas
	SELECT*FROM tipos_cuenta;

	SELECT * FROM cuentas;

	INSERT INTO cuentas
	VALUES
	(1,'3647007245101015','150','2023-11-14','Activo');

	
	-- Insersi�n aleatoria

DECLARE @Counter INT
DECLARE @cliente_id INT
SET @Counter = 0
SET @cliente_id = 0


WHILE @Counter < 1000
BEGIN
INSERT INTO cuentas (tipo_cuenta_id,numero_cuenta,saldo,fecha_apertura,estado)
SELECT 
  t.id AS 'tipo_cuenta_id',
  CONCAT('0001',CAST(ROUND(RAND() * 1000000,0) AS VARCHAR(50)),CAST(ROUND(RAND() * 1000000,0) AS VARCHAR(50))) AS numero_cuenta, -- N�mero de cuenta aleatorio
  ROUND(RAND() * 100000, 2) AS saldo, -- Saldo aleatorio
  DATEADD(DAY, -ROUND(RAND() * 780,0), GETDATE()) AS fecha_pertura, -- Fecha de apertura en los �ltimos 365 d�as
  ROUND(RAND(),0) AS estado -- Estado aleatorio (0 o 1),
FROM clientes c
CROSS JOIN tipos_cuenta t
ORDER BY NEWID()
OFFSET 0 ROWS
FETCH NEXT 1 ROWS ONLY;
    SET @Counter = @Counter + 1
	-- Capturar un id aleatorio de la tabal cliente
	SET @cliente_id = (SELECT TOP 1 id FROM clientes ORDER BY NEWID())
	-- Insertar datos en la tabla detalle_cuentas
	INSERT INTO detalle_cuentas VALUES(@cliente_id,SCOPE_IDENTITY())
END

SELECT NEWID();

-- Uniformizando tama�o del n�mero de cuentas
UPDATE cuentas SET numero_cuenta= CONCAT(numero_cuenta,numero_cuenta,numero_cuenta)
WHERE LEN(numero_cuenta)<16


-- UPDATE 1 es a activo y 0 es a inactivo

UPDATE cuentas SET estado='Activo'
WHERE estado='1';

UPDATE cuentas SET estado='Inactivo'
WHERE estado='0';

--Resetear el Id Identity de una tabla
DBCC CHECKIDENT ('cuentas', RESEED, 0); 
DBCC CHECKIDENT ('detalle_cuentas', RESEED, 0); 

SELECT*
INTO cuentas_copy
FROM cuentas;

SELECT*FROM detalle_cuentas;

SELECT*FROM cuentas_copy;

-- Insersi�n de datos en transacciones.
