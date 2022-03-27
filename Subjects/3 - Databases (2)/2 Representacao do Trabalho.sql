create table pessoa (
	cpf int,
	rg int,
	nome varchar(20),
	endereco varchar(50),
	tel int,
	constraint cpfpk primary key (cpf), check (cpf>0)
);

create table loja (
	cnpj int,
	int tel,
	nome varchar(20)
	constraint cnpjpk primary key (cpnj), check (cnpj>0)
);

create table funcionario (
	id int,
	nome varchar(20),
	endereco varchar(50),
	comisso int,
	constraint idpk primary key (id), check (id>0)
)
;