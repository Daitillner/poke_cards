CREATE TABLE Clientes (
    USER_ID INT PRIMARY KEY,
    NAME VARCHAR(150) NOT NULL,
    DOCUMENT_TYPE INT NOT NULL,
    DOCUMENT_NUMBER VARCHAR(20) NOT NULL,
    ADDRESS VARCHAR(50),
    TELEPHONE VARCHAR(50)
);

-- Insertar un registro en la tabla Clientes
INSERT INTO Clientes (USER_ID, NAME, DOCUMENT_TYPE, DOCUMENT_NUMBER, ADDRESS, TELEPHONE)
VALUES (1, 'Juan Pérez', 1, '12345678', 'Calle 123, Ciudad', '123-456-7890');

-- Insertar más registros en la tabla Clientes
INSERT INTO Clientes (USER_ID, NAME, DOCUMENT_TYPE, DOCUMENT_NUMBER, ADDRESS, TELEPHONE)
VALUES (2, 'María López', 2, '98765432', 'Avenida 456, Ciudad', '987-654-3210');

INSERT INTO Clientes (USER_ID, NAME, DOCUMENT_TYPE, DOCUMENT_NUMBER, ADDRESS, TELEPHONE)
VALUES (3, 'Carlos García', 1, '45678901', 'Calle Principal, Pueblo', '456-789-0123');

INSERT INTO Clientes (USER_ID, NAME, DOCUMENT_TYPE, DOCUMENT_NUMBER, ADDRESS, TELEPHONE)
VALUES (4, 'Ana Rodríguez', 2, '54321098', 'Boulevard 789, Ciudad', '543-210-9876');

INSERT INTO Clientes (USER_ID, NAME, DOCUMENT_TYPE, DOCUMENT_NUMBER, ADDRESS, TELEPHONE)
VALUES (5, 'Jorge Martínez', 1, '10987654', 'Avenida Central, Villa', '109-876-5432');

INSERT INTO Clientes (USER_ID, NAME, DOCUMENT_TYPE, DOCUMENT_NUMBER, ADDRESS, TELEPHONE)
VALUES (6, 'Sofía Hernández', 2, '56789012', 'Callejón 234, Ciudad', '567-890-1234');

INSERT INTO Clientes (USER_ID, NAME, DOCUMENT_TYPE, DOCUMENT_NUMBER, ADDRESS, TELEPHONE)
VALUES (7, 'Diego González', 1, '98765432', 'Camino 567, Pueblo', '987-654-3210');

INSERT INTO Clientes (USER_ID, NAME, DOCUMENT_TYPE, DOCUMENT_NUMBER, ADDRESS, TELEPHONE)
VALUES (8, 'Valentina Pérez', 2, '43210987', 'Plaza 678, Ciudad', '432-109-8765');

INSERT INTO Clientes (USER_ID, NAME, DOCUMENT_TYPE, DOCUMENT_NUMBER, ADDRESS, TELEPHONE)
VALUES (9, 'Andrés López', 1, '87654321', 'Avenida 789, Pueblo', '876-543-2109');

INSERT INTO Clientes (USER_ID, NAME, DOCUMENT_TYPE, DOCUMENT_NUMBER, ADDRESS, TELEPHONE)
VALUES (10, 'Isabella García', 2, '21098765', 'Calle 123, Ciudad', '210-987-6543');

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

CREATE TABLE Cartas_Por_Pedido (
    ID_CARTA INT,
    ID_PEDIDO INT,
    QUANTITY VARCHAR(150),
    PRIMARY KEY (ID_CARTA, ID_PEDIDO),
    FOREIGN KEY (ID_CARTA) REFERENCES Cartas(ID_CARTA),
    FOREIGN KEY (ID_PEDIDO) REFERENCES Pedidos(ID_PEDIDO)
);

-- Registro 1
INSERT INTO Carta (id, Nombre, Tipo, Altura, Peso, Habilidad, Descripcion)
VALUES (1, 'Flareon', 'Fuego', 0.9, 25.0, 'Absorbe Fuego', 'Flareon es un Pokémon de fuego con un pelaje brillante y esponjoso. Su temperatura corporal es extremadamente alta, lo que le permite lanzar llamas ardientes.');

-- Registro 2
INSERT INTO Carta (id, Nombre, Tipo, Altura, Peso, Habilidad, Descripcion)
VALUES (2, 'Vaporeon', 'Agua', 1.0, 29.0, 'Absorbe Agua', 'Vaporeon es un Pokémon acuático con aletas en todo su cuerpo. Puede controlar el agua a voluntad y crear neblina densa para confundir a sus oponentes.');

-- Registro 3
INSERT INTO Carta (id, Nombre, Tipo, Altura, Peso, Habilidad, Descripcion)
VALUES (3, 'Jolteon', 'Eléctrico', 0.8, 24.5, 'Absorbe Electricidad', 'Jolteon tiene una cubierta de espinas en su cuerpo que puede cargar con electricidad. Puede liberar descargas eléctricas intensas para defenderse.');

-- Registro 4
INSERT INTO Carta (id, Nombre, Tipo, Altura, Peso, Habilidad, Descripcion)
VALUES (4, 'Espeon', 'Psíquico', 0.9, 26.5, 'Telepatía', 'Espeon es un Pokémon psíquico con la capacidad de predecir el futuro. Sus ojos brillantes pueden hipnotizar a sus enemigos y leer sus mentes.');

-- Registro 5
INSERT INTO Carta (id, Nombre, Tipo, Altura, Peso, Habilidad, Descripcion)
VALUES (5, 'Umbreon', 'Siniestro', 1.0, 27.0, 'Sincronía', 'Umbreon es un Pokémon siniestro que se mueve en la oscuridad de la noche. Su pelaje actúa como una capa protectora que le permite camuflarse en las sombras.');

-- Registro 6
INSERT INTO Carta (id, Nombre, Tipo, Altura, Peso, Habilidad, Descripcion)
VALUES (6, 'Leafeon', 'Planta', 1.1, 29.5, 'Clorofila', 'Leafeon es un Pokémon de planta con hojas largas y afiladas. Puede controlar las plantas a su alrededor y usarlas en combate.');

-- Registro 7
INSERT INTO Carta (id, Nombre, Tipo, Altura, Peso, Habilidad, Descripcion)
VALUES (7, 'Glaceon', 'Hielo', 1.0, 28.0, 'Cuerpo Helado', 'Glaceon tiene cristales de hielo en su pelaje que le permiten congelar el aire circundante. Puede crear una barrera de frío intenso para protegerse.');

-- Registro 8
INSERT INTO Carta (id, Nombre, Tipo, Altura, Peso, Habilidad, Descripcion)
VALUES (8, 'Sylveon', 'Hada', 1.0, 23.5, 'Encanto', 'Sylveon es un Pokémon de tipo hada con la capacidad de emitir ondas de energía calmante. Puede controlar las emociones de los demás y traer armonía a su entorno.');

-- Registro 9
INSERT INTO Carta (id, Nombre, Tipo, Altura, Peso, Habilidad, Descripcion)
VALUES (9, 'Dragonite', 'Dragón/Volador', 2.2, 210.0, 'Multitipo', 'Dragonite es un Pokémon poderoso con alas anchas y fuertes. Puede volar a altas velocidades y controlar los elementos naturales a su alrededor.');

-- Registro 10
INSERT INTO Carta (id, Nombre, Tipo, Altura, Peso, Habilidad, Descripcion)
VALUES (10, 'Lucario', 'Lucha/Acero', 1.2, 54.0, 'Vista Lince', 'Lucario es un Pokémon combatiente que puede sentir las emociones de los demás a través de sus auras. Puede lanzar ataques devastadores usando su dominio de las artes marciales.');

CREATE TABLE Pedidos (
    ID_PEDIDO INT PRIMARY KEY,
    USER_ID INT,
    DATE DATE DEFAULT NULL,
    MONTO DECIMAL(9, 2) DEFAULT 0,
    FOREIGN KEY (USER_ID) REFERENCES Clientes(USER_ID)
);

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

SELECT * FROM poke_cards.cartas;



