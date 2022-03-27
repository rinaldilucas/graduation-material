--funcao criando tabela
CREATE OR REPLACE FUNCTION criaTab() returns void as 
$$
BEGIN
	CREATE TABLE aluno(ra INT NOT NULL PRIMARY KEY, nome VARCHAR(30));
END;
$$
LANGUAGE 'plpgsql'

SELECT criaTab();
SELECT * FROM aluno;
DROP TABLE aluno;

COMMIT --armazenar no HD

--funcao sem retorno modificando tabela
CREATE OR REPLACE FUNCTION insAluno (INTEGER, VARCHAR(30)) RETURNS void AS
$$
BEGIN
	INSERT INTO aluno (ra, nome) VALUES ($1, $2);
END;
$$
LANGUAGE 'plpgsql';

SELECT insAluno(geraRa(), 'Jesus');
SELECT * FROM aluno;

--funcao com retorno
CREATE OR REPLACE FUNCTION geraRa() RETURNS INTEGER AS 
$$
DECLARE
	numReg INTEGER := 0;

BEGIN
	numReg := count(*)+1 FROM aluno;
	RETURN numReg;
END;
$$
LANGUAGE 'plpgsql';

CREATE OR REPLACE FUNCTION delAluno(INTEGER) RETURNS void AS
$$
DECLARE
	numero alias for $1;

BEGIN
	DELETE FROM aluno WHERE ra = numero;
END;
$$
LANGUAGE 'plpgsql';

SELECT delAluno(2);
SELECT * FROM aluno;

