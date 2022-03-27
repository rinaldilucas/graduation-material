CREATE TABLE aluno2 (codA INT NOT NULL PRIMARY KEY, nomeA VARCHAR (30), notaA INT);
CREATE OR REPLACE FUNCTION bornTab2() RETURNS TRIGGER AS
$$
BEGIN
	CREATE TABLE teste(codT INT, descrT VARCHAR(20));
	RETURN new;
END;
$$
LANGUAGE 'PLPGSQL';

CREATE TRIGGER criaTab AFTER INSERT ON aluno2
FOR EACH ROW 
EXECUTE PROCEDURE bornTab2();

delete trigger criaTab;

drop 

INSERT INTO aluno2 values (1, 'Joao', 9);
INSERT INTO aluno2 values (2, 'Jorge', 10);
INSERT INTO aluno2 values (3, 'Jonas', 7);
INSERT INTO aluno2 values (4, 'sonas', 7);

SELECT * FROM aluno2;

drop table teste;

SELECT * FROM teste;

delete from aluno2 where coda = 1; --deletar linha

CREATE OR REPLACE FUNCTION selecTab() RETURNS TRIGGER AS 
$$
BEGIN
	SELECT * FROM aluno2;
	RETURN NEW;
END;
$$
LANGUAGE 'PLPGSQL';

delete from aluno2 where coda = 2;

CREATE TRIGGER selTab AFTER DELETE ON aluno2
FOR EACH ROW
EXECUTE PROCEDURE selecTab();
	