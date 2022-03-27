create table pessoa (
	nomepessoa varchar(100) not null,
	idadepessoa int not null,
	sexopessoa varchar(1),
	sobrenomepessoa varchar(100)
);
ALTER TABLE pessoa ADD CONSTRAINT pk_pessoa PRIMARY KEY (nomepessoa);

INSERT INTO pessoa VALUES('Pedro', 40, 'M', 'Silva');
INSERT INTO pessoa VALUES('Antonio', 30, 'M', 'Souza');
INSERT INTO pessoa VALUES('Luiz', 35, 'M', 'Oliveira');
INSERT INTO pessoa VALUES('Carla', 22, 'F', 'Silva');
INSERT INTO pessoa VALUES('Lucas', 23, 'M', 'Teixeira');
INSERT INTO pessoa VALUES('Eduardo', 57, 'M', 'Souza');
INSERT INTO pessoa VALUES('Carla', 60, 'F', 'Torres');
INSERT INTO pessoa VALUES('Ana', 12, 'F', 'Silva');
INSERT INTO pessoa VALUES('Helena', 80, 'F', 'Andrade');
INSERT INTO pessoa VALUES('Elen', 20, 'F', 'Alcantara');
INSERT INTO pessoa VALUES('Helena', 55, 'F', 'Andrade');

select * from pessoa;

alter table pessoa
add column cpfpessoa integer;

UPDATE pessoa SET cpfpessoa = '254120' WHERE nomepessoa = 'Pedro';
UPDATE pessoa SET cpfpessoa = '324300' WHERE nomepessoa = 'Antonio';
UPDATE pessoa SET cpfpessoa = '443566' WHERE nomepessoa = 'Luiz';
UPDATE pessoa SET cpfpessoa = '001245' WHERE nomepessoa = 'Carla';
UPDATE pessoa SET cpfpessoa = '234234' WHERE nomepessoa = 'Lucas';
UPDATE pessoa SET cpfpessoa = '333333' WHERE nomepessoa = 'Eduardo';
UPDATE pessoa SET cpfpessoa = '500500' WHERE nomepessoa = 'Carla' and idadepessoa = 60;
UPDATE pessoa SET cpfpessoa = '999000' WHERE nomepessoa = 'Ana';
UPDATE pessoa SET cpfpessoa = '000433' WHERE nomepessoa = 'Helena';
UPDATE pessoa SET cpfpessoa = '283300' WHERE nomepessoa = 'Helen';
UPDATE pessoa SET cpfpessoa = '005679' WHERE nomepessoa = 'Helena' and idadepessoa = 55;

--4
select * from pessoa where cpfpessoa = 999000;

--5
CREATE INDEX person ON pessoa(cpfpessoa);

--6
select * from pessoa where cpfpessoa = 999000;

--7
drop index person;

--8
CREATE INDEX indiceCpf ON pessoa USING HASH (cpfpessoa);

--9
select * from pg_indexes where tablename = 'pessoa';

--10
drop index indicecpf

--11
select * from pessoa where nomepessoa = 'Helena' and idadepessoa = 55

--12
create index indiceNome on pessoa(nomepessoa, idadepessoa)

--13
select * from pessoa where nomepessoa = 'Helena' and idadepessoa = 55
