-- MODULO DE REPARACION
CREATE OR REPLACE
TRIGGER AU_UNIDAD
BEFORE UPDATE ON Unidad
DECLARE
  wait_time INT;
  otra_unidad Unidad.id%type;
  module_mane VARCHAR2(100);
BEGIN
  module_name := 'MReparacion: ';
  IF :new.estado = 'No Operativa' THEN
    SELECT dbms_random.value(3,40) INTO wait_time FROM dual;
    INSERT INTO Mantenimiento (unidad_id, observaciones, desperfetos, fecha)
      VALUES (:new.id, 'Mantenimiento en la via', 'MUCHOS DESPERFECTOS'
              RangeFechas((SELECT sysdate FROM DUAL), (SELECT sysdate+(wait_time/(24*60)) FROM DUAL)));
    IF wait_time > 20 THEN
      otra_unidad := NULL;
      DBMS_OUTPUT.PUT_LINE(module_name || 'Reparacion Compleja, Vamos a llamar a Otra Unidad!');
      SELECT id INTO otra_unidad FROM Unidad WHERE ruta_id IS NULL AND ROWNUM <=1;
      IF otra_unidad IN NULL THEN
        SELECT SEQ_UNIDAD_ID.NEXTVAL INTO otra_unidad FROM dual;
        INSERT INTO Unidad (id, fecha, placa, foto, tipo, estado, ubicacion)
          VALUES (otra_unidad, RangeFechas((SELECT sysdate FROM DUAL), null),
                 (SELECT DBMS_RANDOM.STRING('x', 8) FROM DUAL), :new.foto,
                 :new.tipo, 'Operativa', :new.ubicacion)
      END IF;
      UPDATE Unidad SET ruta_id = :new.ruta_id WHERE id = otra_unidad;
      UPDATE Reserva SET unidad_id = otra_unidad WHERE unidad_id = :new.id AND estado = 'PROCESO';
      :new.ruta_id := NULL;
      DBMS_OUTPUT.PUT_LINE(module_name || 'Una unidad ya recogio los pasajeros, llamaremos a PANA...');
    ELSE
      DBMS_OUTPUT.PUT_LINE(module_name || 'Reparacion Basica, Vamos a llamar a PANA!');
    END IF;
    DBMS_OUTPUT.PUT_LINE(module_name || 'PANA esta trabajando en la unidad esperemos un poco...');
    INSERT INTO Dispone (unidad_id, alianza_id, fecha)
      VALUES (:new.id, (SELECT idAlizanza FROM Alianza WHERE nombre = 'PANA'),
              RangeFechas((SELECT sysdate FROM DUAL), (SELECT sysdate+(wait_time/(24*60)) FROM DUAL)));
    DBMS_OUTPUT.PUT_LINE(module_name || 'PANA tardo '|| wait_time || 'minutos en repara la Unidad');
    :new.estado := 'Operativa';
  END IF;
END;
