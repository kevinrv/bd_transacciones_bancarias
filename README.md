# bd_transacciones_bancarias
Pequeña base de datos para del curso PEDAN3 en DSRP, enfocado en el registro de transacciones bancarias.
Caso Propuesto: Sistema de Registro de Transacciones Bancarias
Contexto: Una entidad bancaria necesita un sistema para registrar y gestionar las transacciones realizadas por sus clientes. El sistema debe permitir almacenar información sobre clientes, cuentas bancarias, transacciones y sucursales.
Requisitos:
Clientes:
Cada cliente debe tener un identificador único.
Se debe almacenar el nombre, dirección, número de teléfono y correo electrónico del cliente, estado civil.
Cuentas Bancarias:
Cada cuenta bancaria debe tener un número de cuenta único.
Se debe registrar el tipo de cuenta (ahorros, corriente, etc.), el saldo actual y la fecha de apertura.
Una cuenta bancaria pertenece a un solo cliente, pero un cliente puede tener múltiples cuentas  a menos que sean cuentas mancomunadas.
Transacciones:
Cada transacción debe tener un identificador único.
Se debe registrar la fecha y hora de la transacción, el monto, el tipo de transacción (depósito, retiro, transferencia) y el número de cuenta asociado.
Las transferencias deben registrar tanto la cuenta de origen como la cuenta de destino.
Sucursales:
Cada sucursal debe tener un identificador único.
Se debe almacenar el nombre de la sucursal, la dirección y el número de teléfono.
Cada transacción debe estar asociada a una sucursal.
Entidades y Relaciones:
Cliente (ClienteID, Nombre, Dirección, Teléfono, CorreoElectrónico)
Cuenta (NumeroCuenta, TipoCuenta, Saldo, FechaApertura, ClienteID)
Transacción (TransacciónID, FechaHora, Monto, TipoTransacción, NumeroCuentaOrigen, NumeroCuentaDestino, SucursalID)
Sucursal (SucursalID, Nombre, Dirección, Teléfono)
Relaciones:
Un cliente puede tener múltiples cuentas (relación uno a muchos entre Cliente y Cuenta).
Una cuenta puede tener múltiples transacciones (relación uno a muchos entre Cuenta y Transacción).
Una sucursal puede tener múltiples transacciones (relación uno a muchos entre Sucursal y Transacción).

