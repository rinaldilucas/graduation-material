create table setor (
id_setor int not null,
nome varchar(20),
centrodecusto int not null,
qtdemaquinas int
constraint pk_setor
primary key (id_setor),
check (id_setor > 0)
);

create table usuario (
id_usuario int not null,
nome varchar(50) not null,
matricula int not null,
id_setor int not null,
constraint pk_usuario
primary key (id_usuario),
constraint fk_setor
foreign key (id_setor)
references setor,
check (id_usuario > 0),
check (id_setor > 0)
);


create table telefone (
id_usuario int not null,
numero int,
constraint fk_usuario
foreign key (id_usuario)
references usuario,
constraint pk_telefone
primary key (id_usuario),
check (id_usuario > 0)
);

create table maquinas (
id_maquina it not null,
hostname varchar(20),
ip_wifi varchar(15),
ip_lan varchar(15),
mac varchar(17),
sistema varchar(50),
memoria_ram int,
harddisk int,
id_setor int not null,
constraint pk_maquinas
primary key (id_maquina),
constraint fk_setor
foreign key (id_setor)
references setor,
check (id_maquina > 0),
check (id_setor > 0)
);

create table aplicacoes (
id_maquina int not null,
nome varchar(30),
constraint fk_maquina
foreign key (id_maquina)
references maquina,
constraint pk_aplicacoes
primary key (id_maquina),
check (id_maquina > 0)
);

create table chamado (
id_chamado int not null,
sla time not null,
dataAbertura date not null,
dataFechamento date not null,
descricao varchar(600),
id_setor int not null,
constraint pk_chamado
primary key (id_chamado),
constraint fk_setor
foreign key id_setor
references setor,
check (id_chamado > 0),
check (id_setor > 0)
);

create table atendimento (
id_usuario int not null,
id_chamado int not null,
comentario varchar(400),
data date not null,
hora time not null,
constraint fk_usuario
foreign key (id_usuario)
references usuario,
constraint fk_chamado
foreign key (id_chamado)
references chamado,
constraint pk_atendimento
primary key (id_usuario, id_chamado),
check (id_usuario > 0),
check (id_chamado > 0)
);

create table incidente (
id_chamado int not null,
criticidade varchar(20) not null,
impacto int not null,
constraint fk_chamado
foreign key (id_chamado)
references chamado,
constraint pk_incidente
primary key (id_chamado)
);

create table requisicao (
id_chamado int not null,
centrodecusto int not null,
constraint fk_chamado
foreign key (id_chamado)
references chamado,
constraint pk_incidente
primary key (id_chamado)
);

create table externo (
id_chamado int not null,
protocolo int not null,
emp_responsavel varchar(40),
tempo_previsto time,
tec_contato varchar(40),
visita_tecnica varchar(40),
constraint fk_chamado
foreign key (id_chamado)
references chamado,
constraint pk_incidente
primary key (id_chamado)
check (protocolo > 0)
);