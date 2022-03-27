--1
create role admin1 createdb createrole;

--2
create role departamento1;

--3
create role departamento2;

--4
create role departamento3;

--5
create role departamento4;

--6
create role departamento5 NOINHERIT;

--7
grant departamento1 to departamento5;

--8
create role postgres1 superuser createdb createrole replication;

--9
create role user1 login;

--10
create role user2 login;

--11
create role user3 login;

--12
create role user4 login superuser;

--13
create role user5 login createdb VALID UNTIL '2014-12-15 00:00:00';

--14
create role user6 login createrole valid until 'infinity';

--15
grant user1 to user3, departamento1, admin1, departamento5;

--16
grant user2 to admin1, departamento4, departamento5;

--17
grant user3 to admin1, departamento4, departamento5;

--18
grant user4 to admin1, departamento5;

--19
grant user5 to departamento5;

--20
grant user6 to admin1, departamento5;

