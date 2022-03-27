create database locadora5

use locadora5

create table Empresa(
CNPJPK int not null,
nomeFantasia varchar(50),
razaoSocial varchar(50)
);

create table Funcionario(
codigoPK int not null,
nome varchar(50),
turno varchar(10),
CNPJ_EmpresaFK int not null
);

create table Cliente(
RGPK int not null,
nome varchar(50),
tipoHabilitacao varchar(10)
);

create table Telefone(
RG_ClienteFK int not null,
telefone int
);

create table Veiculo(
placaPK varchar(10) not null,
preco float,
ano int,
cor varchar(20)
);

create table VeiculoCliente(
placaFK varchar(10) not null,
RG_ClienteFK int not null,
datainicio date not null,
datafim date not null,
statusVeiculo varchar(20) not null,
codigoFuncionarioFK int not null
);

create table Carro(
placaFKPK varchar(10) not null,
numPassageiros int
);

create table Caminhao(
placaFKPK varchar(10) not null,
numEixos int
);

create table Moto(
placaFKPK varchar(10) not null,
cilindradas int,
numRodas int
);


--CHAVES PRIMÁRIAS

alter table Empresa
add primary key (CNPJPK);

alter table Funcionario
add primary key (codigoPK);

alter table Cliente
add primary key (RGPK);

alter table Telefone
add primary key (RG_ClienteFK);

alter table Veiculo
add primary key (placaPK);

alter table VeiculoCliente
add primary key (placaFK, RG_ClienteFK, datainicio);

alter table Carro
add primary key (placaFKPK);

alter table Caminhao
add primary key (placaFKPK);

alter table Moto
add primary key (placaFKPK);

--CONSTRAITS

alter table Funcionario
add constraint EmpresaDoFuncionario
foreign key (CNPJ_EmpresaFK)
references Empresa(CNPJPK);

alter table Telefone
add constraint TelefoneDoCliente
foreign key (RG_ClienteFK)
references Cliente(RGPK);

alter table VeiculoCliente
add constraint RGDoCliente
foreign key (RG_ClienteFK)
references Cliente(RGPK);

alter table VeiculoCliente
add constraint PlacaDoVeiculoCliente
foreign key (placaFK)
references Veiculo(placaPK);

alter table VeiculoCliente
add constraint FuncionarioQueAlugou
foreign key (codigoFuncionarioFK)
references Funcionario(codigoPK);

alter table Carro
add constraint CarroAlugado
foreign key (placaFKPK)
references Veiculo(placaPK);

alter table Caminhao
add constraint CaminhaoAlugado
foreign key (placaFKPK)
references Veiculo(placaPK);

alter table Moto
add constraint MotoAlugada
foreign key (placaFKPK)
references Veiculo(placaPK);

/*
create table Empresa(
CNPJPK int not null,
nomeFantasia varchar(50),
razaoSocial varchar(50)
);
*/

insert into Empresa
values (123456,'LOCADORA LOCATUDO', 'NATANAEL OLIVEIRA - ME');

/*
create table Funcionario(
codigoPK int not null,
nome varchar(50),
turno varchar(10),
CNPJ_EmpresaFK int not null
);
*/

insert into Funcionario
values (0001,'JOAO RICARDO', 'MATUTINO',123456);
insert into Funcionario
values (0002,'RUBEM ALVES', 'MATUTINO',123456);
insert into Funcionario
values (0003,'LUCAS REINALDI', 'VESPERTINO',123456);
insert into Funcionario
values (0004,'JULIO ASSUNCAO', 'VESPERTINO',123456);
insert into Funcionario
values (0005,'RODRIGO VITOR', 'INTEGRAL',123456);

/*
create table Cliente(
RGPK int not null,
nome varchar(50),
tipoHabilitacao varchar(10)
);
*/

insert into Cliente
values (654321,'CLIENTE 1', 'A');
insert into Cliente
values (123321,'CLIENTE 2', 'AB');
insert into Cliente
values (654456,'CLIENTE 3', 'B');
insert into Cliente
values (321123,'CLIENTE 4', 'A');
insert into Cliente
values (654123,'CLIENTE 5', 'B');

/*
create table Telefone(
RG_ClienteFK int not null,
telefone int
);
*/

insert into Telefone
values (654321,5232164);
insert into Telefone
values (123321,5232125);
insert into Telefone
values (654456,5231244);
insert into Telefone
values (321123,5232234);
insert into Telefone
values (654123,5232135);

/*
create table Veiculo(
placaPK varchar(10) not null,
preco float,
ano int,
cor varchar(20)
);
*/

insert into Veiculo
values ('CAR1234',100,2010,'BRANCO');
insert into Veiculo
values ('CAR4321',150,2012,'PRETO');
insert into Veiculo
values ('CAM1234',200,2007,'VERMELHO');
insert into Veiculo
values ('CAM4321',250,2009,'PRATA');
insert into Veiculo
values ('MOT1234',50,2008,'AMARELO');
insert into Veiculo
values ('MOT4321',75,2013,'BRANCO');

/*
create table VeiculoCliente(
placaFK varchar(10) not null,
RG_ClienteFK int not null,
datainicio date not null,
datafim date not null,
statusVeiculo varchar(20) not null,
codigoFuncionarioFK int not null
);
*/

insert into VeiculoCliente
values ('CAR1234',123321,'01/01/2014','01/02/2014','DEVOLVIDO',0001);
insert into VeiculoCliente
values ('CAR4321',654456,'20/01/2014','20/02/2014','ALUGADO',0003);
insert into VeiculoCliente
values ('CAM1234',321123,'01/01/2014','28/02/2014','ALUGADO',0005);

/*
create table Carro(
placaFKPK varchar(10) not null,
numPassageiros int
);
*/

insert into Carro
values ('CAR1234',5);
insert into Carro
values ('CAR4321',7);

/*
create table Caminhao(
placaFKPK varchar(10) not null,
numEixos int
);
*/

insert into Caminhao
values ('CAM1234',2);
insert into Caminhao
values ('CAM4321',3);

/*
create table Moto(
placaFKPK varchar(10) not null,
cilindradas int,
numRodas int
);
*/

insert into Moto
values ('MOT1234',125,2);
insert into Moto
values ('MOT4321',150,2);