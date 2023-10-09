##FUNCIONES
DELIMITER //

CREATE FUNCTION InsertarCliente(
    p_name VARCHAR(150),
    p_document_type INT,
    p_document_number VARCHAR(20),
    p_address VARCHAR(50),
    p_telephone VARCHAR(50)
)
RETURNS INT
BEGIN
    DECLARE new_user_id INT;

    INSERT INTO CLIENTES (NAME, DOCUMENT_TYPE, DOCUMENT_NUMBER, ADDRESS, TELEPHONE)
    VALUES (p_name, p_document_type, p_document_number, p_address, p_telephone);

    SET new_user_id = LAST_INSERT_ID();

    RETURN new_user_id;
END;
//

DELIMITER ;

SELECT InsertarCliente('Juan Pérez', 1, '12345678', 'Calle 123', '123-456-7890');
##concatenar nombre y apellidos de clientes 
SELECT CONCAT(Nombre, ' ', Apellido) AS NombreCompleto FROM Clientes;

##calcular de pedidos por cliente
SELECT ID_Cliente, AVG(Monto) AS PromedioMonto FROM Pedidos GROUP BY ID_Cliente;



DELIMITER //

CREATE FUNCTION InsertarFicha(
    p_user_id INT,
    p_numero_pedido VARCHAR(150),
    p_fecha_pedido DATE,
    p_direccion VARCHAR(50),
    p_descripcion_pedido VARCHAR(50)
)
RETURNS INT
BEGIN
    DECLARE new_id_ficha INT;

    INSERT INTO FICHA (USER_ID, `NRO. DE PEDIDO`, `DATE`, ADDRESS, DESCRIPTION)
    VALUES (p_user_id, p_numero_pedido, p_fecha_pedido, p_direccion, p_descripcion_pedido);

    SET new_id_ficha = LAST_INSERT_ID();

    RETURN new_id_ficha;
END;
//

DELIMITER ;

SELECT InsertarFicha(1, '123ABC', '2023-08-08', 'Calle 123', 'Descripción de la ficha');

DELIMITER //

CREATE FUNCTION InsertarCarta(
    p_description VARCHAR(50),
    p_stock VARCHAR(150),
    p_price DECIMAL(9, 2)
)
RETURNS INT
BEGIN
    DECLARE new_id_carta INT;

    INSERT INTO CARTAS (DESCRIPTION, STOCK, PRICE)
    VALUES (p_description, p_stock, p_price);

    SET new_id_carta = LAST_INSERT_ID();

    RETURN new_id_carta;
END;
//

DELIMITER ;

SELECT InsertarCarta('Carta de ejemplo', '50', 5.99);

##Calcular el total de cartas disponibles en stock
SELECT SUM(CAST(STOCK AS INT)) AS TotalCartasEnStock FROM CARTAS;

##obtener la cantidad de cartas agrepadas por rango de precio 
SELECT
    CASE
        WHEN PRICE <= 5 THEN 'Bajo'
        WHEN PRICE <= 10 THEN 'Medio'
        ELSE 'Alto'
    END AS RangoPrecio,
    COUNT(*) AS TotalCartas
FROM CARTAS
GROUP BY RangoPrecio;
##calcular el precio promedio por carta 
SELECT AVG(PRICE) AS PrecioPromedio FROM CARTAS;

##calcular el total de cartas por cierta descripcion 
SELECT COUNT(*) AS TotalCartasDescripcion FROM CARTAS WHERE DESCRIPTION LIKE '%magia%';

##calcular el rango de precios de cartas 
SELECT MAX(PRICE) - MIN(PRICE) AS RangoPrecios FROM CARTAS;

##Obtener el precio mínimo por carta
SELECT MIN(PRICE) AS PrecioMinimo FROM CARTAS;

##Obtener el precio máximo por carta
SELECT MAX(PRICE) AS PrecioMaximo FROM CARTAS;

##Obtener la cantidad de cartas agrupadas por rango de precios
SELECT
    CASE
        WHEN PRICE <= 5 THEN 'Bajo'
        WHEN PRICE <= 10 THEN 'Medio'
        ELSE 'Alto'
    END AS RangoPrecio,
    COUNT(*) AS TotalCartas
FROM CARTAS
GROUP BY RangoPrecio;

##insertar una carta en un pedido
DELIMITER //

CREATE FUNCTION InsertarCartaEnPedido(
    p_id_carta INT,
    p_id_pedido INT,
    p_quantity VARCHAR(150)
)
RETURNS INT
BEGIN
    DECLARE new_id_carta_pedido INT;

    INSERT INTO CARTAS_POR_PEDIDO (ID_CARTA, ID_PEDIDO, QUANTITY)
    VALUES (p_id_carta, p_id_pedido, p_quantity);

    SET new_id_carta_pedido = LAST_INSERT_ID();

    RETURN new_id_carta_pedido;
END;
//

DELIMITER ;

##calcular la cantidad total de cartas en un pedido

DELIMITER //

CREATE FUNCTION CalcularCantidadTotalCartasEnPedido(p_id_pedido INT)
RETURNS INT
BEGIN
    DECLARE total_cartas INT;

    SELECT SUM(CAST(QUANTITY AS INT)) INTO total_cartas
    FROM CARTAS_POR_PEDIDO
    WHERE ID_PEDIDO = p_id_pedido;

    RETURN total_cartas;
END;
//

DELIMITER ;

## insertar un nuevo pedido
DELIMITER //

CREATE FUNCTION InsertarPedido(
    p_user_id INT,
    p_date DATE,
    p_monto DECIMAL(9, 2)
)
RETURNS INT
BEGIN
    DECLARE new_id_pedido INT;

    INSERT INTO PEDIDOS (USER_ID, DATE, MONTO)
    VALUES (p_user_id, p_date, p_monto);

    SET new_id_pedido = LAST_INSERT_ID();

    RETURN new_id_pedido;
END;
//

DELIMITER ;

## calcular el monto total de pedidos por usuario
DELIMITER //

CREATE FUNCTION CalcularMontoTotalPedidos(p_user_id INT)
RETURNS DECIMAL(9, 2)
BEGIN
    DECLARE total_monto DECIMAL(9, 2);

    SELECT SUM(MONTO) INTO total_monto
    FROM PEDIDOS
    WHERE USER_ID = p_user_id;

    RETURN total_monto;
END;
//

DELIMITER ;

##actualizar la fecha de un pedido
DELIMITER //

CREATE FUNCTION ActualizarFechaPedido(p_id_pedido INT, p_nueva_fecha DATE)
RETURNS VARCHAR(100)
BEGIN
    DECLARE mensaje VARCHAR(100);

    -- Verificar si el pedido existe
    IF NOT EXISTS (SELECT * FROM PEDIDOS WHERE ID_PEDIDO = p_id_pedido) THEN
        SET mensaje = 'El pedido no existe.';
    ELSE
        -- Realizar la actualización de la fecha
        UPDATE PEDIDOS
        SET DATE = p_nueva_fecha
        WHERE ID_PEDIDO = p_id_pedido;

        SET mensaje = 'Fecha de pedido actualizada exitosamente.';
    END IF;

    RETURN mensaje;
END;
//

DELIMITER ;
##eliminar un pedido
DELIMITER //

CREATE FUNCTION EliminarPedido(p_id_pedido INT)
RETURNS VARCHAR(100)
BEGIN
    DECLARE mensaje VARCHAR(100);

    -- Verificar si el pedido existe
    IF NOT EXISTS (SELECT * FROM PEDIDOS WHERE ID_PEDIDO = p_id_pedido) THEN
        SET mensaje = 'El pedido no existe.';
    ELSE
        -- Realizar la eliminación del pedido
        DELETE FROM PEDIDOS
        WHERE ID_PEDIDO = p_id_pedido;

        SET mensaje = 'Pedido eliminado exitosamente.';
    END IF;

    RETURN mensaje;
END;
//

DELIMITER ;

##registrar un nuevo envío
DELIMITER //

CREATE FUNCTION RegistrarEnvio(
    p_id_pedido INT,
    p_date DATE,
    p_address VARCHAR(150),
    p_monto DECIMAL(9, 2)
)
RETURNS INT
BEGIN
    DECLARE new_id_envio INT;

    INSERT INTO ENVIOS (ID_PEDIDO, DATE, ADDRESS, MONTO)
    VALUES (p_id_pedido, p_date, p_address, p_monto);

    SET new_id_envio = LAST_INSERT_ID();

    RETURN new_id_envio;
END;
//

DELIMITER ;

##calcular el monto total de envíos por pedido
DELIMITER //

CREATE FUNCTION CalcularMontoTotalEnvios(p_id_pedido INT)
RETURNS DECIMAL(9, 2)
BEGIN
    DECLARE total_monto DECIMAL(9, 2);

    SELECT SUM(MONTO) INTO total_monto
    FROM ENVIOS
    WHERE ID_PEDIDO = p_id_pedido;

    RETURN total_monto;
END;
//

DELIMITER ;

##actualizar la dirección de envío
DELIMITER //

CREATE FUNCTION ActualizarDireccionEnvio(p_id_envio INT, p_nueva_direccion VARCHAR(150))
RETURNS VARCHAR(100)
BEGIN
    DECLARE mensaje VARCHAR(100);

    -- Verificar si el envío existe
    IF NOT EXISTS (SELECT * FROM ENVIOS WHERE ID_ENVIO = p_id_envio) THEN
        SET mensaje = 'El envío no existe.';
    ELSE
        -- Realizar la actualización de la dirección
        UPDATE ENVIOS
        SET ADDRESS = p_nueva_direccion
        WHERE ID_ENVIO = p_id_envio;

        SET mensaje = 'Dirección de envío actualizada exitosamente.';
    END IF;

    RETURN mensaje;
END;
//

DELIMITER ;

##Función para eliminar un envío
DELIMITER //

CREATE FUNCTION EliminarEnvio(p_id_envio INT)
RETURNS VARCHAR(100)
BEGIN
    DECLARE mensaje VARCHAR(100);

    -- Verificar si el envío existe
    IF NOT EXISTS (SELECT * FROM ENVIOS WHERE ID_ENVIO = p_id_envio) THEN
        SET mensaje = 'El envío no existe.';
    ELSE
        -- Realizar la eliminación del envío
        DELETE FROM ENVIOS
        WHERE ID_ENVIO = p_id_envio;

        SET mensaje = 'Envío eliminado exitosamente.';
    END IF;

    RETURN mensaje;
END;
//

DELIMITER ;

##STORED PROCEDURES
-- Crear stored procedure para insertar un nuevo cliente
DELIMITER //
CREATE PROCEDURE InsertarCliente(
    p_name VARCHAR(150),
    p_document_type INT,
    p_document_number VARCHAR(20),
    p_address VARCHAR(50),
    p_telephone VARCHAR(50)
)
BEGIN
    INSERT INTO CLIENTES (NAME, DOCUMENT_TYPE, DOCUMENT_NUMBER, ADDRESS, TELEPHONE)
    VALUES (p_name, p_document_type, p_document_number, p_address, p_telephone);
END;
//
DELIMITER ;

-- Crear stored procedure para insertar una nueva ficha
DELIMITER //
CREATE PROCEDURE InsertarFicha(
    p_user_id INT,
    p_nro_pedido VARCHAR(150),
    p_date DATE,
    p_address VARCHAR(50),
    p_description VARCHAR(50)
)
BEGIN
    INSERT INTO FICHA (USER_ID, NRO_DE_PEDIDO, DATE, ADDRESS, DESCRIPTION)
    VALUES (p_user_id, p_nro_pedido, p_date, p_address, p_description);
END;
//
DELIMITER ;

-- Crear stored procedure para insertar un nuevo pedido
DELIMITER //
CREATE PROCEDURE InsertarPedido(
    p_user_id INT,
    p_date DATE,
    p_monto DECIMAL(9, 2)
)
BEGIN
    INSERT INTO PEDIDOS (USER_ID, DATE, MONTO)
    VALUES (p_user_id, p_date, p_monto);
END;
//
DELIMITER ;

-- Crear stored procedure para insertar una nueva carta
DELIMITER //
CREATE PROCEDURE InsertarCarta(
    p_description VARCHAR(50),
    p_stock VARCHAR(150),
    p_price DECIMAL(9, 2)
)
BEGIN
    INSERT INTO CARTAS (DESCRIPTION, STOCK, PRICE)
    VALUES (p_description, p_stock, p_price);
END;
//
DELIMITER ;

-- Crear stored procedure para insertar una carta en un pedido
DELIMITER //
CREATE PROCEDURE InsertarCartaEnPedido(
    p_id_carta INT,
    p_id_pedido INT,
    p_quantity VARCHAR(150)
)
BEGIN
    INSERT INTO CARTAS_POR_PEDIDO (ID_CARTA, ID_PEDIDO, QUANTITY)
    VALUES (p_id_carta, p_id_pedido, p_quantity);
END;
//
DELIMITER ;

-- Crear stored procedure para insertar un nuevo envío
DELIMITER //
CREATE PROCEDURE InsertarEnvio(
    p_id_pedido INT,
    p_date DATE,
    p_address VARCHAR(150),
    p_monto DECIMAL(9, 2)
)
BEGIN
    INSERT INTO ENVIOS (ID_PEDIDO, DATE, ADDRESS, MONTO)
    VALUES (p_id_pedido, p_date, p_address, p_monto);
END;
//
DELIMITER ;

##TRIGGERS
-- Crear trigger para actualizar el monto total en la tabla PEDIDOS
DELIMITER //
CREATE TRIGGER ActualizarMontoTotalPedido
AFTER INSERT ON CARTAS_POR_PEDIDO
FOR EACH ROW
BEGIN
    DECLARE total_monto DECIMAL(9, 2);
    
    SELECT SUM(CARTAS.PRICE * NEW.QUANTITY) INTO total_monto
    FROM CARTAS_POR_PEDIDO
    JOIN CARTAS ON CARTAS_POR_PEDIDO.ID_CARTA = CARTAS.ID_CARTA
    WHERE CARTAS_POR_PEDIDO.ID_PEDIDO = NEW.ID_PEDIDO;
    
    UPDATE PEDIDOS
    SET MONTO = total_monto
    WHERE ID_PEDIDO = NEW.ID_PEDIDO;
END;
//
DELIMITER ;

-- Crear trigger para actualizar el monto total en la tabla ENVIOS
DELIMITER //
CREATE TRIGGER ActualizarMontoTotalEnvio
AFTER INSERT ON CARTAS_POR_PEDIDO
FOR EACH ROW
BEGIN
    DECLARE total_monto DECIMAL(9, 2);
    
    SELECT SUM(CARTAS.PRICE * NEW.QUANTITY) INTO total_monto
    FROM CARTAS_POR_PEDIDO
    JOIN CARTAS ON CARTAS_POR_PEDIDO.ID_CARTA = CARTAS.ID_CARTA
    WHERE CARTAS_POR_PEDIDO.ID_PEDIDO = NEW.ID_PEDIDO;
    
    UPDATE ENVIOS
    SET MONTO = total_monto
    WHERE ID_PEDIDO = NEW.ID_PEDIDO;
END;
//
DELIMITER ;

##MANIPULACION_CONTENIDO_DML

-- INSERT 
##Insertar un nuevo cliente:
INSERT INTO CLIENTES (NAME, DOCUMENT_TYPE, DOCUMENT_NUMBER, ADDRESS, TELEPHONE)
VALUES ('Juan Perez', 1, '12345678', 'Calle 123', '555-1234');

##Insertar una nueva ficha:
INSERT INTO FICHA (USER_ID, NRO_DE_PEDIDO, DATE, ADDRESS, DESCRIPTION)
VALUES (1, '12345', '2023-08-10', 'Calle 456', 'Pedido de prueba');

##Insertar un nuevo pedido:
INSERT INTO PEDIDOS (USER_ID, DATE, MONTO)
VALUES (1, '2023-08-10', 150.00);

##Insertar una nueva carta:
INSERT INTO CARTAS (DESCRIPTION, STOCK, PRICE)
VALUES ('Carta de Fuego', '100', 2.50);

##Insertar una carta en un pedido:
INSERT INTO CARTAS_POR_PEDIDO (ID_CARTA, ID_PEDIDO, QUANTITY)
VALUES (1, 1, '3');

##Insertar un nuevo envío:
INSERT INTO ENVIOS (ID_PEDIDO, DATE, ADDRESS, MONTO)
VALUES (1, '2023-08-10', 'Calle 789', 10.00);

-- UPDATE
##información de un cliente:
UPDATE CLIENTES
SET NAME = 'María García', ADDRESS = 'Avenida 123'
WHERE USER_ID = 1;

##información de una ficha:
UPDATE FICHA
SET DESCRIPTION = 'Pedido modificado', ADDRESS = 'Calle Modificada'
WHERE ID_FICHA = 1;

##el monto de un pedido:
UPDATE PEDIDOS
SET MONTO = 200.00
WHERE ID_PEDIDO = 1;

##descripción de una carta:
UPDATE CARTAS
SET DESCRIPTION = 'Carta actualizada'
WHERE ID_CARTA = 1;

##cantidad de cartas en un pedido:
UPDATE CARTAS_POR_PEDIDO
SET QUANTITY = '5'
WHERE ID_CARTA = 1 AND ID_PEDIDO = 1;

##dirección de envío:
UPDATE ENVIOS
SET ADDRESS = 'Nueva Dirección'
WHERE ID_ENVIO = 1;

-- SUBCONSULTAS
##Actualizar el monto total de un pedido:
UPDATE PEDIDOS
SET MONTO = (
    SELECT SUM(CARTAS.PRICE * CARTAS_POR_PEDIDO.QUANTITY)
    FROM CARTAS_POR_PEDIDO
    JOIN CARTAS ON CARTAS_POR_PEDIDO.ID_CARTA = CARTAS.ID_CARTA
    WHERE CARTAS_POR_PEDIDO.ID_PEDIDO = PEDIDOS.ID_PEDIDO
)
WHERE ID_PEDIDO = 1;

##Insertar un nuevo envío con información de un pedido
INSERT INTO ENVIOS (ID_PEDIDO, DATE, ADDRESS, MONTO)
VALUES (
    1,
    (SELECT DATE FROM PEDIDOS WHERE ID_PEDIDO = 1),
    (SELECT ADDRESS FROM PEDIDOS WHERE ID_PEDIDO = 1),
    (SELECT MONTO FROM PEDIDOS WHERE ID_PEDIDO = 1)
);

-- DELETE
##Eliminar un cliente:
DELETE FROM CLIENTES
WHERE USER_ID = 1;

##Eliminar una ficha:
DELETE FROM FICHA
WHERE ID_FICHA = 1;

##Eliminar un pedido y sus registros relacionados:
DELETE FROM PEDIDOS
WHERE ID_PEDIDO = 1;

##Eliminar una carta:
DELETE FROM CARTAS
WHERE ID_CARTA = 1;

##Eliminar cartas de un pedido:
DELETE FROM CARTAS_POR_PEDIDO
WHERE ID_PEDIDO = 1;

##Eliminar un envío:
DELETE FROM ENVIOS
WHERE ID_ENVIO = 1;

##GESTION_USERS_DCL
USE Mysql;

-- Crear el primer usuario
CREATE USER 'usuario1'@'localhost' IDENTIFIED BY 'contraseña1';

-- Conceder privilegios al primer usuario en la base de datos relacionada con las cartas
GRANT SELECT ON basededatos.* TO 'usuario1'@'localhost';

-- Crear el segundo usuario
CREATE USER 'usuario2'@'localhost' IDENTIFIED BY 'contraseña2';

-- Conceder privilegios al segundo usuario en la base de datos relacionada con las cartas
GRANT SELECT, INSERT ON basededatos.* TO 'usuario2'@'localhost';

SELECT * FROM CLIENTES;

-- Modificar la contraseña del usuario 'usuario1'
ALTER USER 'usuario1'@'localhost' IDENTIFIED BY 'nueva_contraseña';

-- Renombrar 'usuario1'
RENAME USER usuario1@localhost TO coderuser1@localhost; 

-- Eliminar usuario
DROP USER coderuser1@localhost; 

##TRANSACCIONES_TCL

-- Iniciar una transacción
START TRANSACTION;

-- Actualizar el stock de una carta
UPDATE CARTAS
SET STOCK = STOCK - 3
WHERE ID_CARTA = 1;

-- Insertar una nueva ficha de pedido
INSERT INTO FICHA (USER_ID, NRO_DE_PEDIDO, DATE, ADDRESS, DESCRIPTION)
VALUES (2, '7890', '2023-08-20', 'Calle Nueva 2', 'Pedido nuevo');

-- Insertar una nueva carta en un pedido
INSERT INTO CARTAS_POR_PEDIDO (ID_CARTA, ID_PEDIDO, QUANTITY)
VALUES (3, 2, '2');

-- Confirmar la transacción
COMMIT;

SELECT * FROM CARTAS;

ROLLBACK; 

##INFORMES

##Informe 1: Lista de Pedidos Recientes
SELECT ID_PEDIDO, DATE, MONTO
FROM PEDIDOS
ORDER BY DATE DESC
LIMIT 10;


##Informe 2: Inventario de Cartas Pokémon

SELECT DESCRIPTION AS Nombre_Carta, STOCK AS Cantidad_Disponible
FROM CARTAS;





