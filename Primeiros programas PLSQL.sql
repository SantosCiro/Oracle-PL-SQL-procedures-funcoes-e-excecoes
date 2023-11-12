/*
Abra uma nova janela de script vazio no Oracle SQL Developer.
Crie o primeiro programa em PL/SQL:
*/

SET SERVEROUTPUT ON;

DECLARE
    v_id NUMBER(5) := 1;
BEGIN
    dbms_output.put_line(v_id);
    v_id := 2;
    dbms_output.put_line(v_id);
END;