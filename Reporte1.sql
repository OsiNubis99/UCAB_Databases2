CREATE OR REPLACE FUNCTION list_of (required_type_in IN VARCHAR2)
    RETURN SYS_REFCURSOR
IS
    v_ SYS_REFCURSOR;
BEGIN

          OPEN v_ FOR
            SELECT * FROM Unidad  as u WHERE u.tipo=required_type_in;

-- Whit this use, you must not close the cursor.
    RETURN v_;
END list_of;




CREATE OR REPLACE PROCEDURE reporteuno (tipo VARCHAR2)
DECLARE
   v_names   SYS_REFCURSOR;
   v_        Unidad%rowtype;
BEGIN
   v_names := list_of(tipo);
   LOOP
      FETCH v_names INTO v_;
      EXIT WHEN v_names%NOTFOUND;
      DBMS_OUTPUT.put_line(v_);
    END LOOP;
   -- here you close it
    CLOSE v_names;
END;