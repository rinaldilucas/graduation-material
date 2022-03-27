CREATE OR REPLACE FUNCTION apagaTabs() returns void as
$$
BEGIN
	drop table clientes cascade;
	drop table produtos cascade;
	drop table compras cascade;
	drop table itens cascade;
END;
$$
LANGUAGE 'plpgsql';

select apagaTabs()


create or replace function criatabs() returns void as
$$
begin
	create table clientes (pk_cli int not null primary key, nome varchar(20), debito int);
	create table produtos (pk_prod int not null primary key, descr varchar(20), valor int, qtde_est int);
	create table compras (pk_comp int not null primary key, fk_cli int, foreign key (fk_cli) references clientes (pk_cli) on delete cascade on update cascade);
	create table itens (pk_item int not null primary key, fk_comp int, foreign key (fk_comp) references compras (pk_comp) on delete cascade on update cascade,
	fk_prod int, foreign key  (fk_prod) references produtos on delete cascade on update cascade, qtde_item int, valor_item int);
end;
$$
language 'plpgsql';

select criatabs()

create or replace function populaTabs() returns void as
$$
begin
	insert into clientes (pk_cli, nome, debito) values (1,'Jose', 0);
	insert into clientes (pk_cli, nome, debito) values (2,'Carlos', 0);
	insert into clientes (pk_cli, nome, debito) values (3,'Silvio', 0);

	insert into produtos (pk_prod, descr, valor, qtde_est) values (1,'Arroz', 1, 10);
	insert into produtos (pk_prod, descr, valor, qtde_est) values (2, 'Feijão', 2, 20);
	insert into produtos (pk_prod, descr, valor, qtde_est) values (3, 'Batata', 3, 30);

	insert into compras (pk_comp, fk_cli) values (1, 1);
	insert into compras (pk_comp, fk_cli) values (2, 2);
	insert into compras (pk_comp, fk_cli) values (3, 3);
	insert into compras (pk_comp, fk_cli) values (4, 1);
end;
$$
language 'plpgsql';

select populaTabs()

create or replace function atualizacli_prod() returns trigger as
$$
begin
	update clientes set debito = clientes.debito + (new.valor_item * new.qtde_item) where clientes.pk_cli = (select compras.fk_cli from compras where compras.pk_comp = new.fk_comp);

	update produtos set qtde_est = produtos.qtde_est - new.qtde_item where produtos.pk_prod = new.fk_prod;

	return new;
end;
$$
language 'plpgsql';

create trigger gatAtualiza after insert on itens for each row execute procedure atualizacli_prod();

insert into itens (pk_item, fk_comp, fk_prod, qtde_item, valor_item) values (1, 1, 1, 1, 1);

insert into itens (pk_item, fk_comp, fk_prod, qtde_item, valor_item) values (2, 1, 2, 2, 2);

insert into itens (pk_item, fk_comp, fk_prod, qtde_item, valor_item) values (3, 1, 3, 3, 3);

insert into itens (pk_item, fk_comp, fk_prod, qtde_item, valor_item) values (4, 2, 2, 2, 2);

insert into itens (pk_item, fk_comp, fk_prod, qtde_item, valor_item) values (5, 2, 2, 2, 2);

insert into itens (pk_item, fk_comp, fk_prod, qtde_item, valor_item) values (6, 2, 2, 2, 2);

insert into itens (pk_item, fk_comp, fk_prod, qtde_item, valor_item) values (7, 2, 2, 2, 2);

insert into itens (pk_item, fk_comp, fk_prod, qtde_item, valor_item) values (8, 3, 1, 1, 1);

create table historico(
pk_hist int not null primary key,
fk_cli int, foreign key (fk_cli) references clientes(pk_cli),
fk_comp int, foreign key (fk_comp) references compras(pk_comp),
fk_item int, foreign key (fk_item) references itens(pk_item)
);

create or replace keepCompras() returns trigger as
$$
begin
	insert into relatorio values (default, old)
end;
$$
language 'plpgsql';

create trigger relatorioItens after delete on compras for each row execute procedure keepCompras();