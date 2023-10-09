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

