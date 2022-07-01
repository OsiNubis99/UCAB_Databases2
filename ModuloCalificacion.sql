-- MODULO DE CALIFICACION
CREATE OR REPLACE
TRIGGER AU_CALIFICACION
BEFORE UPDATE ON Calificacion
DECLARE
  comment INT;
  escala INT;
  escalaVARCHAR VARCHAR2(2);
  cliente Cliente%rowtype;
  feed VARCHAR2(100);
  module_name VARCHAR2(100);
BEGIN
  module_name := 'MCalificacion ';
  IF :new.estado = 'Completado' THEN
    SELECT * INTO cliente FROM Cliente WHERE id = :new.cliente_id;
    SELECT dbms_random.value INTO comment FROM dual;
    IF comment = 1 THEN
      DBMS_OUTPUT.PUT_LINE(module_name || 'El usuario ' || Cliente.nombre || ' esta comentando. :D');
      SELECT dbms_random.value(1,3) INTO escala FROM dual;
      IF escala = 1 THEN
         escalaVARCHAR := ':(';
      END IF;
      IF escala = 2 THEN
         escalaVARCHAR := ':|';
      END IF;
      IF escala = 3 THEN
         escalaVARCHAR := ':)';
      END IF;
      :new.calificacion := Calificacion(escalaVARCHAR, 'Calificacion Generada Por MCalificacion');
    ELSE
      DBMS_OUTPUT.PUT_LINE(module_name || 'El usuario ' || Cliente.nombre || ' no comento nada. :(');
    END IF;
  END IF;
END;
