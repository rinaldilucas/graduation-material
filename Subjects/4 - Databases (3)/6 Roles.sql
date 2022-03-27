--1
create role usuario1 login password 'senhaUsuario1';

--2
create role usuario2 login password 'senhaUsuario2';

--3
create role supervisor;

--4
create role expedicao;

--5
create role admin createdb CREATEROLE;

--6
create role vendedor;

--7
create role user2 LOGIN IN GROUP admin;

--8
grant admin to vendedor;

--9
grant vendedor, expedicao to usuario1;