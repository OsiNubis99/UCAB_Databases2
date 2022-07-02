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
  WHILE x < 60
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
      UPDATE UNIDAD SET UBICACION = NOMBRE WHERE ID = unid.id;
      DBMS_OUTPUT.PUT_LINE(module_name || 'Unidad id:' || unid.id ||' esta ahora en ' || nombre);
    END LOOP;
    INSERT INTO UNIDAD (id,placa, fecha, foto, estado, ruta_id, tipo, ubicacion, numero_asientos)
      VALUES (0,'AD85956F', RangoFecha('06-JUN-2022', null), EMPTY_BLOB(), 'OPERATIVA', null, 'WAWA', ' ', 0);
    SELECT COUNT(ID) INTO x FROM UNIDAD;
  END LOOP;
END;

 INSERT INTO PED (id,nombre,tipo,coordenadas)
  VALUES (0,'parada1',1,'14.47, -66.59');
 INSERT INTO PED (id,nombre,tipo,coordenadas)
  VALUES (0,'parada2',2,'30.47, -66.89');
 INSERT INTO PED (id,nombre,tipo,coordenadas)
  VALUES (0,'parada3',3,'10.17, -63.69');
 INSERT INTO PED (id,nombre,tipo,coordenadas)
  VALUES (4,'parada4',1,'10.67, -65.89');
 INSERT INTO PED (id,nombre,tipo,coordenadas)
  VALUES (0,'parada5',2,'20.47, -66.89');
INSERT INTO CONTINGENCIA (id, nombre, descripcion)
  VALUES (0,'lluvia','llueve');
INSERT INTO RUTA (id, contingencia_id, nombre)
  VALUES (0,1,'plaza venezuela');
 INSERT INTO RECORRE (id,ruta_id,pos,punto)
VALUES (0,4,1,1);
 INSERT INTO RECORRE (id,ruta_id,pos,punto)
VALUES (0,4,2,2);
 INSERT INTO RECORRE (id,ruta_id,pos,punto)
VALUES (0,4,3,3);
 INSERT INTO RECORRE (id,ruta_id,pos,punto)
VALUES (0,4,4,4);
 INSERT INTO RECORRE (id,ruta_id,pos,punto)
VALUES (0,4,5,5);
INSERT INTO UNIDAD (id,placa, fecha, foto, estado, ruta_id, tipo, ubicacion, numero_asientos)
  VALUES (0,'AD85956F', RangoFecha('06-JUN-2022', null), EMPTY_BLOB(), 'OPERATIVA', 4, 'WAWA', ' ', 0);

SELECT * FROM UNIDAD ;
