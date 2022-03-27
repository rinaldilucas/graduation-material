create database universidade2;

use universidade2;

-- criando tabelas
create table aluno (
numAlunoPK int not null,
nome varchar(50) not null,
endereco varchar(50),
cidade varchar(50),
telefone varchar(30),
numCursoFK int not null,
check (numAlunoPK > 0),
check (telefone > 0),
check (numCursoFK > 0)
);

create table disciplina (
numDiscipPK int not null,
nome varchar(30) not null,
quantCreditos int,
check (numDiscipPK > 0)
);

create table professor (
numFuncPK int not null,
nome varchar(50) not null,
admissao date,
areaPesquisa varchar(50) not null,
check (numFuncPK > 0)
);

create table curso (
numCursoPK int not null,
nome varchar(30) not null,
totalCreditos int,
check (numCursoPK > 0),
check (totalCreditos >= 0)
);

create table aula (
numAlunoFK int not null,
numDiscipFK int not null,
numFuncFK int not null,
semestre varchar(10) not null,
nota float not null,
check (numAlunoFK > 0),
check (numDiscipFK > 0),
check (numFuncFK > 0),
check (semestre > 0),
check (nota > 0)
);

create table discipCurso (
numDiscipFK int not null,
numCursoFK int not null,
check (numDiscipFK > 0),
check (numCursoFK > 0)
);

-- criando chaves primarias
alter table aluno
add primary key (numAlunoPK);

alter table disciplina
add primary key (numDiscipPK);

alter table professor
add primary key (numFuncPK);

alter table curso
add primary key (numCursoPK);

alter table aula
add primary key (numAlunoFK, numDiscipFK, numFuncFK, semestre);

alter table discipCurso
add primary key (numDiscipFK, numCursoFK);

-- criando chaves estrangeiras

alter table aluno
add constraint CursoComAluno
foreign key (numCursoFK)
references curso (numCursoPK);

alter table aula
add constraint AlunoComAula
foreign key (numAlunoFK)
references aluno (numAlunoPK);

alter table aula
add constraint DiscipComAula
foreign key (numDiscipFK)
references disciplina (numDiscipPK);

alter table aula
add constraint ProfessComAula
foreign key (numFuncFK)
references professor (numFuncPK);

alter table discipCurso
add constraint DiscipComDiscipCurso
foreign key (numDiscipFK)
references disciplina (numDiscipPK);

alter table discipCurso
add constraint CursoComDiscipCurso
foreign key (numCursoFK)
references curso (numCursoPK);


-- inserinfo dados na tabela professor

insert into professor
(numFuncPK, nome, admissao, areaPesquisa)
values
('45675', 'Abgair Simon Ferreira', '10/04/1992', 'Banco de Dados'),
('45690', 'Ramon Travanti', '05/20/1993', 'Direito Romano'),
('45691', 'Gustavo Golveia Netto', '04/05/1993', 'Sociologia'),
('45692', 'Marcos Salvador', '03/31/1993', 'Matemática Financeira'),
('45693', 'Cintia Falcão', '02/15/1993', 'Engenharia Software');

-- inserindo dados na talbela curso

insert into curso
(numCursoPK, nome, totalCreditos)
values
('2142', 'Engenharia Civil', '1500'),
('2143', 'Ciência da Computação', '2000'),
('2144', 'Direito', '1750'),
('2145', 'Pedagogia', '1500'),
('2146', 'Odontologia', '1600');


-- inserindo dados na tabela disciplina

insert into disciplina
(numDiscipPK, nome, quantCreditos)
values
('1', 'Banco de Dados', '30'),
('2', 'Estrutura de Dados', '30'),
('3', 'Direito Penal', '25'),
('4', 'Cálculo Numérico', '30'),
('5', 'Psicologia Infantil', '25'),
('6', 'Direito Tributário', '33'),
('7', 'Engenharia de Software', '2');


-- inserindo valores em dispCurso

insert into discipCurso
(numDiscipFK, numCursoFK)
values
('1', '2143'),
('2', '2143'),
('3', '2144'),
('4', '2143'),
('4', '2142'),
('5', '2145'),
('6', '2144'),
('7', '2143'),
('7', '2142');



-- inserindo valores em aula

insert into aula
(numAlunoFK, numDiscipFK, numFuncFK, semestre, nota)
values
('111', '1', '45675', '198', 5.00),
('111', '2', '45675', '198', 6.00),
('111', '2', '45675', '298', 7.00),
('115', '3', '45690', '198', 8.00),
('115', '3', '45690', '298', 9.00),
('111', '4', '45692', '198', 10.00),
('112', '4', '45692', '198', 8.00),
('113', '5', '45691', '198', 8.00),
('114', '1', '45675', '298', 8.00),
('114', '2', '45675', '198', 9.00),
('112', '1', '45675', '198', 7.00),
('111', '7', '45693', '198', 1.00),
('115', '6', '45690', '198', 9.00),
('112', '7', '45693', '198', 5.00),
('114', '4', '45692', '198', 6.00),
('114', '4', '45692', '298', 8.00),
('116', '4', '45692', '198', 3.00),
('116', '4', '45692', '298', 9.00),
('114', '7', '45693', '198', 9.00),
('116', '7', '45693', '198', 8.00);


insert into aluno
(numAlunoPK, nome, endereco, cidade, telefone, numCursoFK)
values
('111', 'E.C.Silva', 'Av.São Carlos,186', 'São Carlos', '0172769999', '2143'),
('112', 'J.B.Scapin', 'R.José Bonifácio, 70', 'São Carlos', null, '2142'),
('113', 'C.A.Silveira', 'R.Luiz Camões, 120', 'Ibaté', '0172788568', '2145'),
('114', 'M.J.Casanova', 'Av. São Carlos, 176', 'São Carlos', null, '2143'),
('115', 'S.C.Lima', 'R.Raul Junior, 180', 'São Carlos', '0172739865', '2144'),
('116', 'A.Castro', 'R. Antonio Carlos, 1', 'Ibaté', '0172748568', '2142'),
('117', 'J.P.Figueira', 'R. XV de Novembro, 871', 'São Carlos', null, '2145');


select aluno.nome, curso.nome from aluno, curso
where curso.numCursoPK = aluno.numCursoFK;



select curso.nome, disciplina.nome from curso, disciplina, discipCurso
where 
curso.numCursoPK = discipCurso.numCursoFK and 
disciplina.numDiscipPK = discipCurso.numDiscipFK and 
curso.nome = 'Ciência da Computação';


select curso.nome, disciplina.nome from curso, disciplina, discipCurso
where 
curso.numCursoPK = discipCurso.numCursoFK and 
disciplina.numDiscipPK = discipCurso.numDiscipFK and 
disciplina.nome = 'Cálculo Numérico';


select disciplina.nome, aluno.nome
from aluno, disciplina, aula
where
aluno.numAlunoPK = aula.numAlunoFK and
disciplina.numDiscipPK = aula.numDiscipFK and
aluno.nome = 'M.J.Casanova' and
aula.semestre = '198';


select disciplina.nome, aluno.nome
from aluno, disciplina, aula
where
aluno.numAlunoPK = aula.numAlunoFK and
disciplina.numDiscipPK = aula.numDiscipFK and
aluno.nome = 'A.Castro' and
aula.nota < 6;


select disciplina.nome, aluno.nome
from aluno, disciplina, aula
where
aluno.numAlunoPK = aula.numAlunoFK and
disciplina.numDiscipPK = aula.numDiscipFK and
disciplina.nome = 'Cálculo Numérico' and
aula.nota < 6 and
aula.semestre = '198';


select distinct disciplina.nome, professor.nome
from disciplina, professor, aula
where
professor.numFuncPK = aula.numFuncFK and
disciplina.numDiscipPK = aula.numDiscipFK and
professor.nome = 'Ramon Travanti';


select distinct disciplina.nome, professor.nome
from disciplina, aula, professor
where
professor.numFuncPK = aula.numFuncFK and
disciplina.numDiscipPK = aula.numDiscipFK and
disciplina.nome = 'Banco de Dados';


select max(nota) as maior_nota,
min(nota) as menor_nota
from aula, disciplina
where disciplina.numDiscipPK = aula.numDiscipFK and
disciplina.nome = 'Cálculo Numérico' and
aula.semestre = '198';

select aluno.nome, disciplina.nome, professor.nome
from aluno, disciplina, professor, aula
where aluno.numAlunoPK = aula.numAlunoFK and 
disciplina.numDiscipPK = aula.numDiscipFK and
professor.numFuncPK = aula.numFuncFK and 
aula.semestre = '198'
order by aluno.nome asc;

select aluno.nome, disciplina.nome, aula.nota
from aluno, disciplina, aula, curso
where aluno.numAlunoPK = aula.numAlunoFK and
disciplina.numDiscipPK = aula.numDiscipFK and
curso.numCursoPK = aluno.numCursoFK and
curso.nome = 'Ciência da Computação' and
aula.semestre = '198';

select avg(nota) as media_nota
from aula, professor
where professor.numFuncPK = aula.numFuncFK and
professor.nome = 'Marcos Salvador';

select aluno.nome, disciplina.nome, aula.nota
from aluno, disciplina, aula
where aluno.numAlunoPK = aula.numAlunoFK and
disciplina.numDiscipPK = aula.numDiscipFK and
aula.nota > 5 and
aula.nota < 7
order by disciplina.nome asc;

select avg(nota) as media_nota
from aula, disciplina
where disciplina.numDiscipPK = aula.numDiscipFK and
disciplina.nome = 'Cálculo Numérico' and
aula.semestre = '198';

select distinct professor.nome, count(aluno.nome) as qtdeAluno, aula.semestre
from aluno, professor, aula
where aluno.numAlunoPK = aula.numAlunoFK and
professor.numFuncPK = aula.numFuncFK and
professor.nome = 'Abgair Simon Ferreira' and
aula.semestre = '198'
group by professor.nome, aula.semestre;


select aluno.nome, avg(aula.nota) as mediaNota,
count(disciplina.numDiscipPK) as qtdeAulas
from aluno, disciplina, aula
where aluno.numAlunoPK = aula.numAlunoFK and
disciplina.numDiscipPK = aula.numDiscipFK and
aluno.nome = 'E.C.Silva'
group by aluno.nome;


select curso.nome, disciplina.nome, avg(aula.nota) as mediaNota
from aula, curso, disciplina, discipCurso
where disciplina.numDiscipPK = aula.numDiscipFK and
curso.numCursoPK = discipCurso.numCursoFK and
discipCurso.numDiscipFK = aula.numDiscipFK and
aula.semestre = '198'
group by disciplina.nome, curso.nome
order by disciplina.nome asc;


select professor.nome, avg(aula.nota) as mediaNotas, 
count(aula.nota) as qtdeNotas
from professor, aula
where professor.numFuncPK = aula.numFuncFK and
aula.semestre = '198'
group by professor.nome;

select curso.nome as cursoNome, disciplina.nome as discipNome, avg(aula.nota) as mediaNotas, aula.semestre
from curso, disciplina, aula, discipCurso
where curso.numCursoPK = discipCurso.numCursoFK and
disciplina.numDiscipPK = aula.numDiscipFK and
discipCurso.numDiscipFK = disciplina.numDiscipPK and
curso.nome = 'Ciência da Computação' and
aula.semestre = '198'
group by curso.nome, disciplina.nome, aula.semestre;