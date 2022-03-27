CREATE TABLE art(
pkIdArt INT NOT NULL,
nome VARCHAR(30),
CONSTRAINT pkArtista PRIMARY KEY (pkIdArt)
);

CREATE TABLE gen(
pkIdGen INT NOT NULL,
descGen VARCHAR(30),
CONSTRAINT pkGenero PRIMARY KEY (pkIdGen)
);

CREATE TABLE prop(
pkIdProp INT NOT NULL,
melodia VARCHAR(30),
CONSTRAINT pkPropriedade PRIMARY KEY (pkIdProp)
);

CREATE TABLE musica (
pkIdMus INT NOT NULL,
nome VARCHAR(30),
fkGen INT NOT NULL,
CONSTRAINT pkMusica PRIMARY KEY (pkIdMus),
CONSTRAINT fkGenero FOREIGN KEY (fkGen) REFERENCES gen(pkIdGen)
);

CREATE TABLE PropMus (
pkIdPropMus INT NOT NULL,
fkMus INT,
fkProp INT,
CONSTRAINT possui PRIMARY KEY (pkIdPropMus),
CONSTRAINT fkMusProp FOREIGN KEY (fkMus) REFERENCES musica (pkIdMus),
CONSTRAINT fkPropMus FOREIGN KEY (fkProp) REFERENCES prop (pkIdProp)
);

CREATE TABLE ArtMus (
pkIdArtMus INT NOT NULL,
fkArt INT,
fkMus INT,
CONSTRAINT cantam PRIMARY KEY (pkIdArtMus),
CONSTRAINT fkArtMus FOREIGN KEY (fkArt) REFERENCES art (pkIdArt),
CONSTRAINT fkMusArt FOREIGN KEY (fkMus) REFERENCES musica (pkIdMus)
);

INSERT INTO art
values (1, 'JOAO');
INSERT INTO art
values (2, 'JONAS');
INSERT INTO art
values (3, 'WHAT');

select * from art;

INSERT INTO gen
values (1, 'Sertanejo');
INSERT INTO gen
values (2, 'Rock');
INSERT INTO gen
values (3, 'Metal');

select * from prop;

INSERT INTO prop
values (1, 'Calma');
INSERT INTO prop
values (2, 'Agitada');
INSERT INTO prop
values (3, 'Lol');

INSERT INTO musica
values (1,'Huaha', 1);
INSERT INTO musisca
values (2, 'Rofl', 2);
INSERT INTO musica
values (3, 'Lulz', 3);

select * from musica
