drop datobase dbpeliculas;

-- creamos la base de datos
create datobase dbpeliculas;

----------------------- 
-- creamos las tablas
-----------------------

-- Tabla de catÃ¡logos
CREATE TABLE dbpeliculas.catalogo (
    id INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(255) NOT NULL,
    descripcion TEXT
);

-- Tabla de gÃ©neros
CREATE TABLE dbpeliculas.genero (
    id INT AUTO_INCREMENT PRIMARY KEY,
    descripcion VARCHAR(100) NOT NULL
);

-- Tabla de estados de Ã¡nimo
CREATE TABLE dbpeliculas.animo (
    id INT AUTO_INCREMENT PRIMARY KEY,
    descripcion VARCHAR(100) NOT NULL
);

-- Tabla de ocasiones
CREATE TABLE dbpeliculas.ocasion (
    id INT AUTO_INCREMENT PRIMARY KEY,
    descripcion VARCHAR(100) NOT NULL
);

-- Tabla de pelÃ­culas
CREATE TABLE dbpeliculas.pelicula (
    id INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(255) NOT NULL,
    descripcion TEXT,
    anio INT,
    duracion INT, -- en minutos
    imagen TEXT -- guarda la URL
);

-- Tabla de relaciÃ³n entre pelÃ­culas y gÃ©neros
CREATE TABLE dbpeliculas.genero_pelicula (
    genero_id INT,
    pelicula_id INT,
    PRIMARY KEY (genero_id, pelicula_id),
    FOREIGN KEY (genero_id) REFERENCES dbpeliculas.genero(id) ON DELETE CASCADE,
    FOREIGN KEY (pelicula_id) REFERENCES dbpeliculas.pelicula(id) ON DELETE CASCADE
);

-- Tabla de relaciÃ³n entre pelÃ­culas y catÃ¡logos
CREATE TABLE dbpeliculas.catalogo_pelicula (
    catalogo_id INT,
    pelicula_id INT,
    PRIMARY KEY (catalogo_id, pelicula_id),
    FOREIGN KEY (catalogo_id) REFERENCES dbpeliculas.catalogo(id) ON DELETE CASCADE,
    FOREIGN KEY (pelicula_id) REFERENCES dbpeliculas.pelicula(id) ON DELETE CASCADE
);

-- Tabla de relaciÃ³n entre gÃ©nero y estado de Ã¡nimo
CREATE TABLE dbpeliculas.animo_genero (
    animo_id INT,
    genero_id INT,
    PRIMARY KEY (genero_id, animo_id),
    FOREIGN KEY (genero_id) REFERENCES dbpeliculas.genero(id) ON DELETE CASCADE,
    FOREIGN KEY (animo_id) REFERENCES dbpeliculas.animo(id) ON DELETE CASCADE
);

-- Tabla de relaciÃ³n entre gÃ©nero y ocasiÃ³n
CREATE TABLE dbpeliculas.ocasion_genero (
    ocasion_id INT,
    genero_id INT,
    PRIMARY KEY (genero_id, ocasion_id),
    FOREIGN KEY (genero_id) REFERENCES dbpeliculas.genero(id) ON DELETE CASCADE,
    FOREIGN KEY (ocasion_id) REFERENCES dbpeliculas.ocasion(id) ON DELETE CASCADE
);

-----------------------
-- insertamos los datos
-----------------------
INSERT INTO dbpeliculas.catalogo (titulo, descripcion)
VALUES ('PelGen', 'CatÃ¡logo principal de PelGen CaC');

INSERT INTO dbpeliculas.animo(descripcion) VALUES ('Feliz');
INSERT INTO dbpeliculas.animo(descripcion) VALUES ('NostÃ¡lgico');
INSERT INTO dbpeliculas.animo(descripcion) VALUES ('Emocionado');
INSERT INTO dbpeliculas.animo(descripcion) VALUES ('Relajado');

INSERT INTO dbpeliculas.ocasion (descripcion) VALUES ('Noche romÃ¡ntica');
INSERT INTO dbpeliculas.ocasion (descripcion) VALUES ('Noche de lluvia');
INSERT INTO dbpeliculas.ocasion (descripcion) VALUES ('Noche de terror');

INSERT INTO dbpeliculas.genero (descripcion) VALUES ('AcciÃ³n');
INSERT INTO dbpeliculas.genero (descripcion) VALUES ('Comedia');
INSERT INTO dbpeliculas.genero (descripcion) VALUES ('Drama');
INSERT INTO dbpeliculas.genero (descripcion) VALUES ('Terror');
INSERT INTO dbpeliculas.genero (descripcion) VALUES ('Romance');
INSERT INTO dbpeliculas.genero (descripcion) VALUES ('Suspenso');

INSERT INTO dbpeliculas.ocasion_genero VALUES (1, 1);
INSERT INTO dbpeliculas.ocasion_genero VALUES (2, 1);
INSERT INTO dbpeliculas.ocasion_genero VALUES (2, 2);
INSERT INTO dbpeliculas.ocasion_genero VALUES (2, 3);
INSERT INTO dbpeliculas.ocasion_genero VALUES (2, 4);
INSERT INTO dbpeliculas.ocasion_genero VALUES (2, 5);
INSERT INTO dbpeliculas.ocasion_genero VALUES (2, 6);
INSERT INTO dbpeliculas.ocasion_genero VALUES (3, 4);
INSERT INTO dbpeliculas.ocasion_genero VALUES (3, 6);

INSERT INTO dbpeliculas.animo_genero VALUES (1, 1);
INSERT INTO dbpeliculas.animo_genero VALUES (1, 2);
INSERT INTO dbpeliculas.animo_genero VALUES (2, 3);
INSERT INTO dbpeliculas.animo_genero VALUES (2, 5);
INSERT INTO dbpeliculas.animo_genero VALUES (3, 3);
INSERT INTO dbpeliculas.animo_genero VALUES (3, 2);
INSERT INTO dbpeliculas.animo_genero VALUES (4, 1);
INSERT INTO dbpeliculas.animo_genero VALUES (4, 2);
INSERT INTO dbpeliculas.animo_genero VALUES (4, 3);
INSERT INTO dbpeliculas.animo_genero VALUES (4, 4);
INSERT INTO dbpeliculas.animo_genero VALUES (4, 5);
INSERT INTO dbpeliculas.animo_genero VALUES (4, 6);

INSERT INTO dbpeliculas.pelicula (titulo, descripcion, anio, duracion) VALUES ('Argentina 1985', 'Basada en hechos reales, la pelÃ­cula sigue a los fiscales que llevaron a juicio a los lÃ­deres de la dictadura militar argentina.', 2022, 140);
INSERT INTO dbpeliculas.pelicula (titulo, descripcion, anio, duracion) VALUES ('Carancho', 'Un abogado corrupto especializado en accidentes de trÃ¡fico se ve envuelto en una trama de engaÃ±os y violencia.', 2010, 107);
INSERT INTO dbpeliculas.pelicula (titulo, descripcion, anio, duracion) VALUES ('El hijo de la novia', 'Un hombre en crisis se replantea su vida al enfrentarse a problemas laborales, familiares y de salud, mientras su madre desea casarse por la iglesia.', 2001, 123);
INSERT INTO dbpeliculas.pelicula (titulo, descripcion, anio, duracion) VALUES ('El secreto de sus ojos', 'Un exagente de justicia investiga un caso de violaciÃ³n y asesinato no resuelto que ha marcado su vida, mientras revive su propia historia de amor no correspondido.', 2009, 129);
INSERT INTO dbpeliculas.pelicula (titulo, descripcion, anio, duracion) VALUES ('Nueve reinas', 'Dos estafadores se asocian para ejecutar un gran fraude con una serie de sellos falsos, mientras desconfÃ­an el uno del otro.', 2000, 114);
INSERT INTO dbpeliculas.pelicula (titulo, descripcion, anio, duracion) VALUES ('Relatos salvajes', 'Una serie de historias cortas que exploran la pÃ©rdida del control y la violencia como respuesta a la injusticia y la frustraciÃ³n en la vida moderna.', 2014, 122);

INSERT INTO dbpeliculas.pelicula (titulo, descripcion, anio, duracion) VALUES ('CorazÃ³n de leÃ³n', 'Una abogada recibe una llamada de un hombre que encontrÃ³ su celular. Tras conocerlo, enfrenta sus propios prejuicios por su baja estatura.', 2013, 94);
INSERT INTO dbpeliculas.pelicula (titulo, descripcion, anio, duracion) VALUES ('Dos mÃ¡s dos', 'Una pareja estable ve su relaciÃ³n sacudida cuando descubren el intercambio de parejas y deciden experimentar.', 2012, 104);
INSERT INTO dbpeliculas.pelicula (titulo, descripcion, anio, duracion) VALUES ('Esperando la carroza', 'Una familia disfuncional se reÃºne para lidiar con la supuesta muerte de la abuela, revelando sus problemas y rencores.', 1985, 87);
INSERT INTO dbpeliculas.pelicula (titulo, descripcion, anio, duracion) VALUES ('Fuga de cerebros', 'Un grupo de amigos viaja a Oxford para ayudar a uno de ellos a conquistar a la chica de sus sueÃ±os, causando situaciones hilarantes.', 2009, 104);
INSERT INTO dbpeliculas.pelicula (titulo, descripcion, anio, duracion) VALUES ('Un novio para mi mujer', 'Un hombre contrata a un seductor profesional para que conquiste a su insoportable esposa y asÃ­ tener una excusa para el divorcio.', 2008, 107);

INSERT INTO dbpeliculas.pelicula (titulo, descripcion, anio, duracion) VALUES ('El clan', 'Basada en hechos reales, la pelÃ­cula narra la historia de la familia Puccio, que secuestraba personas en su propia casa en Buenos Aires.', 2015, 108);
INSERT INTO dbpeliculas.pelicula (titulo, descripcion, anio, duracion) VALUES ('El hijo de la novia', 'Un hombre en crisis se replantea su vida al enfrentarse a problemas laborales, familiares y de salud, mientras su madre desea casarse por la iglesia.', 2001, 123);
INSERT INTO dbpeliculas.pelicula (titulo, descripcion, anio, duracion) VALUES ('La ciÃ©naga', 'Una mirada a la decadencia de una familia argentina durante un verano sofocante en una casa de campo en ruinas.', 2001, 103);
INSERT INTO dbpeliculas.pelicula (titulo, descripcion, anio, duracion) VALUES ('La historia oficial', 'Una mujer descubre que su hija adoptiva puede haber sido robada de sus verdaderos padres, desaparecidos durante la dictadura militar.', 1985, 112);
INSERT INTO dbpeliculas.pelicula (titulo, descripcion, anio, duracion) VALUES ('Medianeras', 'Dos solitarios en Buenos Aires viven vidas paralelas en edificios vecinos, mientras enfrentan la desconexiÃ³n y la bÃºsqueda del amor en la era moderna.', 2011, 95);

INSERT INTO dbpeliculas.pelicula (titulo, descripcion, anio, duracion) VALUES ('La casa muda', 'En una sola toma continua, la pelÃ­cula sigue a una joven atrapada en una casa que parece estar embrujada por eventos horribles.', 2010, 86);
INSERT INTO dbpeliculas.pelicula (titulo, descripcion, anio, duracion) VALUES ('La memoria del agua', 'Una pareja enfrenta el dolor de la pÃ©rdida de su hijo, lidiando con la culpa y los recuerdos que amenazan con destruir su relaciÃ³n.', 2015, 88);
INSERT INTO dbpeliculas.pelicula (titulo, descripcion, anio, duracion) VALUES ('Los olvidados', 'Tras la misteriosa desapariciÃ³n de su hija, una mujer descubre secretos oscuros mientras intenta encontrarla.', 2001, 104);
INSERT INTO dbpeliculas.pelicula (titulo, descripcion, anio, duracion) VALUES ('Los que aman, odian', 'Un mÃ©dico viaja a un hotel remoto, donde se ve atrapado en una trama de pasiones y muerte, basada en la novela homÃ³nima.', 2017, 101);
INSERT INTO dbpeliculas.pelicula (titulo, descripcion, anio, duracion) VALUES ('Mundo al revÃ©s', 'Una comedia negra que explora una realidad alterna donde las normas sociales estÃ¡n invertidas, generando situaciones tanto absurdas como inquietantes.', 1992, 89);

INSERT INTO dbpeliculas.pelicula (titulo, descripcion, anio, duracion) VALUES ('El amor menos pensado', 'Tras 25 aÃ±os de matrimonio, una pareja decide separarse para experimentar la vida de solteros, enfrentando desafÃ­os y redescubriÃ©ndose.', 2018, 136);
INSERT INTO dbpeliculas.pelicula (titulo, descripcion, anio, duracion) VALUES ('Elsa y Fred', 'Dos ancianos vecinos se conocen y descubren una nueva oportunidad para el amor en la Ãºltima etapa de sus vidas.', 2005, 106);
INSERT INTO dbpeliculas.pelicula (titulo, descripcion, anio, duracion) VALUES ('La ciÃ©naga', 'Una mirada a la decadencia de una familia argentina durante un verano sofocante en una casa de campo en ruinas.', 2001, 103);
INSERT INTO dbpeliculas.pelicula (titulo, descripcion, anio, duracion) VALUES ('Medianeras', 'Dos solitarios en Buenos Aires viven vidas paralelas en edificios vecinos, mientras enfrentan la desconexiÃ³n y la bÃºsqueda del amor en la era moderna.', 2011, 95);
INSERT INTO dbpeliculas.pelicula (titulo, descripcion, anio, duracion) VALUES ('Viudas', 'Una mujer descubre que su esposo fallecido llevaba una doble vida y tenÃ­a una amante, con quien se ve obligada a relacionarse inesperadamente.', 2011, 100);

INSERT INTO dbpeliculas.catalogo_pelicula 
SELECT 1, id
FROM dbpeliculas.pelicula;

INSERT INTO dbpeliculas.genero_pelicula VALUES (1, 1);
INSERT INTO dbpeliculas.genero_pelicula VALUES (1, 2);
INSERT INTO dbpeliculas.genero_pelicula VALUES (1, 3);
INSERT INTO dbpeliculas.genero_pelicula VALUES (1, 4);
INSERT INTO dbpeliculas.genero_pelicula VALUES (1, 5);
INSERT INTO dbpeliculas.genero_pelicula VALUES (1, 6);
INSERT INTO dbpeliculas.genero_pelicula VALUES (2, 7);
INSERT INTO dbpeliculas.genero_pelicula VALUES (2, 8);
INSERT INTO dbpeliculas.genero_pelicula VALUES (2, 9);
INSERT INTO dbpeliculas.genero_pelicula VALUES (2, 10);
INSERT INTO dbpeliculas.genero_pelicula VALUES (2, 11);
INSERT INTO dbpeliculas.genero_pelicula VALUES (3, 12);
INSERT INTO dbpeliculas.genero_pelicula VALUES (3, 13);
INSERT INTO dbpeliculas.genero_pelicula VALUES (3, 14);
INSERT INTO dbpeliculas.genero_pelicula VALUES (3, 15);
INSERT INTO dbpeliculas.genero_pelicula VALUES (3, 16);
INSERT INTO dbpeliculas.genero_pelicula VALUES (4, 17);
INSERT INTO dbpeliculas.genero_pelicula VALUES (4, 18);
INSERT INTO dbpeliculas.genero_pelicula VALUES (4, 19);
INSERT INTO dbpeliculas.genero_pelicula VALUES (4, 20);
INSERT INTO dbpeliculas.genero_pelicula VALUES (4, 21);
INSERT INTO dbpeliculas.genero_pelicula VALUES (5, 22);
INSERT INTO dbpeliculas.genero_pelicula VALUES (5, 23);
INSERT INTO dbpeliculas.genero_pelicula VALUES (5, 24);
INSERT INTO dbpeliculas.genero_pelicula VALUES (5, 25);
INSERT INTO dbpeliculas.genero_pelicula VALUES (5, 26);
INSERT INTO dbpeliculas.genero_pelicula VALUES (6, 2);
INSERT INTO dbpeliculas.genero_pelicula VALUES (6, 4);
INSERT INTO dbpeliculas.genero_pelicula VALUES (6, 19);
INSERT INTO dbpeliculas.genero_pelicula VALUES (6, 20);

