-- MODULO DE REPARACION
CREATE OR REPLACE
TRIGGER BU_UNIDAD
BEFORE UPDATE ON Unidad
FOR EACH ROW
DECLARE
  wait_time INT;
  desm INT;
  emba INT;
  otra_unidad Unidad.id%type;
  module_name VARCHAR2(100);
  idped PED.ID%TYPE;
BEGIN
  IF :NEW.ubicacion <> :OLD.ubicacion THEN
    SELECT p.id INTO idped FROM PED p WHERE p.NOMBRE = :NEW.ubicacion;
    module_name := 'MViajeTG: ';
    SELECT SUM(r.PUESTOS) INTO desm FROM RESERVA r
      WHERE r.ESTADO = 'PROCESO'
        AND r.UNIDAD_ID = :NEW.id
        AND r.DESEMBARQUE = idped;
    IF desm IS null then
        desm := 0;
    END if;
    UPDATE RESERVA r SET estado = 'FINALIZADO'
      WHERE r.ESTADO = 'PROCESO'
        AND r.UNIDAD_ID = :NEW.id
        AND r.DESEMBARQUE = idped;
    SELECT SUM(r.PUESTOS) INTO emba FROM RESERVA r
      WHERE r.ESTADO = 'ESPERA'
        AND r.UNIDAD_ID = :NEW.id
        AND r.EMBARQUE = idped;
    IF emba IS null then
        emba := 0;
    END if;
    UPDATE RESERVA r SET estado = 'PROCESO'
      WHERE r.ESTADO = 'ESPERA'
        AND r.UNIDAD_ID = 2
        AND r.EMBARQUE = idped;
--    :NEW.puestos = :NEW.puestos - desm + emba;
    SELECT dbms_random.value(1,20) INTO wait_time FROM dual;
    IF wait_time = 13 THEN
      :NEW.estado := 'No Operativa';
    END IF;
  END IF;
--  IF :new.estado = 'No Operativa' THEN
--    module_name := 'MReparacion: ';
--    SELECT dbms_random.value(3,40) INTO wait_time FROM dual;
--    INSERT INTO Mantenimiento (id, unidad_id, observaciones, desperfetos, fecha)
--      VALUES (0, :new.id, 'Mantenimiento en la via', 'MUCHOS DESPERFECTOS'
--              RangeFechas((SELECT sysdate FROM DUAL), (SELECT sysdate+(wait_time/(24*60)) FROM DUAL)));
--    IF wait_time > 20 THEN
--      DBMS_OUTPUT.PUT_LINE(module_name || 'Reparacion Compleja, Vamos a llamar a Otra Unidad!');
--      BEGIN SELECT id INTO otra_unidad FROM Unidad WHERE ruta_id IS NULL AND ROWNUM <=1;
--      EXCEPTION WHEN no_data_found THEN
--        otra_unidad := NULL;
--      END;
--      IF otra_unidad IN NULL THEN
--        SELECT SEQ_UNIDAD_ID.NEXTVAL INTO otra_unidad FROM dual;
--        INSERT INTO Unidad (id, fecha, placa, foto, tipo, estado, ubicacion, puestos)
--          VALUES (otra_unidad, RangoFechas((SELECT sysdate FROM DUAL), null),
--                 (SELECT DBMS_RANDOM.STRING('x', 8) FROM DUAL), :new.foto,
--                 :new.tipo, 'Operativa', :new.ubicacion, :NEW.puestos)
--      END IF;
--      UPDATE Unidad SET ruta_id = :new.ruta_id WHERE id = otra_unidad;
--      UPDATE Reserva SET unidad_id = otra_unidad WHERE unidad_id = :new.id AND (estado = 'PROCESO' OR estado = 'ESPERA');
--      :new.ruta_id := NULL;
--      DBMS_OUTPUT.PUT_LINE(module_name || 'Una unidad ya recogio los pasajeros, llamaremos a PANA...');
--    ELSE
--      DBMS_OUTPUT.PUT_LINE(module_name || 'Reparacion Basica, Vamos a llamar a PANA!');
--    END IF;
--    DBMS_OUTPUT.PUT_LINE(module_name || 'PANA esta trabajando en la unidad esperemos un poco...');
--    INSERT INTO Dispone (unidad_id, alianza_id, fecha)
--      VALUES (:new.id, (SELECT idAlizanza FROM Alianza WHERE nombre = 'PANA'),
--              RangeFechas((SELECT sysdate FROM DUAL), (SELECT sysdate+(wait_time/(24*60)) FROM DUAL)));
--    DBMS_OUTPUT.PUT_LINE(module_name || 'PANA tardo '|| wait_time || 'minutos en repara la Unidad');
--    :new.estado := 'Operativa';
--  END IF;
END;

CREATE OR REPLACE PROCEDURE MVIAJE
IS
DECLARE
  unid UNIDAD%ROWTYPE;
  NOMBRE PED.NOMBRE%TYPE;
  x INT;
  posi INT;
  module_name VARCHAR2(100);
BEGIN
  module_name := 'MViaje: ';
  SELECT COUNT(ID) INTO x FROM UNIDAD;
  WHILE x < 10
  LOOP
    FOR unid IN (SELECT * FROM UNIDAD WHERE RUTA_ID IS NOT NULL)
    LOOP
      BEGIN
        SELECT r.pos INTO posi FROM RECORRE r
          INNER JOIN PED p ON p.id = r.PUNTO
          WHERE p.NOMBRE = unid.ubicacion
            AND r.RUTA_ID = unid.RUTA_ID;
      EXCEPTION WHEN no_data_found then posi := 0;
      END;
      BEGIN
        posi:=posi+1;
        SELECT p.nombre INTO NOMBRE FROM RECORRE r
          INNER JOIN PED p ON p.id = r.PUNTO
          WHERE r.pos = posi
            AND r.RUTA_ID = unid.RUTA_ID;
      EXCEPTION WHEN no_data_found then
        SELECT p.nombre INTO NOMBRE FROM RECORRE r
          INNER JOIN PED p ON p.id = r.PUNTO
          WHERE r.pos = 1
            AND r.RUTA_ID = unid.RUTA_ID;
      END;
      DBMS_OUTPUT.PUT_LINE(module_name || 'Unidad id:' || unid.id ||' esta viajando a ' || nombre);
      DBMS_LOCK.SLEEP(3);
      DBMS_OUTPUT.PUT_LINE(module_name || 'Unidad id:' || unid.id ||' esta ahora en ' || nombre);
      UPDATE UNIDAD SET UBICACION = NOMBRE WHERE ID = unid.id;
    END LOOP;
    x:=X+1;
--    SELECT COUNT(ID) INTO x FROM UNIDAD;
  END LOOP;
END;

SELECT * FROM PED;

 INSERT INTO PED (id,nombre,tipo,coordenadas)
  VALUES (0,'parada1',1,'14.47, -66.59');
 INSERT INTO PED (id,nombre,tipo,coordenadas)
  VALUES (0,'parada2',2,'30.47, -66.89');
 INSERT INTO PED (id,nombre,tipo,coordenadas)
  VALUES (0,'parada3',3,'10.17, -63.69');
 INSERT INTO PED (id,nombre,tipo,coordenadas)
  VALUES (0,'parada4',1,'10.67, -65.89');
 INSERT INTO PED (id,nombre,tipo,coordenadas)
  VALUES (0,'parada5',2,'20.47, -66.89');
INSERT INTO CONTINGENCIA (id, nombre, descripcion)
  VALUES (0,'lluvia','llueve');
INSERT INTO RUTA (id, contingencia_id, nombre)
  VALUES (0,1,'plaza venezuela');
SELECT * FROM RUTA ;
 INSERT INTO RECORRE (id,ruta_id,pos,punto)
VALUES (0,1,1,1);
 INSERT INTO RECORRE (id,ruta_id,pos,punto)
VALUES (0,1,2,2);
 INSERT INTO RECORRE (id,ruta_id,pos,punto)
VALUES (0,1,3,3);
 INSERT INTO RECORRE (id,ruta_id,pos,punto)
VALUES (0,1,4,4);
 INSERT INTO RECORRE (id,ruta_id,pos,punto)
VALUES (0,1,5,5);
INSERT INTO UNIDAD (id,placa, fecha, foto, estado, ruta_id, tipo, ubicacion, numero_asientos)
  VALUES (0,'AD85956F', RangoFecha('06-JUN-2022', null), EMPTY_BLOB(), 'OPERATIVA', 1, 'WAWA', ' ', 0);

SELECT * FROM UNIDAD ;
DELETE unidad WHERE id=3;

INSERT INTO CLIENTE (id, datos, tipo, telefono, genero)
  VALUES (0, DatosPersonales('Alexis Quiros','CEDULA','10059565'),'NATURAL','04125941461','MASCULINO');
INSERT INTO CLIENTE (id, datos, tipo, telefono, genero)
  VALUES (0, DatosPersonales('Fernando','CEDULA','15452365'),'NATURAL','04125941461','MASCULINO');
INSERT INTO CLIENTE (id, datos, tipo, telefono, genero)
  VALUES (0, DatosPersonales('Andrea','CEDULA','15454565'),'NATURAL','04125941461','MASCULINO');
INSERT INTO CLIENTE  (id, datos, tipo, telefono, genero)
  VALUES(0,DatosPersonales('Sergio Capon','CEDULA','26747663'),'NATURAL','04125941461','MASCULINO');
INSERT INTO CLIENTE  (id, datos, tipo, telefono, genero)
  VALUES(0,DatosPersonales('Mariah Tacanga','CEDULA','28749638'),'NATURAL','04125941461','FEMENINO');
INSERT INTO CLIENTE  (id, datos, tipo, LOGO)
  VALUES(0,DatosPersonales('UCAB','RIF','J101295658'),'CORPORATIVO',NULL);
INSERT INTO CLIENTE  (id, datos, tipo, LOGO)
  VALUES(0,DatosPersonales('PANA','RIF','J854596981'),'CORPORATIVO', null);
SELECT * FROM CLIENTE ;

INSERT INTO RESERVA (id,estado,hora_traslado,fechas,costo,calificacion,duracion,puestos,embarque,desembarque,unidad_id,cliente_id)
  Values(0,'ESPERA',SYSDATE,RangoFecha(SYSDATE, null),Costo(100,0),Calificacion('2','ninguna'),11,2,1,4,3,1);
INSERT INTO RESERVA (id,estado,hora_traslado,fechas,costo,calificacion,duracion,puestos,embarque,desembarque,unidad_id,cliente_id)
  Values(0,'ESPERA',SYSDATE,RangoFecha(SYSDATE, null),Costo(100,0),Calificacion('2','ninguna'),11,5,1,3,3,2);
INSERT INTO RESERVA (id,estado,hora_traslado,fechas,costo,calificacion,duracion,puestos,embarque,desembarque,unidad_id,cliente_id)
  Values(0,'ESPERA',SYSDATE,RangoFecha(SYSDATE, null),Costo(100,0),Calificacion('2','ninguna'),11,1,2,4,3,3);
INSERT INTO RESERVA (id,estado,hora_traslado,fechas,costo,calificacion,duracion,puestos,embarque,desembarque,unidad_id,cliente_id)
  Values(0,'ESPERA',SYSDATE,RangoFecha(SYSDATE, null),Costo(100,0),Calificacion('2','ninguna'),11,2,1,2,3,4);
INSERT INTO RESERVA (id,estado,hora_traslado,fechas,costo,calificacion,duracion,puestos,embarque,desembarque,unidad_id,cliente_id)
  Values(0,'ESPERA',SYSDATE,RangoFecha(SYSDATE, null),Costo(100,0),Calificacion('2','ninguna'),11,3,1,3,3,5);
INSERT INTO RESERVA (id,estado,hora_traslado,fechas,costo,calificacion,duracion,puestos,embarque,desembarque,unidad_id,cliente_id)
  Values(0,'ESPERA',SYSDATE,RangoFecha(SYSDATE, null),Costo(100,0),Calificacion('2','ninguna'),11,1,2,3,3,6);
SELECT * FROM RESERVA ;
UPDATE  reserva SET ESTADO= 'ESPERA';
