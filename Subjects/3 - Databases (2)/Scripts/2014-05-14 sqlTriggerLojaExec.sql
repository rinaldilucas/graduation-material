-- Para efeito de teste, foram criadas funções para:
-- * APAGAR as tabelas;
-- * CRIAR as tabelas;
-- * POPULAR as tabelas(neste caso a tabela itens será instaciada manualmente, 
-- 			para que possa verificar as atualizações automáticas,
--			providas pelo gatilho e função, nas tabelas produto - 
--			atualização da quantidade em estoque - e o debito do
--			cliente na tabela cliente).

-- OBS.: Não se esqueça, não basta criar a função (escrevê-la e compilá-la) também 
--       executá-la depois ou quando necessário.


-- ===========================================================================
-- Código fonte da função "apagaTabs()" para APAGAR as tabelas:

CREATE OR REPLACE FUNCTION apagaTabs() returns void as
$$
BEGIN
	drop table clientes cascade;
	drop table produtos cascade;
	drop table compras cascade;
	drop table itens cascade;
END;
$$
LANGUAGE 'plpgsql';

-- ===========================================================================
-- Agora vamos executar a função "apagaTabs()" para APAGAR todas tabelas:

select apagaTabs();

-- ===========================================================================
-- Código fonte da função "criaTabs()" para CRIAR as tabelas

CREATE OR REPLACE FUNCTION criaTabs() returns void as
$$
BEGIN
	CREATE TABLE clientes (pk_cli INT NOT NULL PRIMARY KEY, nome varchar(20), debito INT);
	CREATE TABLE produtos (pk_prod INT NOT NULL PRIMARY KEY, descr varchar(20), valor INT, qtd_est INT);
	CREATE TABLE compras (pk_comp INT NOT NULL PRIMARY KEY, fk_cli INT, FOREIGN KEY(fk_cli) REFERENCES clientes(pk_cli)on delete cascade);
	CREATE TABLE itens (pk_item INT NOT NULL PRIMARY KEY, fk_comp INT, FOREIGN KEY(fk_comp) REFERENCES compras(pk_comp)on delete cascade,
	fk_prod INT, FOREIGN KEY(fk_prod) REFERENCES produtos(pk_prod)on delete cascade,qtd_item INT, valor_item INT);

END;
$$
LANGUAGE 'plpgsql';

-- ===========================================================================
-- Agora vamos executar a função "criaTabs()" para CRIAR as tabelas:

select criaTabs();

-- ===========================================================================
-- Código fonte da função "populaTabs()" para POPULAR as tabelas

CREATE OR REPLACE FUNCTION populaTabs() returns void as
$$
BEGIN
	INSERT INTO clientes (pk_cli, nome, debito) VALUES(1,'José',0);
	INSERT INTO clientes (pk_cli, nome, debito) VALUES(2,'Carlos',0);
	INSERT INTO clientes (pk_cli, nome, debito) VALUES(3,'Silvio',0);

	INSERT INTO produtos (pk_prod, descr, valor, qtd_est) VALUES(1,'Arroz', 1, 10);
	INSERT INTO produtos (pk_prod, descr, valor, qtd_est) VALUES(2,'Feijão', 2, 20);
	INSERT INTO produtos (pk_prod, descr, valor, qtd_est) VALUES(3,'Batata', 3, 30);

	INSERT INTO compras (pk_comp, fk_cli) VALUES(1,1);
	INSERT INTO compras (pk_comp, fk_cli) VALUES(2,2);
	INSERT INTO compras (pk_comp, fk_cli) VALUES(3,3);
	INSERT INTO compras (pk_comp, fk_cli) VALUES(4,1);	

END;
$$
LANGUAGE 'plpgsql';
-- ===========================================================================
-- Agora vamos executar a função "populaTabs()" para POPULAR as tabelas::

select  populaTabs();

-- ===========================================================================

-- Código fonte da função atualizaCli_Prod() que ATUALIZA as tabelas PRODUTOS E CLIENTES DE
--                                               ACORDO COM A INSERÇÃO DE VENDAS/ITENS.

-- OBS: neste caso A PALAVRA "NEW", indica o "NOVO" registro da tabela ITENS indicado pelo 
--      GATILHO gatAtualiza.

CREATE OR REPLACE FUNCTION atualizaCli_Prod() RETURNS TRIGGER AS
$$
	BEGIN
	--=================
	-- Débto do Cliente: 2 formas de atualizar (de acordo com uma venda/inserção de itens): 
	
	-- 1ª Forma:
		UPDATE clientes SET debito=clientes.debito+(NEW.valor_item * NEW.qtd_item) WHERE clientes.pk_cli=(SELECT compras.fk_cli FROM compras WHERE compras.pk_comp = NEW.fk_comp);

	-- 2ª Forma:
		-- UPDATE clientes SET debito=clientes.debito+(NEW.valor_item * NEW.qtd_item)FROM compras WHERE clientes.pk_cli = compras.fk_cli AND compras.pk_comp=NEW.fk_comp;

	--=================

	-- Estoque: atualizar(de acordo com uma venda/inserção de itens): 
	

		UPDATE produtos SET qtd_est=produtos.qtd_est-NEW.qtd_item WHERE produtos.pk_prod = NEW.fk_prod;

	--===================
		RETURN NEW; 
	END;
$$
LANGUAGE 'plpgsql';

-- ===========================================================================

-- CRIAÇÃO DO GATILHO gatAtualiza

CREATE TRIGGER gatAtualiza AFTER INSERT ON itens
FOR EACH ROW EXECUTE PROCEDURE atualizaCli_Prod();

--===========================================================================


-- TESTE DA ESTRUTURA POR MEIO DA INSTANCIAÇÃO DA TABELA ITENS.

-- É INTERESSANTE QUE A CADA LINHA INSERIDA VOCÊ VERIFIQUE (POR MEIO DOS SELECTS) 
-- AS TABELAS PARA VER AS ATUALIZAÇÕES.


INSERT INTO itens (pk_item, fk_comp, fk_prod, qtd_item, valor_item) VALUES(1,1,1,1,1);

SELECT * FROM clientes; -- PARA VERIFICAR SE ATUALIZOU O DÉBITO DO CLIENTE
SELECT * FROM produtos; -- PARA VERIFICAR SE ATUALIZOU O ESTOQUE DE PRODUTO

INSERT INTO itens (pk_item, fk_comp, fk_prod, qtd_item, valor_item) VALUES(2,1,2,2,2);

SELECT * FROM clientes; -- PARA VERIFICAR SE ATUALIZOU O DÉBITO DO CLIENTE
SELECT * FROM produtos; -- PARA VERIFICAR SE ATUALIZOU O ESTOQUE DE PRODUTO

INSERT INTO itens (pk_item, fk_comp, fk_prod, qtd_item, valor_item) VALUES(3,1,3,3,3);

SELECT * FROM clientes; -- PARA VERIFICAR SE ATUALIZOU O DÉBITO DO CLIENTE
SELECT * FROM produtos; -- PARA VERIFICAR SE ATUALIZOU O ESTOQUE DE PRODUTO

INSERT INTO itens (pk_item, fk_comp, fk_prod, qtd_item, valor_item) VALUES(4,2,2,2,2);

SELECT * FROM clientes; -- PARA VERIFICAR SE ATUALIZOU O DÉBITO DO CLIENTE
SELECT * FROM produtos; -- PARA VERIFICAR SE ATUALIZOU O ESTOQUE DE PRODUTO

INSERT INTO itens (pk_item, fk_comp, fk_prod, qtd_item, valor_item) VALUES(5,2,2,2,2);

SELECT * FROM clientes; -- PARA VERIFICAR SE ATUALIZOU O DÉBITO DO CLIENTE
SELECT * FROM produtos; -- PARA VERIFICAR SE ATUALIZOU O ESTOQUE DE PRODUTO

INSERT INTO itens (pk_item, fk_comp, fk_prod, qtd_item, valor_item) VALUES(6,2,2,2,2);

SELECT * FROM clientes; -- PARA VERIFICAR SE ATUALIZOU O DÉBITO DO CLIENTE
SELECT * FROM produtos; -- PARA VERIFICAR SE ATUALIZOU O ESTOQUE DE PRODUTO

INSERT INTO itens (pk_item, fk_comp, fk_prod, qtd_item, valor_item) VALUES(7,2,2,2,2);

SELECT * FROM clientes; -- PARA VERIFICAR SE ATUALIZOU O DÉBITO DO CLIENTE
SELECT * FROM produtos; -- PARA VERIFICAR SE ATUALIZOU O ESTOQUE DE PRODUTO

INSERT INTO itens (pk_item, fk_comp, fk_prod, qtd_item, valor_item) VALUES(8,3,1,1,1);

SELECT * FROM clientes; -- PARA VERIFICAR SE ATUALIZOU O DÉBITO DO CLIENTE
SELECT * FROM produtos; -- PARA VERIFICAR SE ATUALIZOU O ESTOQUE DE PRODUTO


create table historico(
pk_hist INT PRIMARY KEY,
fk_cli INT, FOREIGN KEY(fk_cli) REFERENCES clientes(pk_cli),
fk_comp INT, FOREIGN KEY(fk_comp) REFERENCES compras(pk_comp),
fk_item INT, FOREIGN KEY(fk_item) REFERENCES itens(pk_item)
);

create or replace function keepCompras() returns trigger as
$$
begin
	insert into 

end;
$$
language 'plpgsql'