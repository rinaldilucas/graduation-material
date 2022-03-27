create or replace function selVendas () returns table (campos) as
$$
begin
	return query select v.nfcod, c.clinome, p.prodnome, v.
	from vendas as v, cliente as c, produto as p, itens as i
	where c.clicpf = v.clicpf and v.nfcod = i.nfcod and i.prod
	group by p.prodnome, v.nfcod, v.dtacomp, c.clinome
	order by p.prodnome;
end;
$$
language 'plpgsql';

select * from selVendas() as ();
