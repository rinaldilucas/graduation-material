create table tb_lock (
	cod int primary key,
	nome varchar (30)
);

insert into tb_lock values (1, 'Lucas');
insert into tb_lock values (2, 'Joao');
insert into tb_lock values (3, 'Rubem');
insert into tb_lock values (4, 'Jorge');

select * from tb_lock;

sp_lock 53;

select @@TRANCOUNT
commit
rollback
begin transaction
update tb_lock set nome = 'qqqqqqq2qqq' where cod = 1;
commit