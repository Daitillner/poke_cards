CREATE TABLE Envios (
    ID_ENVIO INT PRIMARY KEY,
    ID_PEDIDO INT NOT NULL,
	DATE DATE DEFAULT NULL,
    ADDRESS VARCHAR(150),
    MONTO DECIMAL(9, 2) DEFAULT 0,
    FOREIGN KEY (ID_PEDIDO) REFERENCES Pedidos(ID_PEDIDO)
);

-- Insertar registros en la tabla Envios
INSERT INTO Envios (ID_ENVIO, ID_PEDIDO, DATE, ADDRESS, MONTO)
VALUES (1, 1, '2023-08-18', 'Calle 123, Ciudad', 12.50);

INSERT INTO Envios (ID_ENVIO, ID_PEDIDO, DATE, ADDRESS, MONTO)
VALUES (2, 2, '2023-08-19', 'Avenida 456, Pueblo', 8.75);

INSERT INTO Envios (ID_ENVIO, ID_PEDIDO, DATE, ADDRESS, MONTO)
VALUES (3, 3, '2023-08-20', 'Boulevard 789, Ciudad', 15.00);

INSERT INTO Envios (ID_ENVIO, ID_PEDIDO, DATE, ADDRESS, MONTO)
VALUES (4, 4, '2023-08-21', 'Calle Principal, Villa', 6.25);

INSERT INTO Envios (ID_ENVIO, ID_PEDIDO, DATE, ADDRESS, MONTO)
VALUES (5, 5, '2023-08-22', 'Avenida Central, Ciudad', 10.50);

INSERT INTO Envios (ID_ENVIO, ID_PEDIDO, DATE, ADDRESS, MONTO)
VALUES (6, 6, '2023-08-23', 'Camino 123, Pueblo', 18.00);

INSERT INTO Envios (ID_ENVIO, ID_PEDIDO, DATE, ADDRESS, MONTO)
VALUES (7, 7, '2023-08-24', 'Plaza 456, Ciudad', 9.25);

INSERT INTO Envios (ID_ENVIO, ID_PEDIDO, DATE, ADDRESS, MONTO)
VALUES (8, 8, '2023-08-25', 'Callejón 567, Pueblo', 14.75);

INSERT INTO Envios (ID_ENVIO, ID_PEDIDO, DATE, ADDRESS, MONTO)
VALUES (9, 9, '2023-08-26', 'Boulevard 678, Ciudad', 7.50);

INSERT INTO Envios (ID_ENVIO, ID_PEDIDO, DATE, ADDRESS, MONTO)
VALUES (10, 10, '2023-08-27', 'Avenida 789, Villa', 11.20);
