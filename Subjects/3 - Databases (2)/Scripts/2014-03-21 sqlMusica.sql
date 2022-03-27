-- ID ARTISTA
create or replace function geraIdAtrista() returns integer as
$$
	declare
		registro integer := 0;
begin
	registro := count(*) + 1 from artista;
	return registro;
end;
$$
language 'plpgsql';

-- ID MUSICA
create or replace function geraIdMusica() returns integer as
$$
	declare
		registro integer := 0;
begin
	registro := count(*) + 1 from musica;
	return registro;
end;
$$
language 'plpgsql';

-- ID GENERO
create or replace function geraIdGenero() returns integer as
$$
	declare
		registro integer := 0;
begin
	registro := count(*) + 1 from genero;
	return registro;
end;
$$
language 'plpgsql';

-- ID PROPRIEDADE
create or replace function geraIdPropeirdade() returns integer as
$$
	declare
		registro integer := 0;
begin
	registro := count(*) + 1 from propriedade;
	return registro;
end;
$$
language 'plpgsql';

-- ID CANTADA
create or replace function geraIdCantada() returns integer as
$$
	declare
		registro integer := 0;
begin
	registro := count(*) + 1 from cantada;
	return registro;
end;
$$
language 'plpgsql';

-- ID POSSUI
create or replace function geraIdPossui() returns integer as
$$
	declare
		registro integer := 0;
begin
	registro := count(*) + 1 from possui;
	return registro;
end;
$$
language 'plpgsql';

-- CRIAÇÃO DAS TABELAS
create table artista (
id_artista int not null,
nome_artista varchar(30),
constraint pk_artista primary key (id_artista),
check (id_artista > 0)
);

create table musica (
id_musica int not null,
nome_musica varchar(30),
id_genero int not null,
constraint pk_musica primary key (id_musica),
constraint fk_genero foreign key (id_genero) references genero,
check (id_musica > 0)
);

create table genero (
id_genero int not null,
desc_gen varchar(20),
constraint pk_genero primary key (id_genero),
check (id_genero > 0)
);

create table propriedade (
id_propriedade int not null,
cifra varchar(40),
letra varchar(40),
melodia varchar(40),
constraint pk_propriedade primary key (id_propriedade),
check (id_propriedade > 0)
);

create table cantada (
id_cantada int not null,
id_artista int not null,
id_musica int not null,
constraint pk_cantada primary key (id_cantada),
constraint fk_artista foreign key (id_artista) references artista,
constraint fk_musica foreign key(id_musica) references musica,
check (id_cantada > 0),
check (id_artista > 0),
check (id_musica > 0)
);

create table possui (
id_possui int not null,
id_musica int not null,
id_propriedade int not null,
constraint pk_possui primary key (id_possui),
constraint fk_musica foreign key (id_musica) references musica,
constraint fk_propriedade foreign key (id_propriedade) references propriedade,
check (id_possui > 0),
check (id_musica > 0),
check (id_propriedade > 0)
);


-- INSERÇÃO DE DADOS
insert into artista
(id_artista, nome_artista)
values
(geraIdAtrista(), 'Rubem'),
(geraIdAtrista(), 'Caio'),
(geraIdAtrista(), 'Julio');

insert into musica
(id_musica, nome_musica, id_genero)
values
(geraIdMusica(), 'Dawn of Victory', 1),
(geraIdMusica(), 'Fear of the Dark', 1),
(geraIdMusica(), 'Salvation Code', 2);

insert into genero
(id_genero, desc_gen)
values
(geraIdGenero(), 'Heavy Metal'),
(geraIdGenero(), 'Eletronica'),
(geraIdGenero(), 'Rock Alternativo');

insert into propriedade
(id_propriedade, cifra, letra, melodia)
values
(geraIdPropeirdade(), 'sim', 'sim', 'não'),
(geraIdPropeirdade(), 'sim', 'sim', 'sim'),
(geraIdPropeirdade(), 'não', 'não', 'não');

insert into cantada
(id_cantada, id_artista, id_musica)
values
(geraIdCantada(), 1, 3),
(geraIdCantada(), 2, 1),
(geraIdCantada(), 3, 2);

insert into possui
(id_possui, id_musica, id_propriedade)
values
(geraIdPossui(), 3, 3),
(geraIdPossui(), 2, 1),
(geraIdPossui(), 1, 1);

create database musica
database musica

drop table propriedade

select * from artista
select * from musica
select * from genero
select * from cantada
select * from possui
select * from propriedade