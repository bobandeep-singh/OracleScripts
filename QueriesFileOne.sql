--Query: 1
--This query will give you all table spaces name, there full capacit and free space left in MBs.
SELECT b.tablespace_name, tbs_size Size_Mb, a.free_space Free_Mb
FROM
  (SELECT tablespace_name, ROUND(SUM(bytes)/1024/1024 ,2) AS free_space
  FROM dba_free_space GROUP BY tablespace_name ) a,
  
  (SELECT tablespace_name, SUM(bytes)/1024/1024 AS tbs_size
  FROM dba_data_files GROUP BY tablespace_name ) b
WHERE a.tablespace_name(+)=b.tablespace_name;

---Fun with dates
SELECT trunc(sysdate) - (to_number(to_char(sysdate,'DD')) - 1) FROM dual; ---first day 0f current month
Select trunc((sysdate),'mm') from dual; ---first day 0f current month
select last_day(sysdate) from dual;   ---last day of current month
select trunc(last_day(add_months(sysdate,-1))+1) from dual;   ---first day 0f last month
Select trunc(trunc(sysdate,'MM')-1,'MM')  from dual;          ---first day 0f last month
select last_day(sysdate)+1 from dual;   ---first day of next month
Select sysdate from dual;
SELECT TO_CHAR(SYSDATE, 'MM-DD-YYYY HH24:MI:SS') "Current_Time" FROM DUAL;
select to_char(sysdate-(4/24), 'DD/Mon/YYYY HH24:MI:SS') from dual;

SELECT TO_CHAR(SYSDATE, 'MMDDYYYY_HH24:MI:SS') "Current_Time" FROM DUAL;

SELECT EXTRACT(MONTH FROM sysdate) from dual;

Select SYSTIMESTAMP from dual;

--Examples of the to_date function might include:
/*
to_date('10-12-06','MM-DD-YY');
to_date('jan 2007','MON YYYY');
to_date('2007/05/31','YYYY/MM/DD');
to_date('12-31-2007 12:15','MM-DD-YYYY HH:MI');
to_date('2006,091,00:00:00' , 'YYYY,DDD,HH24:MI:SS');
to_date('15-may-2006 06:00:01','dd-mon-yyyy hh24:mi:ss');
to_date('022002','mmyyyy');
to_date('12319999','MMDDYYYY');
to_date(substr( collection_started,1,12),'DD-MON-YY HH24');
to_date('2004/10/14 21', 'yyyy/mm/dd hh24');
TO_DATE(First_Load_Time, 'yyyy-mm-dd/hh24:mi:ss')*24*60);
*/
alter SESSION set NLS_DATE_FORMAT = 'DD-MM-YYYY HH24:MI:SS';

