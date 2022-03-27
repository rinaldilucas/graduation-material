create or replace function criaTab() returns void as
$$
begin
	create table cliente (cpfCliente int not null primary key, nome varchar(40), endereco varchar(50), telefone varchar(20), 
	check (cpfCliente > 0));
	
	create table vendedor (codigoVendedor int not null primary key, cpf int not null, nome varchar(40), 
	check (codigoVendedor > 0));
	
	create table produto (codigoProduto int not null primary key, nome varchar(40), quantidade int, preco float,
	check (codigoProduto > 0));

	create table fornecedor (cnpjFornecedor int not null primary key, razaoSocial varchar(50), endereco varchar(50), telefone varchar(20),
	check (cnpjFornecedor > 0));
	
	create table clienteProduto (cpfCliente int not null, codigoVendedor int not null, codigoProduto int not null, data date,
	constraint PK_clienteProduto primary key (cpfCliente, codigoVendedor, codigoProduto),
	constraint FK_cliente foreign key (cpfCliente) references cliente,
	constraint FK_vendedor foreign key (codigoVendedor) references vendedor,
	constraint FK_produto foreign key (codigoProduto) references produto,
	check (codigoProduto > 0), check (cpfCliente > 0), check (codigoVendedor > 0));

 	create table fornecedorProduto (cnpjFornecedor int not null, codigoProduto int not null, data date, quantidade int, precoUnidade int,
 	constraint PK_fornecedorProduto primary key (cnpjFornecedor, codigoProduto),
 	constraint FK_fornecedor foreign key (cnpjFornecedor) references fornecedor,
 	constraint FK_produto foreign key (codigoProduto) references produto,
 	check (cnpjFornecedor > 0), check (codigoProduto > 0));
end;
$$
language 'plpgsql';




create table cliente (cpfCliente int not null primary key, nome varchar(40), endereco varchar(50), telefone varchar(20), check (cpfCliente > 0));
	
create table vendedor (codigoVendedor int not null primary key, cpf int not null, nome varchar(40), check (codigoVendedor > 0))
	
create table produto (codigoProduto int not null primary key, nome varchar(40), quantidade int, preco float, check (codigoProduto > 0))

create table fornecedor (cnpjFornecedor int not null primary key, razaoSocial varchar(50), endereco varchar(50), telefone varchar(20), check (cnpjFornecedor > 0))

create table clienteProduto (cpfCliente int not null, codigoVendedor int not null, codigoProduto int not null, data date,
constraint PK_clienteProduto primary key (cpfCliente, codigoVendedor, codigoProduto),
constraint FK_cliente foreign key (cpfCliente) references cliente,
constraint FK_vendedor foreign key (codigoVendedor) references vendedor,
constraint FK_produto foreign key (codigoProduto) references produto,
check (codigoProduto > 0), check (cpfCliente > 0), check (codigoVendedor > 0));

create table fornecedorProduto (cnpjFornecedor int not null, codigoProduto int not null, data date, quantidade int, precoUnidade int,
constraint PK_fornecedorProduto primary key (cnpjFornecedor, codigoProduto),
constraint FK_fornecedor foreign key (cnpjFornecedor) references fornecedor,
constraint FK_produto foreign key (codigoProduto) references produto,
check (cnpjFornecedor > 0), check (codigoProduto > 0));


create or replace function insCliente(integer, varchar(40), varchar(50), varchar(20)) returns void as
$$
	declare
		cpf alias for $1;
		nome alias for $2;
		endereco alias for $3;
		telefone alias for $4;
begin
	insert into cliente (cpfCliente, nome, endereco, telefone) values (cpf, nome, endereco, telefone);
end;
$$
language 'plpgsql';

create or replace function insVendedor (integer, integer, varchar(40)) returns void as
$$
	declare
		codigo alias for $1;
		cpf alias for $2;
		nome alias for $3;
begin
	insert into vendedor (codigoVendedor, cpf, nome) values (codigo, cpf, nome);
end;
$$
language 'plpgsql';


create or replace function insProduto (integer, varchar(40), integer, float) returns void as
$$
	declare
		codigo alias for $1;
		nome alias for $2;
		qtde alias for $3;
		preco alias for $4;
begin
	insert into produto (codigoProduto, nome, quantidade, preco) values (codigo, nome, qtde, preco);
end;
$$
language 'plpgsql';


create or replace function insFornecedor (integer, varchar(50), varchar(50), varchar(20)) returns void as
$$
	declare
		cnpj alias for $1;
		rSocial alias for $2;
		endereco alias for $3;
		telefone alias for $4;
begin
	insert into fornecedor (cnpjFornecedor, razaoSocial, endereco, telefone) values (cnpj, rSocial, endereco, telefone);
end;
$$
language 'plpgsql';


create or replace function insClienteProduto(integer, integer, integer, date) returns void as
$$
	declare
		cpf alias for $1;
		codigoV alias for $2;
		codigoP alias for $3;
		data alias for $4;
begin
	insert into clienteProduto (cpfCliente, codigoVendedor, codigoProduto, data) values (cpf, codigoV, codigoP, data);
end;
$$
language 'plpgsql';


create or replace function insFornecedorProduto(integer, integer, date, integer, integer) returns void as
$$
	declare
		cnpj alias for $1;
		codigoP alias for $2;
		data alias for $3;
		qtde alias for $4;
		preco alias for $5;
begin
	insert into fornecedorProduto (cnpjFornecedor, codigoProduto, data, quantidade, precoUnidade) values (cnpj, codigoP, data, qtde, preco);
end;
$$
language 'plpgsql';

create or replace function geraCodigoV() returns integer as 
$$
	declare
		numReg integer := 0;
begin
	numreg := count(*) +1 from vendedor;
	return numReg;
end;
$$
language 'plpgsql';

create or replace function geraCodigoP() returns integer as 
$$
	declare
		numReg integer := 0;
begin
	numreg := count(*) +1 from produto;
	return numReg;
end;
$$
language 'plpgsql';

select criaTab()

CLIENTE

select insCliente(1001, 'Rubem', 'Rua Martinho Lutero', '3333-88888')
select insCliente(1002, 'Carlos', 'Estrada Iaraquã', '4444-88888')
select insCliente(1003, 'Marcos', 'Estrada do Mendanha', '5555-88888')
select insCliente(1004, 'Lucas', 'Estrada do Mato Alto', '6666-88888')
select insCliente(1005, 'Juliana', 'Estrada do Pré', '7777-88888')
select insCliente(1006, 'Thalita', 'Estrada dos Caboclos', '8888-88888')
select insCliente(1007, 'Hamilton', 'Rua Padre Belizario', '9999-88888')
select insCliente(1008, 'Bruno', 'Estrada do Monteiro', '1111-88888')
select insCliente(1009, 'Jaziel', 'Rua Florinda Vilela', '2222-88888')
select insCliente(1010, 'Priscila', 'Estrada da Posse', '8888-7777')

select * from cliente

VENDEDOR

select insVendedor(geraCodigoV(), 2001, 'Juca')
select insVendedor(geraCodigoV(), 2002, 'Bira')
select insVendedor(geraCodigoV(), 2003, 'Teco')
select insVendedor(geraCodigoV(), 2004, 'Buiu')
select insVendedor(geraCodigoV(), 2005, 'Braga')
select insVendedor(geraCodigoV(), 2006, 'Nelso')
select insVendedor(geraCodigoV(), 2007, 'Celso')
select insVendedor(geraCodigoV(), 2008, 'Pedro')
select insVendedor(geraCodigoV(), 2009, 'Cesar')
select insVendedor(geraCodigoV(), 2010, 'Luiz')

select * from vendedor

PRODUTO

select insProduto(geraCodigoP(), 'Molho', 200, 5.0)
select insProduto(geraCodigoP(), 'Pão', 500, 2.0)
select insProduto(geraCodigoP(), 'Azeite', 600, 10.0)
select insProduto(geraCodigoP(), 'Macarrão', 700, 1.5)
select insProduto(geraCodigoP(), 'Arroz', 500, 10.0)
select insProduto(geraCodigoP(), 'Feijão', 500, 5.0)
select insProduto(geraCodigoP(), 'Tomate', 400, 3.0)
select insProduto(geraCodigoP(), 'Queijo', 100, 7.0)
select insProduto(geraCodigoP(), 'Leite', 1000, 2.5)
select insProduto(geraCodigoP(), 'Presunto', 150, 6.0)

select * from produto

FORNECEDOR

select insFornecedor(3331, 'Sendas', 'Rua A', '1111-9999')
select insFornecedor(3332, 'Mufato', 'Rua B', '2222-8888')
select insFornecedor(3333, 'carefour', 'Rua C', '3333-7777')
select insFornecedor(3334, 'Guanabara', 'Rua D', '4444-6666')
select insFornecedor(3335, 'Intercontinental', 'Rua E', '5555-5555')
select insFornecedor(3336, 'Pão de Açucar', 'Rua F', '6666-4444')
select insFornecedor(3337, 'Viscardi', 'Rua G', '7777-3333')
select insFornecedor(3338, 'Tonhão', 'Rua H', '8888-2222')
select insFornecedor(3339, 'Rainha', 'Rua I', '9999-1111')
select insFornecedor(3330, 'Extra', 'Rua J', '9900-0099')

select * from fornecedor

CLIENTE_PRODUTO

-- prod 1
select insClienteProduto(1001, 5, 1, '2014-03-15')
select insClienteProduto(1002, 2, 1, '2014-03-15')
select insClienteProduto(1003, 4, 1, '2014-03-15')

-- prod 2

select insClienteProduto(1005, 3, 2, '2014-03-10')
select insClienteProduto(1006, 1, 2, '2014-03-10')
select insClienteProduto(1002, 6, 2, '2014-03-10')

-- prod 3

select insClienteProduto(1009, 3, 3, '2014-03-07')
select insClienteProduto(1008, 2, 3, '2014-03-07')
select insClienteProduto(1002, 4, 3, '2014-03-07')

-- prod 4

select insClienteProduto(1009, 2, 4, '2014-03-20')
select insClienteProduto(1004, 1, 4, '2014-03-07')
select insClienteProduto(1006, 3, 4, '2014-03-07')

-- prod 5

select insClienteProduto(1001, 5, 5, '2014-03-20')
select insClienteProduto(1001, 4, 5, '2014-03-21')
select insClienteProduto(1002, 3, 5, '2014-03-17')

-- prod 6

select insClienteProduto(1003, 5, 6, '2014-03-01')
select insClienteProduto(1003, 4, 6, '2014-03-02')
select insClienteProduto(1008, 2, 6, '2014-03-03')

-- prod 7

select insClienteProduto(1009, 2, 7, '2014-03-02')
select insClienteProduto(1004, 5, 7, '2014-03-02')
select insClienteProduto(1001, 8, 7, '2014-03-06')

-- prod 8

select insClienteProduto(1008, 2, 8, '2014-03-03')
select insClienteProduto(1001, 1, 8, '2014-03-04')
select insClienteProduto(1001, 9, 8, '2014-03-05')

-- prod 9

select insClienteProduto(1001, 4, 9, '2014-03-13')
select insClienteProduto(1001, 8, 9, '2014-03-14')
select insClienteProduto(1007, 4, 9, '2014-03-14')

-- prod 10

select insClienteProduto(1007, 4, 10, '2014-03-13')
select insClienteProduto(1006, 4, 10, '2014-03-12')
select insClienteProduto(1005, 4, 10, '2014-03-11')

select * from clienteProduto

select insFornecedorProduto(3331, 2, '2014-03-10', 10000, 2)
select insFornecedorProduto(3333, 7, '2014-03-15', 1000, 5)
select insFornecedorProduto(3336, 1, '2014-03-13', 20000, 5)
select insFornecedorProduto(3338, 1, '2014-03-18', 15000, 6)
select insFornecedorProduto(3331, 3, '2014-03-11', 8000, 10)
select insFornecedorProduto(3332, 8, '2014-03-19', 9500, 6)
select insFornecedorProduto(3339, 6, '2014-03-20', 7000, 2)
select insFornecedorProduto(3334, 9, '2014-03-01', 3000, 1)
select insFornecedorProduto(3330, 4, '2014-03-04', 5000, 3)
select insFornecedorProduto(3333, 5, '2014-03-05', 1000, 2)

select * from fornecedorProduto


create or replace function buscaProduto(prod integer) returns void as
$$
begin
	select cliente.nome from cliente, produto, clienteProduto, vendedor
	where
	cliente.cpfCliente = clienteProduto.cpfCliente and
	produto.codigoProduto = clienteProduto.codigoProduto and
	vendedor.codigoVendedor = clienteProduto.codigoVendedor and
	produto.codigoProduto = prod;

end;
$$
language 'plpgsql';

select buscaProduto(10)