create role usuario login password '123*&';

create role superusuario superuser login password '345%#';

create role financeiro;

create role maria password 'M123' in role financeiro;

create role jose password '123J' in role financeiro;

create role vendas;

grant vendas to maria, jose;

revoke vendas from jose;