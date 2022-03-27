--1
create database Aula05c

--2
create schema esquemaA;
create schema esquemaB;
create schema esquemaC;

--3
CREATE TABLESPACE espacoA LOCATION 'c:\Aula05a';
CREATE TABLESPACE espacoB LOCATION 'c:\Aula05b';
CREATE TABLESPACE espacoC LOCATION 'c:\Aula05c';

--4
CREATE TABLE esquemaA.cliente(
	id_cliente integer PRIMARY KEY,
	nome_cliente varchar(30),
	rua_cliente varchar(30),
	cidade_cliente varchar(30)
) tablespace espacoA;

insert into esquemaA.cliente values (1, 'Aurelio', 'Papa Joao Paulo', 'Curitiba');
insert into esquemaA.cliente values (2, 'Benedito', 'Pedro Cabral', 'Sao Paulo');
insert into esquemaA.cliente values (3, 'Carlos', 'Pedro de Souza', 'Belo Horizonte');
insert into esquemaA.cliente values (4, 'Gustavo', 'Presidente Vargas', 'Curitiba');

select * from esquemaA.cliente;

CREATE TABLE esquemaB.emprestimo(
	numero_emprestimo varchar(30) PRIMARY KEY,
	nome_agencia varchar(30),
	quantia integer
) tablespace espacoB;

insert into esquemaB.emprestimo values ('L-11', 'Centro', 900);
insert into esquemaB.emprestimo values ('L-13', 'Vila Maria', 1500);
insert into esquemaB.emprestimo values ('L-15', 'Vila Falcao', 1500);
insert into esquemaB.emprestimo values ('L-16', 'Vila Falcao', 1300);
insert into esquemaB.emprestimo values ('L-17', 'Parque Central', 500);

select * from esquemaB.emprestimo;

CREATE TABLE esquemaC.conta(
	numero_conta varchar(30) PRIMARY KEY,
	nome_agencia varchar(30),
	saldo integer
) tablespace espacoC;

insert into esquemaC.conta values ('A-101', 'Vila Falcao', 500);
insert into esquemaC.conta values ('A-102', 'Centro', 1000);
insert into esquemaC.conta values ('A-201', 'Vila Maria', 200);
insert into esquemaC.conta values ('A-103', 'Vila Maria', 600);
insert into esquemaC.conta values ('A-105', 'Parque Central', 200);

select * from esquemaC.conta;

--5
SELECT * FROM pg_tablespace;

--6
Select * from pg_namespace;

--7
ALTER SCHEMA esquemaA RENAME TO esq1;
ALTER SCHEMA esquemaB RENAME TO esq2;
ALTER SCHEMA esquemaC RENAME TO esq3;

--8
ALTER TABLE esq2.emprestimo SET SCHEMA esq1;
ALTER TABLE esq3.conta SET SCHEMA esq1;

--9
CREATE INDEX indiceExerc ON esq1.emprestimo (numero_emprestimo, nome_agencia);

--10
drop index esq1.indiceExerc;

--11
create index indiceExerc2 on esq1.cliente (id_cliente);

--12
create index quantiaMill on esq1.emprestimo (quantia) where quantia <= 1000;

--13
CREATE OR REPLACE FUNCTION criarTabelaComDados() RETURNS VOID AS
	$BODY$
		DECLARE
			texto_qualquer TEXT;
			i INTEGER;
		BEGIN
			i := 1;
			texto_qualquer := 'POSTGRESQL';
			DROP TABLE IF EXISTS tabela_com_dados;

			CREATE TABLE esq1.tabela_com_dados (
				id_numerico INTEGER,
				texto TEXT
			);

			LOOP	
				INSERT INTO esq1.tabela_com_dados 
				VALUES (i, texto_qualquer);
				EXIT WHEN i >= 100000;
				i:=i+1;
			END LOOP;
		END;
	$BODY$
LANGUAGE plpgsql VOLATILE;

select criarTabelaComDados();

explain analyze select * from tabela_com_dados;

--14
explain analyze select * from esq1.tabela_com_dados where id_numerico = 99999;

--15
create index otimizer on esq1.tabela_com_dados (id_numerico);

--16
explain analyze select * from esq1.tabela_com_dados where id_numerico = 99999;

--17&18
Primeira consulta = 15.966 ms
Segunda consulta = 0.096 ms

CREATE OR REPLACE FUNCTION criarTabelaComDados() RETURNS VOID AS
	$BODY$
		DECLARE
			texto_qualquer TEXT;
			i INTEGER;
		BEGIN
			i := 1;
			texto_qualquer := 'POSTGRESQL';
			DROP TABLE IF EXISTS esq1.tabela_com_dados;

			CREATE TABLE esq1.tabela_com_dados (
				id_numerico INTEGER,
				texto TEXT
			);

			LOOP	
				INSERT INTO esq1.tabela_com_dados 
				VALUES (i, texto_qualquer);
				EXIT WHEN i >= 200000;
				i:=i+1;
			END LOOP;
		END;
	$BODY$
LANGUAGE plpgsql VOLATILE;

select criarTabelaComDados();

drop table esq1.tabela_com_dados;

explain analyze select * from esq1.tabela_com_dados where id_numerico = 99999;

create index otimizer2 on esq1.tabela_com_dados (id_numerico);

explain analyze select * from esq1.tabela_com_dados where id_numerico = 99999;

Primeira consulta = 39.310 ms
Segunda consulta = 0.204 ms

--19
CREATE OR REPLACE FUNCTION criarTabelaComDados() RETURNS VOID AS
	$BODY$
		DECLARE
			texto_qualquer TEXT;
			i INTEGER;
		BEGIN
			i := 1;
			texto_qualquer := 'POSTGRESQL';
			DROP TABLE IF EXISTS esq1.tabela_com_dados;

			CREATE TABLE esq1.tabela_com_dados (
				id_numerico INTEGER,
				texto TEXT
			);

			LOOP	
				INSERT INTO esq1.tabela_com_dados 
				VALUES (i, texto_qualquer);
				EXIT WHEN i >= 300000;
				i:=i+1;
			END LOOP;
		END;
	$BODY$
LANGUAGE plpgsql VOLATILE;

select criarTabelaComDados();

drop table esq1.tabela_com_dados;

explain analyze select * from esq1.tabela_com_dados where id_numerico = 99999;

create index otimizer3 on esq1.tabela_com_dados (id_numerico);

explain analyze select * from esq1.tabela_com_dados where id_numerico = 99999;

Primeira consulta = 59.250 ms
Segunda consulta = 0.112 ms

CREATE OR REPLACE FUNCTION criarTabelaComDados() RETURNS VOID AS
	$BODY$
		DECLARE
			texto_qualquer TEXT;
			i INTEGER;
		BEGIN
			i := 1;
			texto_qualquer := 'POSTGRESQL';
			DROP TABLE IF EXISTS esq1.tabela_com_dados;

			CREATE TABLE esq1.tabela_com_dados (
				id_numerico INTEGER,
				texto TEXT
			);

			LOOP	
				INSERT INTO esq1.tabela_com_dados 
				VALUES (i, texto_qualquer);
				EXIT WHEN i >= 400000;
				i:=i+1;
			END LOOP;
		END;
	$BODY$
LANGUAGE plpgsql VOLATILE;

select criarTabelaComDados();

drop table esq1.tabela_com_dados;

explain analyze select * from esq1.tabela_com_dados where id_numerico = 99999;

create index otimizer4 on esq1.tabela_com_dados (id_numerico);

explain analyze select * from esq1.tabela_com_dados where id_numerico = 99999;

Primeira consulta = 79.240 ms
Segunda consulta = 0.107 ms

CREATE OR REPLACE FUNCTION criarTabelaComDados() RETURNS VOID AS
	$BODY$
		DECLARE
			texto_qualquer TEXT;
			i INTEGER;
		BEGIN
			i := 1;
			texto_qualquer := 'POSTGRESQL';
			DROP TABLE IF EXISTS esq1.tabela_com_dados;

			CREATE TABLE esq1.tabela_com_dados (
				id_numerico INTEGER,
				texto TEXT
			);

			LOOP	
				INSERT INTO esq1.tabela_com_dados 
				VALUES (i, texto_qualquer);
				EXIT WHEN i >= 500000;
				i:=i+1;
			END LOOP;
		END;
	$BODY$
LANGUAGE plpgsql VOLATILE;

select criarTabelaComDados();

drop table esq1.tabela_com_dados;

explain analyze select * from esq1.tabela_com_dados where id_numerico = 99999;

create index otimizer4 on esq1.tabela_com_dados (id_numerico);

explain analyze select * from esq1.tabela_com_dados where id_numerico = 99999;

Primeira consulta = 118.015 ms
Segunda consulta = 0.112 ms





