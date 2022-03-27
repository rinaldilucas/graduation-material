CREATE OR REPLACE FUNCTION repet(INT, INT) RETURNS INT AS
$$
	declare	
		inic alias for $1;
		fim alias for $2;
BEGIN
	WHILE (inic <= fim) LOOP
		inic := inic+1;
	END LOOP;
	RETURN inic;	
END;
$$
LANGUAGE 'plpgsql';

select repet(0, 5);