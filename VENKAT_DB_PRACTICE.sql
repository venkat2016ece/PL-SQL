select * from employess;


set SERVEROUT on;
declare
v_name varchar2(15);
begin
v_name := 'venkat';
DBMS_OUTPUT.PUT_LINE(v_name);
end;

SELECT * from test;


set serveroutput on;
declare
v_name varchar2(255);
begin
select name into v_name from test where email ='Narayana@gmail.com';
dbms_output.put_line(v_name);
end;
/

-- pl/sql constants declaration
    set serveroutput on;
    DECLARE 
    v_constant CONSTANT NUMBER(7):=101;
    BEGIN
   -- this type of assignment is not allowed in plsql
    --v_constant:=101;
    DBMS_OUTPUT.PUT_LINE(v_constant);
    END;
    /

-- DEFALT AND NOT NULL keywords
 set serveroutput on;
    DECLARE 
    --FIRST WAY
   -- v_constant CONSTANT NUMBER(7,6) DEFAULT 3.141592; 
    -- SECOND WAY
    v_constant CONSTANT NUMBER(7,6) NOT NULL DEFAULT  3.141592; 
    BEGIN
   
    DBMS_OUTPUT.PUT_LINE(v_constant);
    END;
    /
    
    -- Bind variable
    --1 .user varaible 
    --2. bind variable
    
    --decalre variable
VARIABLE v_bind1 VARCHAR2(20); 
--next intialize variable
    EXEC :v_bind1 := '1st way if intia';

-- second way of intializing bind variable
BEGIN
:v_bind1:= '2d intialization';

END;
/
PRINT :v_bind1;


SET AUTOPRINT ON;
VARIABLE v_bind2 VARCHAR2(30); 
EXEC :v_bind1 := '1st way if intia';



-- IF THEN condtional control statementset 

--example 1.
-- if condition is true both will be printed but
--if it false out side statement will be exicuted 
-- outside block always will be exicute.

SET SERVEROUTPUT ON;
DECLARE 
v_num number := 10;
BEGIN
IF v_num <10 THEN 
DBMS_OUTPUT.PUT_LINE('inside if ');
END IF;
DBMS_OUTPUT.PUT_LINE('outside if ');
END;
/
--2nd example
DECLARE 
v_website varchar2(30):= 'website name';
v_author varchar2(30):= 'author name';
BEGIN
IF v_website = 'website name' AND v_author = 'author name' THEN
DBMS_OUTPUT.PUT_LINE('both are true');
END IF;
DBMS_OUTPUT.PUT_LINE('both are not true');
END;
/

-- IF ELSE
SET SERVEROUTPUT ON;
DECLARE 
v_num number := &enter_a_number;
BEGIN
IF MOD(v_num,2) = 0 THEN 
DBMS_OUTPUT.PUT_LINE(v_num||' EVEN');
ELSE
DBMS_OUTPUT.PUT_LINE(v_num||' ODD');
END IF;
DBMS_OUTPUT.PUT_LINE('IF ELSE CONSTRUCTION COMPLETED');
END;
/

--IF THEN ELSIF
SET SERVEROUTPUT ON;
DECLARE
v_city varchar2(30) := '&enter_city_name';
BEGIN
IF v_city = 'HYDERABAD' THEN
DBMS_OUTPUT.PUT_LINE('ENTERED CITY IS '|| v_city);
ELSIF v_city = 'BANGALORE' THEN
DBMS_OUTPUT.PUT_LINE('ENTERED CITY IS '|| v_city);
ELSIF v_city = 'CHENNAI' THEN
DBMS_OUTPUT.PUT_LINE('ENTERED CITY IS '|| v_city);
ELSE
DBMS_OUTPUT.PUT_LINE('CITY NOT MATCHED');
END IF;
DBMS_OUTPUT.PUT_LINE('THANKS FOR CONTACTING US');
END;
/

-- SIMPLE LOOP
SET SERVEROUTPUT ON; 
DECLARE
    v_counter   NUMBER := 0;
    v_result    NUMBER;
BEGIN
    LOOP
        v_counter := v_counter + 1;
        v_result := 19 * v_counter;
        dbms_output.put_line('19' || 'x' || v_counter || '=' || v_result);
        -- EXIT CONDITION
        IF v_counter >= 10 THEN
         EXIT;
        END IF;
    END LOOP;
END;
/

-- 2nd way
SET SERVEROUTPUT ON; 
DECLARE
    v_counter   NUMBER := 0;
    v_result    NUMBER;
BEGIN
    LOOP
        v_counter := v_counter + 1;
        v_result := 19 * v_counter;
        dbms_output.put_line('19' || 'x' || v_counter || '=' || v_result);
        -- EXIT WHEN CONDITION
        EXIT WHEN v_counter >= 10;
    END LOOP;
END;
/

-- WHILE LOOP
SET SERVEROUTPUT ON;
DECLARE
    v_counter   NUMBER := 1;
    v_result    NUMBER;
BEGIN
    WHILE v_counter <= 10 LOOP
        v_result := 19 * v_counter;
        DBMS_OUTPUT.PUT_LINE('19' || 'x' || v_counter || '=' || v_result );
        v_counter := v_counter + 1;
    END LOOP;

    DBMS_OUTPUT.PUT_LINE('Out side loop');
END;
/

-- WHILE LOOP
SET SERVEROUTPUT ON;

DECLARE
    v_test      BOOLEAN := TRUE;
    v_counter   NUMBER := 1;
BEGIN
    WHILE v_test LOOP
        v_counter := v_counter + 1;
        dbms_output.put_line(v_counter);
        IF v_counter = 10 THEN
            v_test := FALSE;
        END IF;
    END LOOP;

    dbms_output.put_line('Out side loop');
END;
/
-- FOR LOOP
SET SERVEROUTPUT ON;

BEGIN
FOR v_counter IN 1..10 LOOP
    dbms_output.put_line(v_counter);
END LOOP;
END;
/
-- FOR LOOP IN REVERSE
SET SERVEROUTPUT ON;

BEGIN
FOR v_counter IN REVERSE 1..10 LOOP
    dbms_output.put_line(v_counter);
END LOOP;
END;
/

DECLARE
    v_result   NUMBER;
    BEGIN
    FOR v_counter IN 1..10 LOOP
    v_result := 19 * v_counter;
    dbms_output.put_line('19 ' || 'x ' || v_counter || ' =' || v_result);
END LOOP;
end;
/

-- TRIGGERS

create table superheroes(
sh_name varchar2(20)
);

--EXAMPLE 1
CREATE OR REPLACE TRIGGER bi_superheroes
BEFORE INSERT ON superheroes
FOR EACH ROW ENABLE
DECLARE
v_user varchar2(20);
BEGIN
select user into v_user from dual;
DBMS_OUTPUT.PUT_LINE('You just inserted a Line mr.'||v_user);
END;
/

insert into superheroes values ('venkat');

--EXAMPLE 2
CREATE OR REPLACE TRIGGER bu_superheroes
BEFORE UPDATE ON superheroes
FOR EACH ROW ENABLE
DECLARE
v_user varchar2(20);
BEGIN
select user into v_user from dual;
DBMS_OUTPUT.PUT_LINE('You just update a Line mr.'||v_user);
END;
/
update superheroes set sh_name = 'Update operation' where sh_name ='venkat';
select * from superheroes;


-- write one triger for all dml operation
CREATE OR REPLACE TRIGGER tr_superheros
BEFORE INSERT OR UPDATE OR DELETE ON superheroes
FOR EACH ROW ENABLE
DECLARE
v_user varchar2(20);
BEGIN
select user into v_user from dual;
IF INSERTING THEN
DBMS_OUTPUT.PUT_LINE('one row inserted by'||v_user);
ELSIF UPDATING THEN
DBMS_OUTPUT.PUT_LINE('one row updated by'||v_user);
ELSIF DELETING THEN
DBMS_OUTPUT.PUT_LINE('one row deleted by'||v_user);
END IF;
END;
/

insert into superheroes values ('XXXXX');
update superheroes set sh_name = 'YYYYY' where sh_name ='XXXXX';
DELETE FROM superheroes WHERE sh_name = 'YYYYY';

-- TABLE AUDITING USING DML TRIGGERS
create table sh_audit(
new_name varchar2(30),
old_name varchar2(30),
user_name varchar2(30),
entry_date varchar2(30),
operation varchar2(30)
);

CREATE OR REPLACE TRIGGER superheroes_adit
BEFORE INSERT OR UPDATE OR DELETE ON superheroes
FOR EACH ROW
ENABLE
DECLARE 
v_user varchar2(30);
v_date varchar2(30);

BEGIN
select user,TO_CHAR(sysdate,'DD/MM/YYYY HH24:MM:SS') into v_user,v_date from dual;
IF INSERTING THEN
INSERT INTO sh_audit(new_name,old_name,user_name,entry_date,operation) values 
                    (:NEW.sh_name,null,v_user,v_date,'insert');
ELSIF DELETING THEN
INSERT INTO sh_audit(new_name,old_name,user_name,entry_date,operation) values 
                    (null,:OLD.sh_name,v_user,v_date,'delete');
ELSIF UPDATING THEN
INSERT INTO sh_audit(new_name,old_name,user_name,entry_date,operation) values 
                    (:NEW.sh_name,:OLD.sh_name,v_user,v_date,'update');
END IF;

END;
/

select * from sh_audit;
desc sh_audit;

insert into superheroes values('superman');
update superheroes set sh_name = 'Ironman' where sh_name = 'superman';
delete from superheroes where sh_name = 'Ironman';


desc superheroes
create table superheroes_backup AS  SELECT * FROM superheroes where 1=2;
desc superheroes_backup

CREATE OR REPLACE TRIGGER sh_backup BEFORE
    INSERT OR UPDATE OR DELETE ON superheroes
    FOR EACH ROW
ENABLE BEGIN
    IF inserting THEN
        INSERT INTO superheroes_backup ( sh_name ) VALUES (:new.sh_name );

    ELSIF deleting THEN
        DELETE FROM superheroes_backup
        WHERE
            sh_name =:old.sh_name;

    ELSIF updating THEN
        UPDATE superheroes_backup
        SET
            sh_name =:new.sh_name
        WHERE
            sh_name =:old.sh_name;

    END IF;
END;
/

select * from superheroes;
select * from superheroes_backup;

insert into superheroes values('superman');
insert into superheroes values('batman');

update superheroes set sh_name = 'Ironman' where sh_name = 'superman';
delete from superheroes where sh_name = 'Ironman';

-- DDL Trigger with Schema Auditing Example
create table schema_audit(
ddl_date DATE,
ddl_user varchar2(15),
object_created varchar2(15),
object_name varchar2(15),
ddl_operation varchar2(15)
);

CREATE OR REPLACE TRIGGER hr_audit_tr
AFTER DDL ON SCHEMA
BEGIN
    INSERT INTO schema_audit VALUES(
    sysdate,
    sys_context('USERENV','CURRENT_USER'),
    ora_dict_obj_type,
    ora_dict_obj_name,
    ora_sysevent
    );
    END;
    /

select * from schema_audit;
create table rebelian_rider(r_num number);
insert into rebelian_rider values(9);
select * from rebelian_rider;
truncate table rebelian_rider;
drop table rebelian_rider;


-- How To Create Database Event 'LogOn' Trigger In Oracle
-- use hr user

CREATE TABLE hr_event_audit (
    event_type    VARCHAR2(20),
    logon_date    DATE,
    logon_time    VARCHAR2(20),
    logoff_date   DATE,
    logoff_time   VARCHAR2(20)
);

CREATE OR REPLACE TRIGGER hr_logon_audit 
    AFTER LOGON ON SCHEMA BEGIN
    INSERT INTO hr_event_audit VALUES (
        ora_sysevent,
        SYSDATE,
        TO_CHAR(SYSDATE,'hh24:mi:ss'),
        NULL,
        NULL
    );

    COMMIT;
END;
/


select * from hr_event_audit;
disc;
connect HR/hr;
connect HR/hr;
truncate table hr_event_audit;

CREATE OR REPLACE TRIGGER log_off_audit 
BEFORE LOGOFF ON SCHEMA
BEGIN
insert into hr_event_audit values (
ora_sysevent,
null,
null,
sysdate,
TO_CHAR(sysdate,'hh24:mi:ss')
);
COMMIT;
END;
/

CONNECT sys/orcle;

-- logoff trigger use sys user

CREATE TABLE db_event_audit (
    user_name     VARCHAR2(20),
    event_type    VARCHAR2(20),
    logon_date    DATE,
    logon_time    VARCHAR2(20),
    logoff_date   DATE,
    logoff_time   VARCHAR2(20)
);

select * from db_event_audit;

CREATE OR REPLACE TRIGGER db_logoff_audit BEFORE LOGOFF ON DATABASE BEGIN
    INSERT INTO db_event_audit VALUES (
        user,
        ora_sysevent,
        NULL,
        NULL,
        SYSDATE,
        TO_CHAR(SYSDATE,'hh24:mi:ss')
    );
    COMMIT;
END;
/

show user;
disc;


--How To Create Startup Trigger In Oracle Database

CREATE TABLE startup_audit (
    event_type   VARCHAR2(30),
    event_date   DATE,
    event_time   VARCHAR2(15)
);


CREATE OR REPLACE TRIGGER tr_startup_audit AFTER STARTUP ON DATABASE BEGIN
    INSERT INTO startup_audit VALUES (
        ora_sysevent,
        SYSDATE,
        TO_CHAR(SYSDATE,'hh24:mi:ss')
    );
END;
/

-- instead of insert trigger in oracle data base 
-- instead of trigger we use on views not not direct tables
show user;
-- TABEL
CREATE TABLE trainer(
full_name varchar2(17)
);
CREATE TABLE subject(
subject_name varchar2(17)
);
INSERT INTO trainer VALUES ('Manish sharma');
INSERT INTO subject VALUES ('Oracle');


select * from trainer;
select * from subject;
drop table subject;
drop table trainer;

CREATE VIEW vw_rebr AS
SELECT full_name, subject_name FROM trainer, subject;

select * from vw_rebr;
-- instead of trigger
CREATE OR REPLACE TRIGGER tr_io_insert
INSTEAD OF INSERT ON vw_rebr
FOR EACH ROW
BEGIN
INSERT INTO trainer(full_name) values (:new.full_name);
INSERT INTO subject(subject_name) values (:new.subject_name);
END;
/
INSERT INTO vw_rebr values ('venkat','java');

-- Instead-of Update Trigger

CREATE OR REPLACE TRIGGER io_update INSTEAD OF
    UPDATE ON vw_rebr
    FOR EACH ROW
BEGIN
    UPDATE trainer
    SET
        full_name =:new.full_name
    WHERE
        full_name =:old.full_name;

    UPDATE subject
    SET
        subject_name =:new.subject_name
    WHERE
        subject_name =:old.subject_name;

END;
/

UPDATE vw_rebr set FULL_NAME = 'y' where subject_name = 'kafka';
select *  from vw_rebr;


-- instead of delete trigger
CREATE OR REPLACE TRIGGER io_delete
INSTEAD OF DELETE ON vw_rebr
FOR EACH ROW 
BEGIN
DELETE FROM TRAINER WHERE FULL_NAME =:OLD.FULL_NAME;
DELETE FROM SUBJECT WHERE SUBJECT_NAME =:OLD.SUBJECT_NAME;
END;
/

DELETE FROM vw_rebr WHERE FULL_NAME ='y';



-- Cursors 


select * from employess;
truncate table employess;

insert into employess(eid,salary) values(101,1000);
insert into employess(eid,salary) values(102,10000);
insert into employess(eid,salary) values(103,9000);
insert into employess(eid,salary) values(104,50000);
insert into employess(eid,salary) values(105,44500);
insert into employess(eid,salary) values(106,27000);
insert into employess(eid,salary) values(107,18000);
insert into employess(eid,salary) values(108,28000);
insert into employess(eid,salary) values(109,35000);
insert into employess(eid,salary) values(110,33330);


-- cursors
SET SERVEROUTPUT ON;

DECLARE
v_sal NUMBER(20);
-- DECLARE CURSOR
CURSOR cur_rbrider IS
SELECT salary from employess
where eid<105; begin
    open cur_rbrider;

    LOOP
        FETCH cur_rbrider INTO v_sal;
        dbms_output.put_line(v_sal);
        EXIT WHEN cur_rbrider%notfound;
    END LOOP;

end;
/

-- Parametarized cursor
SET SERVEROUTPUT ON;

DECLARE
    v_sal   NUMBER(30);
    CURSOR p_cur_rbrider (
        var_eid VARCHAR2
    ) IS SELECT
             salary
         FROM
             employess
         WHERE
             eid < var_eid;

BEGIN
    OPEN p_cur_rbrider(105);
    LOOP
        FETCH p_cur_rbrider INTO v_sal;
        EXIT WHEN p_cur_rbrider%notfound;
        dbms_output.put_line(v_sal);
    END LOOP;

    CLOSE p_cur_rbrider;
END;
/


-- Parametarized cursor default value
-- default value works only when you dont pass parameter while opening cursor
SET SERVEROUTPUT ON;

DECLARE
    v_sal   NUMBER(30);
    CURSOR p_cur_rbrider (
        var_eid VARCHAR2 :=102
    ) IS SELECT
             salary
         FROM
             employess
         WHERE
             eid < var_eid;

BEGIN
    OPEN p_cur_rbrider;
    LOOP
        FETCH p_cur_rbrider INTO v_sal;
        EXIT WHEN p_cur_rbrider%notfound;
        dbms_output.put_line(v_sal);
    END LOOP;

    CLOSE p_cur_rbrider;
END;
/

-- Parametarized cursor default value
-- default value works only when you dont pass parameter while opening cursor
-- in below we declared both default and parameter also not paramter will work not default value.
SET SERVEROUTPUT ON;

DECLARE
    v_sal   NUMBER(30);
    CURSOR p_cur_rbrider (
        var_eid VARCHAR2 :=102
    ) IS SELECT
             salary
         FROM
             employess
         WHERE
             eid < var_eid;

BEGIN
    OPEN p_cur_rbrider(105);
    LOOP
        FETCH p_cur_rbrider INTO v_sal;
        EXIT WHEN p_cur_rbrider%notfound;
        dbms_output.put_line(v_sal);
    END LOOP;

    CLOSE p_cur_rbrider;
END;
/


-- Cursor FOR Loop In Oracle Database
SET SERVEROUTPUT ON;
DECLARE 
CURSOR cur_rbrider IS 
SELECT salary,eid FROM employess WHERE eid < 105;
BEGIN
FOR L_IDX IN cur_rbrider
LOOP
DBMS_OUTPUT.PUT_LINE(L_IDX.salary || ' AND '|| L_IDX.eid);
END LOOP;
END;
/


-- hai
















































