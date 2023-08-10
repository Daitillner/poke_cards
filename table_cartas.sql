CREATE TABLE Cartas (
    ID_CARTA INT PRIMARY KEY,
    DESCRIPTION VARCHAR(50),
    STOCK VARCHAR(150),
    PRICE DECIMAL(9, 2)
);
-- Insertar un registro en la tabla Cartas
INSERT INTO Cartas (ID_CARTA, DESCRIPTION, STOCK, PRICE)
VALUES (1, 'Carta 1', 'Stock 1', 5.99);

-- Insertar otro registro en la tabla Cartas
INSERT INTO Cartas (ID_CARTA, DESCRIPTION, STOCK, PRICE)
VALUES (2, 'Carta 2', 'Stock 2', 8.75);

-- Insertar un tercer registro en la tabla Cartas
INSERT INTO Cartas (ID_CARTA, DESCRIPTION, STOCK, PRICE)
VALUES (3, 'Carta 3', 'Stock 3', 3.50);
-- Insertar más registros en la tabla Cartas
INSERT INTO Cartas (ID_CARTA, DESCRIPTION, STOCK, PRICE)
VALUES (4, 'Carta 4', 'Stock 4', 6.25);

INSERT INTO Cartas (ID_CARTA, DESCRIPTION, STOCK, PRICE)
VALUES (5, 'Carta 5', 'Stock 5', 2.99);

INSERT INTO Cartas (ID_CARTA, DESCRIPTION, STOCK, PRICE)
VALUES (6, 'Carta 6', 'Stock 6', 9.50);

INSERT INTO Cartas (ID_CARTA, DESCRIPTION, STOCK, PRICE)
VALUES (7, 'Carta 7', 'Stock 7', 4.75);

INSERT INTO Cartas (ID_CARTA, DESCRIPTION, STOCK, PRICE)
VALUES (8, 'Carta 8', 'Stock 8', 7.20);

INSERT INTO Cartas (ID_CARTA, DESCRIPTION, STOCK, PRICE)
VALUES (9, 'Carta 9', 'Stock 9', 1.50);

INSERT INTO Cartas (ID_CARTA, DESCRIPTION, STOCK, PRICE)
VALUES (10, 'Carta 10', 'Stock 10', 10.00); 