CREATE OR REPLACE PROCEDURE MCLIENTE(cliente_id OUT CLIENTE.ID%TYPE)
IS
DECLARE
  client CLIENTE%ROWTYPE;
  id CLIENTE.ID%TYPE;
  NOMBRE varchar2(50);
  Apellido varchar2(50);
  gen varchar2(50);
  ci INT;
  sex INT;
  x INT;
  num INT;
  module_name VARCHAR2(100);
BEGIN
  module_name := 'MCliente: ';
  id := NULL;
  FOR client IN (SELECT c.* FROM CLIENTE c)
  LOOP
    SELECT COUNT(id) INTO x FROM RESERVA WHERE cliente_id = client.id AND (estado = 'ESPERA' OR estado = 'PROCESO');
    IF x = 0 THEN
      id := client.id;
      EXIT;
    END IF;
  END LOOP;
  IF id IS NULL THEN
    DBMS_OUTPUT.PUT_LINE(module_name || 'Creando un nuevo Cliente');
    SELECT SEQ_CLIENTE_ID.NEXTVAL INTO id FROM dual;
    SELECT NOMBRE INTO NOMBRE FROM (
      SELECT NOMBRE FROM DATOS ORDER BY DBMS_RANDOM.VALUE
    )WHERE ROWNUM <= 1;
    SELECT APELLIDO INTO APELLIDO FROM (
      SELECT APELLIDO FROM DATOS ORDER BY DBMS_RANDOM.VALUE
    )WHERE ROWNUM <= 1;
    SELECT DBMS_RANDOM.value(6000000,30000000) INTO ci FROM DUAL;
    SELECT DBMS_RANDOM.value(1000000,9999999) INTO num FROM DUAL;
    SELECT DBMS_RANDOM.value(1,3) INTO sex FROM DUAL;
    IF sex = 1 THEN
      gen := 'NO BINARIO';
    END IF;
    IF sex = 2 THEN
      gen := 'FEMENINO';
    END IF;
    IF sex = 3 THEN
      gen := 'MASCULINO';
    END IF;
    INSERT INTO CLIENTE (id, datos, tipo, genero, telefono)
      VALUES (0, DatosPersonales(NOMBRE || ' ' || APELLIDO ,'CEDULA', to_char(ci, '99999999')), 'NATURAL', gen,'0412-'||to_char(num, '9999999'));
  END IF;
  DBMS_OUTPUT.PUT_LINE(module_name || 'ID = ' || ID);
  cliente_id := id;
END;
