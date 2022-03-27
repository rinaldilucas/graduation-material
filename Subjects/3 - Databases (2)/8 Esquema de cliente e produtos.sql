--funcao cliente
CREATE OR REPLACE FUNCTION criaCliente() returns void as 
$$
BEGIN
	CREATE TABLE cliente(
		idPkCliente INT NOT NULL,
		nome VARCHAR(30),
		CONSTRAINT idPkCli PRIMARY KEY (idPkCliente)
	);
END;
$$
LANGUAGE 'plpgsql'

--funcao compra
CREATE OR REPLACE FUNCTION criaCompra() returns void as 
$$
BEGIN
	CREATE TABLE compra(
		dataPkCompra INT NOT NULL,
		idFkCliente INT NOT NULL,
		idFkProduto INT NOT NULL,
		CONSTRAINT idPkCo PRIMARY KEY (dataPkCompra),
		CONSTRAINT idFkCl FOREIGN KEY (idFkCliente) REFERENCES cliente(idPkCliente),
		CONSTRAINT idFkPro FOREIGN KEY (idFkProduto) REFERENCES produto(idPkProduto)
	);
END;
$$
LANGUAGE 'plpgsql'

--funcao produto
CREATE OR REPLACE FUNCTION criaProduto() returns void as 
$$
BEGIN
	CREATE TABLE produto(
		idPkProduto INT NOT NULL,
		nome VARCHAR(30),
		preco INT,
		CONSTRAINT idPkPro PRIMARY KEY (idPkProduto)
	);
END;
$$
LANGUAGE 'plpgsql'

--seleciona as tabelas
SELECT criaCliente();
SELECT criaProduto();
SELECT criaCompra();

COMMIT --armazenar no HD

--insere cliente
CREATE OR REPLACE FUNCTION insCliente (INTEGER, VARCHAR(30)) RETURNS void AS
$$
BEGIN
	INSERT INTO cliente(idPkCliente, nome) VALUES ($1, $2);
END;
$$
LANGUAGE 'plpgsql';

--insere produto
CREATE OR REPLACE FUNCTION insProduto (INTEGER, VARCHAR(30), INTEGER) RETURNS void AS
$$
BEGIN
	INSERT INTO produto(idPkProduto, nome, preco) VALUES ($1, $2, $3);
END;
$$
LANGUAGE 'plpgsql';

--insere compra
CREATE OR REPLACE FUNCTION insCompra (INTEGER, INTEGER, INTEGER) RETURNS void AS
$$
BEGIN
	INSERT INTO compra(dataPkCompra, idFkCliente, idFkProduto) VALUES ($1, $2, $3);
END;
$$
LANGUAGE 'plpgsql';

--gerar id pra cliente
CREATE OR REPLACE FUNCTION geraIdCliente() RETURNS INTEGER AS 
$$
DECLARE
	numReg INTEGER := 0;

BEGIN
	numReg := count(*)+1 FROM cliente;
	RETURN numReg;
END;
$$
LANGUAGE 'plpgsql';

--gerar id pra compra
CREATE OR REPLACE FUNCTION geraIdCompra() RETURNS INTEGER AS 
$$
DECLARE
	numReg INTEGER := 0;

BEGIN
	numReg := count(*)+1 FROM compra;
	RETURN numReg;
END;
$$
LANGUAGE 'plpgsql';

--gerar id pra produto
CREATE OR REPLACE FUNCTION geraIdProduto() RETURNS INTEGER AS 
$$
DECLARE
	numReg INTEGER := 0;

BEGIN
	numReg := count(*)+1 FROM produto;
	RETURN numReg;
END;
$$
LANGUAGE 'plpgsql';


--insere na tabela Cliente
SELECT insCliente(geraIdCliente(), 'Lucas');
SELECT insCliente(geraIdCliente(), 'Joao');
SELECT insCliente(geraIdCliente(), 'Rubem');

--insere na tabela Produto
SELECT insProduto(geraIdProduto(), 'Tomate', 4);
SELECT insProduto(geraIdProduto(), 'Banana', 3);
SELECT insProduto(geraIdProduto(), 'Abacaxi', 2);

--insere na tabela Compra
SELECT insCompra (geraIdCompra(), 1, 1);
SELECT insCompra (geraIdCompra(), 2, 2);
SELECT insCompra (geraIdCompra(), 3, 1);

--veririca as tabelas
SELECT * FROM cliente;
SELECT * FROM produto;
SELECT * FROM compra;

SELECT cl.nome nome_do_funcionario FROM cliente cl, compra co, produto pr
where cl.idpkcliente = co.idfkcliente and
pr.idpkproduto = co.idfkproduto;
