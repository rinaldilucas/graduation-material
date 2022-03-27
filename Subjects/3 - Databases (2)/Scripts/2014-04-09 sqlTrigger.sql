 create table aluno (codA int not null primary key, nomeA varchar(30), notaA int);

create or replace function bornTab() returns trigger as
$$
begin
	create table teste(codT int, descrT varchar(20));
	return new;
end;
$$
language 'plpgsql';


insert into aluno
(codA, nomeA, notaA)
values
(1, 'Rubem', 10),
(2, 'Duda', 10),
(3, 'Joao', 2);

insert into aluno
(codA, nomeA, notaA)
values
(4, 'Bianca', 9)

create trigger criaTab after insert on aluno for each row
execute procedure bornTab()

select * from aluno
drop function mostraAluno()
drop trigger selecionaAluno


create or replace function mostraAluno() returns trigger as
$$
begin
	select * from aluno;
	return query;
end;
$$
language 'plpgsql';

create trigger selecionaAluno after delete on aluno for each row
execute procedure mostraAluno()


delete from aluno where aluno.nomeA = 'Bianca'