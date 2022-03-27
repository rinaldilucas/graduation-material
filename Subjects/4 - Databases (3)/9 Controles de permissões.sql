create user usuer1 password 'user1';

create database aulapermissoes with owner user1;

alter user user1 createdb createrole;

create role funcionario;

set role funcionario;

create table professor (
	id_prof int,
	nome_prof varchar(30)
);

create table aluno (
	id_alun int,
	nome_prof varchar(30)
);

grant all on table professor, aluno to user1;

reset role;

create user user2 password 'user2';

grant select on table aluno to user2;

create user user3 password 'user3';

grant select, insert, update on table aluno to user2;

grant create, connect on database aulapermissoes to user2;

create schema schema1;

grant usage on schema schema1 to user2;	

grant all on schema schema1 to user1;

alter table professor set schema schema1;

grant usage on schema schema1 to user3;

create role cliente;

create user user4 password 'user4';

create user user5 password 'user5';

create user user6 password 'user6';

grant user4, user5, user6 to cliente;

create schema schema2;

grant all on schema schema2 to cliente;