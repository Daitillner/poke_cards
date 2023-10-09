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