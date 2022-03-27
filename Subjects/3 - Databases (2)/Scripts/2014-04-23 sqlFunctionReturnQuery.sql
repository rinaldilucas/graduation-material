create or replace function selVendas() returns table(campos) as
$$
begin
	return query ...

end;
$$
language 'plpgsql';


select * from selVendas() as ();


















