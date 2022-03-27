begin transaction
select * from tb_lock
select @@TRANCOUNT
rollback