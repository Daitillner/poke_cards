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
