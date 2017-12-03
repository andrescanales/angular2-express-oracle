SELECT username FROM dba_users;

SELECT tablespace_name FROM dba_tablespaces;

CREATE tablespace andres_tablespace
datafile 'andres_tablespace.dat'
SIZE 20M autoextend ON;

CREATE TEMPORARY tablespace andres_temp
tempfile 'andres_temp.dat'
SIZE 5M autoextend ON;

--DROP USER andres;
ALTER USER andres
DEFAULT tablespace andres_tablespace
TEMPORARY tablespace andres_temp;

--GRANT CREATE SESSION TO andres;
--GRANT CREATE TABLE TO andres;
GRANT dba TO andres WITH ADMIN OPTION;