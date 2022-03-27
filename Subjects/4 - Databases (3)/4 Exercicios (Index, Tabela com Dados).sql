--1
CREATE OR REPLACE FUNCTION criarTabelaComDados() RETURNS VOID AS
	$BODY$
		DECLARE
			texto_qualquer TEXT;
			i INTEGER;
		BEGIN
			i := 1;
			texto_qualquer := 'PostgreSQL allows functions that have named parameters to be called using either positional or named notation. Named notation is especially useful for functions that have a large number of parameters, since it makes the associations between parameters and actual arguments more explicit and reliable. In positional notation, a function call is written with its argument values in the same order as they are defined in the function declaration. In named notation, the arguments are matched to the function parameters by name and can be written in any order.';
			DROP TABLE IF EXISTS tabela_com_dados;

			CREATE TABLE tabela_com_dados (
				id_numerico INTEGER, id_literal VARCHAR(32), texto1 TEXT, texto2 TEXT, texto3 TEXT, texto4 TEXT, texto5 TEXT, texto6 TEXT, texto7 TEXT, texto8 TEXT, texto9 TEXT, texto10 TEXT
			);

			LOOP	
				INSERT INTO tabela_com_dados (id_numerico, id_literal, texto1, texto2, texto3, texto4, texto5, texto6, texto7, texto8, texto9, texto10)
				VALUES (i, MD5(i::TEXT), texto_qualquer, texto_qualquer, texto_qualquer, texto_qualquer, texto_qualquer, texto_qualquer, texto_qualquer, texto_qualquer, texto_qualquer, texto_qualquer);
				EXIT WHEN i > 500000;
				i:=i+1;
			END LOOP;
		END;
	$BODY$
LANGUAGE plpgsql VOLATILE;

--2
select criarTabelaComDados();

--3
explain analyze select id_literal from tabela_com_dados where id_numerico = 500000;

--4
97301,750 ms

--5
create index exercicio on tabela_com_dados using hash (id_literal);

--6
60536,537 ms

--7
97301,750 ms | 60536,537 ms

--8
explain analyze select id_numerico from tabela_com_dados where id_numerico > 499998 and id_numerico < 500001;
456984.890 ms

--9
create index exercicio2 on tabela_com_dados (id_numerico);

--10
58.191 ms

--11
456984.890 ms | 58.191 ms
