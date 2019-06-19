--#1
-- Table space query
-- This query will give you all table spaces name, there full capacit and free space left in MBs.
SELECT b.tablespace_name, tbs_size Size_Mb, a.free_space Free_Mb
FROM
  (SELECT tablespace_name, ROUND(SUM(bytes)/1024/1024 ,2) AS free_space
  FROM dba_free_space GROUP BY tablespace_name ) a,
  
  (SELECT tablespace_name, SUM(bytes)/1024/1024 AS tbs_size
  FROM dba_data_files GROUP BY tablespace_name ) b
WHERE a.tablespace_name(+)=b.tablespace_name;

--#2
-- Like-Escape query
-- In this query I'm changing the BTN coulmn value and removing the BTN's trailing characters from underscore "_"
-- The problem I faced was that even I added a condition to just select the BTNs which have underscore in them.
-- But the query was also selecting the BTNs which does not have it. This was because underscore is a special character.
-- So, to inform Oracle about this special character and treat it as simple character by using ESCAPE.
Select BTN, substr(BTN,1, INSTR(BTN,'_')-1) Updated_BTN 
from PMT
Where BAC = 'KENAN' and BTN like '%\_%' escape '\' order by CREATE_TIME desc;

-- Any character can follow ESCAPE except percent (%) and underbar (_). 
-- A wildcard character is treated as a literal if preceded by the escape character.
-- This means we can use any character as escape character like here we took back slash \
