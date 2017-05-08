begin tran
declare @dt table(ID int,BID int,OID int,CNo varchar(20))
	update top(30) tb_demo
	set BID=10000
	OUTPUT inserted.ID,
	   inserted.BID,
     deleted.BID,
	   inserted.CNo
	INTO @dt;
	
	select * from @dt;
	
	select * from sys.dm_tran_locks where request_session_id=@@spid
  commit tran
