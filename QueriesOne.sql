--Query: 1
--This query will give you all table spaces name, there full capacit and free space left in MBs.
SELECT b.tablespace_name, tbs_size Size_Mb, a.free_space Free_Mb
FROM
  (SELECT tablespace_name, ROUND(SUM(bytes)/1024/1024 ,2) AS free_space
  FROM dba_free_space GROUP BY tablespace_name ) a,
  
  (SELECT tablespace_name, SUM(bytes)/1024/1024 AS tbs_size
  FROM dba_data_files GROUP BY tablespace_name ) b
WHERE a.tablespace_name(+)=b.tablespace_name;
