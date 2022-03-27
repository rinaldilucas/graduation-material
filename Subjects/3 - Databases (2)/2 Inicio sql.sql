CREATE TABLE pai (cpfp int not null, nomep varchar(20),
constraint pk_pai primary key(cpfp), check (cpfp>0));

insert into pai (cpfp, nomep) values (2, 'L');
select * from pai;

create table filho (
	cpff int, nomef varchar(20), FKcpfp int,
	constraint pk_filho primary key(cpff),
	constraint fk_pai foreign key (FKcpfp) references pai, check (cpff>0)
);

update pai set nomep = 'Jose' where nomep = 'L';

insert into filho (cpff, nomef, FKcpfp) values (1, 'Pedro', 3);

select * from filho;