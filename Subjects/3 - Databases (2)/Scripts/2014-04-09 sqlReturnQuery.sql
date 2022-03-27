-- retorna uma seleção record (grupo de registros) 
create or replace function selAluno() returns setof record as
$$
begin
	return query select * from aluno;
end;
$$
language 'plpgsql';

-- seleciona os tipos de linguagem que o postgres da suporte
select * from pg_language;

-- forma de chamar uma função que retorna uma "QUERY" por meio de registros (record)
-- seleção feita em cima dos registros gerado pela função selAluno()
select * from selAluno() as (ra int, nome varchar(30));

select * from aluno;

-- dropa uma função e seus constraints (triggers por exemplo)
drop function selAluno() cascade;

-- outra função que retorna query porem ja passando os campos na chamada da mesma 
create or replace function selAlunoTab() returns table (ra int, nome varchar(30)) as 
$$
begin
	return query select * from aluno;
end;
$$
language 'plpgsql';

-- forma de chamar a segunda função
select * from selAlunoTab();