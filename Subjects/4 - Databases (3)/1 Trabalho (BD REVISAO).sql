CREATE TABLE pessoa(
	codpessoa serial NOT NULL,
	nomepessoa varchar(100),
	idadepessoa int,
	sexo char(1)
);
ALTER TABLE pessoa ADD CONSTRAINT pk_pessoa PRIMARY KEY (codpessoa);

CREATE TABLE tipocontato(
	codtipo serial NOT NULL,
	nometipo varchar(100)
);
ALTER TABLE tipocontato ADD CONSTRAINT pk_tipocontato PRIMARY KEY (codtipo);

CREATE TABLE contato(
	codcontato serial NOT NULL,
	codpessoafk int,
	codtipofk int,
	valor varchar(100)
);
ALTER TABLE contato ADD CONSTRAINT pk_contato PRIMARY KEY (codcontato);
alter table contato add constraint fkpessoa foreign key (codpessoafk) references pessoa (codpessoa);
alter table contato add constraint fktipo foreign key (codtipofk) references tipocontato (codtipo);

INSERT INTO pessoa (nomepessoa, idadepessoa, sexo) VALUES('John', 22, 'M');
INSERT INTO pessoa (nomepessoa, idadepessoa, sexo) VALUES('Mary', 44, 'F');
INSERT INTO pessoa (nomepessoa, idadepessoa, sexo) VALUES('Paul', 33, 'M');
INSERT INTO pessoa (nomepessoa, idadepessoa, sexo) VALUES('Dany', 31, 'F');

INSERT INTO tipocontato (nometipo) VALUES('Skype');
INSERT INTO tipocontato (nometipo) VALUES('Telefone');
INSERT INTO tipocontato (nometipo) VALUES('Celular');
INSERT INTO tipocontato (nometipo) VALUES('Email');
INSERT INTO tipocontato (nometipo) VALUES('Site');

INSERT INTO contato (codpessoafk, codtipofk, valor) VALUES(1, 1, 'john.lennon');
INSERT INTO contato (codpessoafk, codtipofk, valor) VALUES(1, 4, 'lennon@aol.com');
INSERT INTO contato (codpessoafk, codtipofk, valor) VALUES(1, 3, '(43) 99788778');
INSERT INTO contato (codpessoafk, codtipofk, valor) VALUES(1, 2, '(43) 32328899');

INSERT INTO contato (codpessoafk, codtipofk, valor) VALUES(2, 2, '(11) 34349898');
INSERT INTO contato (codpessoafk, codtipofk, valor) VALUES(2, 2, '(11) 34349000');
INSERT INTO contato (codpessoafk, codtipofk, valor) VALUES(2, 5, 'www.themary.com');

INSERT INTO contato (codpessoafk, codtipofk, valor) VALUES(3, 1, 'paul.allen');
INSERT INTO contato (codpessoafk, codtipofk, valor) VALUES(3, 4, 'paulallen@goo.com');
INSERT INTO contato (codpessoafk, codtipofk, valor) VALUES(3, 4, 'allen@gmail.com');

INSERT INTO contato (codpessoafk, codtipofk, valor) VALUES(4, 3, '(44) 8765-3123');
INSERT INTO contato (codpessoafk, codtipofk, valor) VALUES(4, 2, '(44) 32412134');
INSERT INTO contato (codpessoafk, codtipofk, valor) VALUES(4, 5, 'www.danyweb.com');


---------------------------------CONSULTAS

--1
select * from tipocontato;

--2
select nomepessoa
from pessoa
order by nomepessoa asc;

--3
select nomepessoa, sexo, 2014- idadepessoa
from pessoa;

--4
select nomepessoa, nometipo, valor from pessoa
inner join contato on (codpessoa = codpessoafk)
inner join tipocontato on (codtipo = codtipofk);

--5
select codpessoa, nomepessoa from pessoa, tipocontato
where pessoa.sexo = 'M' AND tipocontato.nometipo = 'Email';

--6
select nomepessoa, valor from pessoa
left join contato on (codpessoa = codpessoafk)
where pessoa.idadepessoa > 30;

--7
select nomepessoa, valor from pessoa
left join contato on (codpessoa = codpessoafk)
and contato.codtipofk = 4

---------------------------------------ALTERACOES

--1
ALTER TABLE pessoa
RENAME sexo TO sexopessoa;

--2
ALTER TABLE pessoa
ADD CHECK (sexopessoa IN  ('M', 'F'));

--3
ALTER TABLE pessoa
ADD CONSTRAINT idadeMaior CHECK (0 < idadepessoa and idadepessoa < 120);

--4
ALTER TABLE pessoa
add column sobrenomepessoa varchar(100);

--5
alter table contato
add column obs text;

--6
alter table contato
add column ativo boolean default true;

--7
alter table contato
alter column valor set not null;

--8 
CREATE TABLE usuario(
	login  varchar(12) not null,
	senha varchar(12) not null,
	codpessoafk integer
);

--9
alter table usuario
add constraint unicos unique(login,senha);

--10
drop table usuario

UPDATE pessoa SET sobrenomepessoa = 'Lennon' WHERE nomepessoa = 'John';
UPDATE pessoa SET sobrenomepessoa = 'People' WHERE nomepessoa = 'Mary';
UPDATE pessoa SET sobrenomepessoa = 'Allen' WHERE nomepessoa = 'Paul';
UPDATE pessoa SET sobrenomepessoa = 'Carllos' WHERE nomepessoa = 'Dany';
UPDATE contato SET ativo = TRUE;
UPDATE pessoa SET idadepessoa = idadepessoa + 1;
UPDATE pessoa SET idadepessoa = NULL WHERE nomepessoa = 'John';

--1
SELECT nomepessoa, idadepessoa FROM pessoa WHERE pessoa.idadepessoa IS NULL;

--2
SELECT pessoa.nomepessoa, contato.valor, tipocontato.nometipo FROM pessoa
LEFT JOIN contato ON (contato.codpessoafk = pessoa.codpessoa)
left join tipocontato on (tipocontato.codtipo = contato.codtipofk)
WHERE contato.valor LIKE '%gmail%' OR contato.valor LIKE '(43)%';

--3
SELECT pessoa.nomepessoa, COUNT(valor) 
FROM pessoa
left join contato on (contato.codpessoafk = pessoa.codpessoa)
group by pessoa.nomepessoa

--4
SELECT distinct pessoa.nomepessoa, COUNT(valor)
FROM pessoa
left join contato on (contato.codpessoafk = pessoa.codpessoa)
group by pessoa.nomepessoa

--5
SELECT distinct pessoa.nomepessoa, COUNT(valor)
FROM pessoa
left join contato on (contato.codpessoafk = pessoa.codpessoa)
group by pessoa.nomepessoa
having count(valor) > 4

--6
select distinct tipocontato.nometipo, count(valor) as qtdeContato, count(nomepessoa)
from tipocontato
left join contato on (contato.codtipofk = tipocontato.codtipo)
left join pessoa on (contato.codpessoafk = pessoa.codpessoa)
group by tipocontato.nometipo
order by count(valor) asc;

