create table cliente (
cpf int not null,
nome varchar(40),
debito float,
constraint pk_cliente
primary key (cpf)
);

create table compra (
nf int not null,
cpf int not null,
constraint pk_compra
primary key (nf),
constraint fk_cliente
foreign key (cpf)
references cliente
);

create table produto (
id_produto int not null,
nome varchar(50),
qtde int,
preço float,
constraint pk_produto
primary key (id_produto)
);

create table itens (
id_itens int not null,
nf int not null,
id_produto int not null,
qtde_vendida int not null,
valor_vendido float,
constraint pk_itens
primary key (id_itens),
constraint fk_compra
foreign key (nf)
references compra,
constraint fk_produto
foreign key (id_produto)
references produto
);

create trigger vendaIten after insert on itens for each row execute procedure atualizaValores()


create or replace function atualizaValores() returns trigger as
$$
begin
	update produto set qtde = produto.qtde - new.qtde_vendida 
	where 
	produto.id_produto = (select itens.id_produto 
	from 
	itens, produto
	where
	produto.id_produto = itens.id_produto and
	itens.id_itens = new.id_itens);

	update cliente set debito = debito + (new.qtde_vendida * new.valor_vendido)
	where
	cliente.cpf = (select cliente.cpf
	from
	cliente, compra, itens
	where
	cliente.cpf = compra.cpf and
	compra.nf = itens.nf and
	itens.nf = new.nf);
	return new;
end;
$$
language 'plpgsql';

insert into cliente
(cpf, nome, debito)
values
(111, 'Rubem', 0),
(222, 'Duda', 0),
(333, 'Jao', 0);

insert into produto
(id_produto, nome, qtde, preço)
values
(1, 'arroz', 100, 5.00),
(2, 'feijao', 80, 4.00),
(3, 'macarrão', 70, 3.00);

insert into compra
(nf, cpf)
values
(1, 111),
(2, 222);

insert into itens
(id_itens, nf, id_produto, qtde_vendida, valor_vendido)
values
(1, 1, 3, 2, 6.00);


select * from produto
select * from itens
select * from cliente