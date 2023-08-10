CREATE TABLE Ficha (
    ID_FICHA INT PRIMARY KEY,
    USER_ID INT NOT NULL,
    NRO_DE_PEDIDO VARCHAR(150) NOT NULL,
    DATE DATE DEFAULT NULL,
    ADDRESS VARCHAR(50),
    DESCRIPTION VARCHAR(50),
    FOREIGN KEY (USER_ID) REFERENCES Clientes (USER_ID)
);

-- Insertar un registro en la tabla Ficha
INSERT INTO Ficha (ID_FICHA, USER_ID, NRO_DE_PEDIDO, DATE, ADDRESS, DESCRIPTION)
VALUES (1, 1, 'Pedido123', '2023-08-08', 'Calle 456, Ciudad', 'Pedido de productos');

-- Insertar otro registro en la tabla Ficha
INSERT INTO Ficha (ID_FICHA, USER_ID, NRO_DE_PEDIDO, DATE, ADDRESS, DESCRIPTION)
VALUES (2, 2, 'Pedido456', '2023-08-09', 'Avenida 789, Pueblo', 'Otro pedido de productos');

-- Insertar un tercer registro en la tabla Ficha
INSERT INTO Ficha (ID_FICHA, USER_ID, NRO_DE_PEDIDO, DATE, ADDRESS, DESCRIPTION)
VALUES (3, 3, 'Pedido789', '2023-08-10', 'Boulevard 123, Ciudad', 'Pedido urgente');
-- Insertar más registros en la tabla Ficha
INSERT INTO Ficha (ID_FICHA, USER_ID, NRO_DE_PEDIDO, DATE, ADDRESS, DESCRIPTION)
VALUES (4, 4, 'Pedido101', '2023-08-11', 'Calle Principal, Villa', 'Pedido especial');

INSERT INTO Ficha (ID_FICHA, USER_ID, NRO_DE_PEDIDO, DATE, ADDRESS, DESCRIPTION)
VALUES (5, 5, 'Pedido202', '2023-08-12', 'Avenida Central, Ciudad', 'Pedido para evento');

INSERT INTO Ficha (ID_FICHA, USER_ID, NRO_DE_PEDIDO, DATE, ADDRESS, DESCRIPTION)
VALUES (6, 6, 'Pedido303', '2023-08-13', 'Camino 123, Pueblo', 'Pedido grande');

INSERT INTO Ficha (ID_FICHA, USER_ID, NRO_DE_PEDIDO, DATE, ADDRESS, DESCRIPTION)
VALUES (7, 7, 'Pedido404', '2023-08-14', 'Plaza 456, Ciudad', 'Pedido urgente');

INSERT INTO Ficha (ID_FICHA, USER_ID, NRO_DE_PEDIDO, DATE, ADDRESS, DESCRIPTION)
VALUES (8, 8, 'Pedido505', '2023-08-15', 'Callejón 567, Pueblo', 'Pedido variado');

INSERT INTO Ficha (ID_FICHA, USER_ID, NRO_DE_PEDIDO, DATE, ADDRESS, DESCRIPTION)
VALUES (9, 9, 'Pedido606', '2023-08-16', 'Boulevard 678, Ciudad', 'Pedido de regalos');

INSERT INTO Ficha (ID_FICHA, USER_ID, NRO_DE_PEDIDO, DATE, ADDRESS, DESCRIPTION)
VALUES (10, 10, 'Pedido707', '2023-08-17', 'Avenida 789, Villa', 'Pedido estándar');
