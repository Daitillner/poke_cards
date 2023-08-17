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
