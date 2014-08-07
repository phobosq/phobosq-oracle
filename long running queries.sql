select ss.SQL_ID, ss.SQL_FULLTEXT, ss.ELAPSED_TIME / 1000000, sbc.NAME, sbc.VALUE_STRING -- , ss.*, s.*
from sys.V_$SQLSTATS ss
inner join SYS.V_$SQL s on ss.SQL_ID = s.SQL_ID and ss.LAST_ACTIVE_CHILD_ADDRESS = s.CHILD_ADDRESS
inner join SYS.V_$SQL_BIND_CAPTURE sbc on ss.SQL_ID = sbc.SQL_ID
where s.PARSING_SCHEMA_NAME = 'PMI_DEV' and ss.ELAPSED_TIME between 1000000 and 2000000
order by ss.ELAPSED_TIME desc;