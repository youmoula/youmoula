EXECUTE sp_addextendedproperty 
	@NAME = N'MS_Description',@VALUE=N'MY DESCRIPTION',
	@LEVEL0TYPE = N'SCHEMA',@LEVEL0NAME = N'dbo',
	@LEVEL1TYPE = N'TABLE',@LEVEL1NAME = N'MYTABLE',
	@LEVEL2TYPE = N'COLUMN',@LEVEL2NAME= N'MYCOLUMN';


--ADD DESCRIPTION ON 'MYCOLUMN'
EXECUTE sp_addextendedproperty N'MS_Description', 'My Column Comment', N'user', N'dbo', N'table', N'MYTABLE', N'column', N'MYCOLUMN'

-- ADD DESCRIPTION ON 'MYTABLE'
EXECUTE sp_updateextendedproperty N'MS_Description', 'My Table Comment', N'user', N'dbo', N'table', N'MYTABLE', NULL, NULL

--SELECT DESCRIPTION ON 'MYCOLUMN'
SELECT * FROM ::fn_listextendedproperty (NULL, 'user', 'dbo', 'table', 'SNM_STUDENTSUBMARK', 'column','MYCOLUMN')

--SELECT ALL DESCRIPTION
SELECT * FROM ::fn_listextendedproperty (NULL, 'user', 'dbo', 'table', 'SNM_STUDENTSUBMARK', 'column',NULL)
