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



