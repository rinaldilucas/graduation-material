-- Sintax Básica


-- Criação das tabelas de exemplo
CREATE TABLE sal_emp (
    name            text,
    pay_by_quarter  integer[],
    agenda        text[][]
);

INSERT INTO sal_emp
    VALUES ('Bill',
    '{10000, 10000, 10000, 10000}',
    '{{"meeting", "lunch"}, {"training", "presentation"}}');

INSERT INTO sal_emp
    VALUES ('Carol',
    '{20000, 25000, 25000, 25000}',
    '{{"breakfast", "consulting"}, {"meeting", "lunch"}}');

-- Busca de exemplificação
select * from sal_emp;

-- Seleciona da tabela sal_emp quando pay_by_quarter do indice 1 for diferente do pay_by_quarter do indice 2
SELECT name FROM sal_emp WHERE pay_by_quarter[1] <> pay_by_quarter[2];

-- Seleciona nome e pay_by_quarter da talela sal_emp quando o nome for igual a Carol
SELECT name, pay_by_quarter FROM sal_emp WHERE name = 'Carol';

-- Seleciona nome e pay_by_quarter da talela sal_emp quando o nome for igual a Bill
SELECT name, pay_by_quarter FROM sal_emp WHERE name = 'Bill';

-- Seeciona a agenda da tabela sal_emp linha 1, culona 2 quando o nome for Bill
SELECT agenda[1:2][2] FROM sal_emp WHERE name = 'Bill';

-- Seleciona a dimensão do array agenda(agenda) quando o nome for Carol
SELECT array_dims(agenda) FROM sal_emp WHERE name = 'Carol';

-- Busca no na tabela sal_emp quando as condições forem atendidas
SELECT * FROM sal_emp WHERE pay_by_quarter[1] = 10000 OR
                            pay_by_quarter[2] = 10000 OR
                            pay_by_quarter[3] = 10000 OR
                            pay_by_quarter[4] = 10000;


-- Busca na tabela sal_emp quando qualquer das celulas de pay_by_quarter for igual a 10000
SELECT * FROM sal_emp WHERE 10000 = ANY (pay_by_quarter);

-- Busca na tabela sal_emp quando todas as celulas de pay_by_quarter forem iguais a 10000
SELECT * FROM sal_emp WHERE 10000 = ALL (pay_by_quarter);

-- Atualiza o array pay_by_quarter quando o nome for Carol
UPDATE sal_emp SET pay_by_quarter = '{25000,25000,27000,27000}'
    WHERE name = 'Carol';

-- Atualiza o array pay_by_quarter quando o nome for Carol
UPDATE sal_emp SET pay_by_quarter = ARRAY[25000,25000,27000,27000]
    WHERE name = 'Carol';   

-- Atualiza o array pay_by_quarter quando o nome for Carol
UPDATE sal_emp SET pay_by_quarter[1:2] = '{27000,27000}'
    WHERE name = 'Carol';

-- Concatena 2 arrays criando um novo array de uma dimensão
SELECT ARRAY[1,2] || ARRAY[3,4];

SELECT ARRAY[5,6] || ARRAY[[1,2],[3,4]];

SELECT array_dims(ARRAY[[1,2],[3,4]] || ARRAY[[5,6],[7,8],[9,0]]);

-- Concatena 2 arrays de dimensões diferentes, resultando em um novo array quhe segue a dimensão do maior array
SELECT array_dims(ARRAY[1,2] || ARRAY[[3,4],[5,6]]);

-- Contana com outra sintax
-- Uma dimensão
-- array_prepend
SELECT array_prepend(1, ARRAY[2,3]);

-- array_append
SELECT array_append(ARRAY[1,2], 3);

-- multi dimensões
-- array_cat
SELECT array_cat(ARRAY[1,2], ARRAY[3,4]);

SELECT array_cat(ARRAY[[1,2],[3,4]], ARRAY[5,6]);

SELECT array_cat(ARRAY[5,6], ARRAY[[1,2],[3,4]]);

--procura posição matriz
create or replace function matriz(a int, b int)
returns text as
$$
	declare
		arr text[2][2]:=array[['C','A'],['D','E']];
begin
	return arr[a][b];
end;
$$
language 'plpgsql';
 
select * from matriz(2,2);

--procura valor matriz
create or replace function procuraMatriz(v char) returns text as
$$
declare
	arr text[2][2]:=array[['C','A'],['D','E']];
begin
	for i in 1..2 loop
		for j in 1..2 loop
			if arr[i][j] =  v then
				return v;
			end if;
		end loop;
	end loop;
	return null;
end;
$$
language 'plpgsql';

select * from procuraMatriz('A');
create or replace function procuraMatriz(v char) returns text as
$$
declare
	arr text[2][2]:=array[['C','A'],['D','E']];
begin
	for i in 1..2 loop
		for j in 1..2 loop
			if arr[i][j] =  v then
				return v;
			end if;
		end loop;
	end loop;
	return null;
end;
$$
language 'plpgsql';
select * from procuraMatriz('z');