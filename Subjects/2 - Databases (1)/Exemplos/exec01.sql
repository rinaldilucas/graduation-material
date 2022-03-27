create database execrevisao;

use execrevisao;

-- criação de tabelas
create table aluno (
matricula numeric(4) not null,
nome varchar(20),
escola varchar(20)
);

create table disciplina (
codigo char(5) not null,
nome varchar(20),
registro char(5),
escola varchar(20)
);

create table historico (
matricula numeric(4) not null,
codigo char(5) not null,
nota numeric(3,1)
);

create table professor (
registro char(5) not null,
nome varchar(20),
admissao integer
);

-- alterando tabela aluno com coluna telefone
alter table aluno add
telefone char(8);

-- excluindo coluna telefone da tabela aluno
alter table aluno drop
column telefone;

-- criando chaves primarias
alter table aluno
add primary key (matricula);

alter table disciplina
add primary key (codigo);

alter table historico
add primary key (matricula, codigo);

alter table professor
add primary key (registro);

-- criando chaves estrangeiras
alter table historico
add constraint histAlunoDiscip
foreign key (matricula)
references aluno (matricula);

alter table historico
add constraint histDiscipAluno
foreign key (codigo)
references disciplina (codigo);

-- criando restrição na tabela historico
alter table historico add
constraint nota0
	check (nota > 0);

-- dropando tabelas
alter table historico drop
constraint nota0;

alter table historico drop
constraint histAlunoDiscip;

alter table historico drop
constraint histDiscipAluno;

drop table aluno;

drop table disciplina;

drop table historico;

drop table professor;