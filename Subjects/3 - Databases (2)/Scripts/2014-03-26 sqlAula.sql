create or replace function repete(int, int) returns int as
$$
	declare
		inicio alias for $1;
		final alias for $2;
begin
	while(inicio <= final) loop
		inicio := inicio + 1;
	end loop;
	return inicio;
end;
$$
language 'plpgsql';

create or replace function 

select repete(0, 3);