INSERT INTO UNIDAD DATOS('Andrés','Álvarez');
INSERT INTO UNIDAD DATOS('Cristiano','Andrade');
INSERT INTO UNIDAD DATOS('Gerard','Benítez');
INSERT INTO UNIDAD DATOS('Lionel','Castillo');
INSERT INTO UNIDAD DATOS('Neymar','Castro');
INSERT INTO UNIDAD DATOS('Ana','Contreras');
INSERT INTO UNIDAD DATOS('Enzo','De León');
INSERT INTO UNIDAD DATOS('Eva','Díaz');
INSERT INTO UNIDAD DATOS('Eric','Duarte');
INSERT INTO UNIDAD DATOS('Hugo','Espinoza');
INSERT INTO UNIDAD DATOS('Iván','Fernández');
INSERT INTO UNIDAD DATOS('Juan','Flores');
INSERT INTO UNIDAD DATOS('Lara','García');
INSERT INTO UNIDAD DATOS('Leo','Giménez');
INSERT INTO UNIDAD DATOS('Luz','Gómez');
INSERT INTO UNIDAD DATOS('Mar','Gonzales');
INSERT INTO UNIDAD DATOS('Nora','Gutiérrez');
INSERT INTO UNIDAD DATOS('Raúl','Hernández');
INSERT INTO UNIDAD DATOS('Héctor','Jiménez');
INSERT INTO UNIDAD DATOS('Sara','López');


INSERT INTO UNIDAD (placa, fecha, foto, estado, ruta_id, tipo, ubicacion, numero_asientos)
  VALUES ('AD85956F', RangoFecha('06-JUN-2022', null), EMPTY_BLOB(), 'OPERATIVA', NULL, 'WAWA', ' ', 0);
INSERT INTO UNIDAD (placa, fecha, foto, estado, ruta_id, tipo, ubicacion, numero_asientos)
  VALUES ('JH21786A', RangoFecha('10-JUL-2022', null), EMPTY_BLOB(), 'OPERATIVA', NULL, 'WAWITA', ' ', 0);
INSERT INTO UNIDAD (placa, fecha, foto, estado, ruta_id, tipo, ubicacion, numero_asientos)
  VALUES ('RT852456', RangoFecha('22-JUN-2022', null), EMPTY_BLOB(), 'NO OPERATIVA', NULL, 'WAWA', ' ', 0);

INSERT INTO UNIDAD (placa, fecha, foto, estado, ruta_id, tipo, ubicacion, numero_asientos)
  VALUES ('AB85916F', RangoFecha('06-JUN-2022', null), EMPTY_BLOB(), 'OPERATIVA', NULL, 'WAWA', ' ', 0);

  INSERT INTO UNIDAD (placa, fecha, foto, estado, ruta_id, tipo, ubicacion, numero_asientos)
  VALUES ('BD869FFF', RangoFecha('08-JUN-2022', null), EMPTY_BLOB(), 'OPERATIVA', NULL, 'WAWA', ' ', 0);

    INSERT INTO UNIDAD (placa, fecha, foto, estado, ruta_id, tipo, ubicacion, numero_asientos)
  VALUES ('AC8GHFFF', RangoFecha('03-JUN-2022', null), EMPTY_BLOB(), 'OPERATIVA', NULL, 'WAWA', ' ', 0);


INSERT INTO CLIENTE VALUES(NULL,DatosPersonales('Alexis Quiros','CEDULA','15459565'),'01-JUL-2022','NATURAL','04125941461','MASCULINO',NULL);
INSERT INTO CLIENTE VALUES(NULL,DatosPersonales('Andres Hurtado','CEDULA','20459862'),'06-JUN-2022','NATURAL','04125941461','MASCULINO',NULL);
INSERT INTO CLIENTE VALUES(NULL,DatosPersonales('Sergio Capon','CEDULA','26747663'),'10-AUG-2022','NATURAL','04125941461','MASCULINO',NULL);
INSERT INTO CLIENTE VALUES(NULL,DatosPersonales('Mariah Tacanga','CEDULA','28749638'),'23-MAY-2022','NATURAL','04125941461','FEMENINO',NULL);
INSERT INTO CLIENTE VALUES(NULL,DatosPersonales('UCAB','RIF','J101295658'),'1-MAY-2022','CORPORATIVO',NULL,NULL,EMPTY_BLOB()) RETURNING FOTO INTO V_TEMP;
INSERT INTO CLIENTE VALUES(NULL,DatosPersonales('PANA','RIF','J854596981'),'6-MAY-2022','CORPORATIVO',NULL,NULL,EMPTY_BLOB()) RETURNING FOTO INTO V_TEMP;

    INSERT INTO SERVICIOS (id, nombre, descripcion, exclusivo)
  VALUES (1, 'serivicio1', 'a todos lados', 1);
  INSERT INTO SERVICIOS (id, nombre, descripcion, exclusivo)
  VALUES (2, 'serivicio1', 'a todos lados', 0);
  INSERT INTO SERVICIOS (id, nombre, descripcion, exclusivo)
  VALUES (3, 'serivicio1', 'a todos lados', 0);
  INSERT INTO SERVICIOS (id, nombre, descripcion, exclusivo)
  VALUES (4, 'serivicio1', 'a todos lados', 0);
  INSERT INTO SERVICIOS (id, nombre, descripcion, exclusivo)
  VALUES (5, 'serivicio1', 'a todos lados', 0);
  INSERT INTO SERVICIOS (id, nombre, descripcion, exclusivo)
  VALUES (6, 'serivicio1', 'a todos lados', 1);


  INSERT INTO OFRECE (id, servicios_id, unidad_id)
  VALUES (1,2,1);
  INSERT INTO OFRECE (id, servicios_id, unidad_id)
  VALUES (1,1,2);
  INSERT INTO OFRECE (id, servicios_id, unidad_id)
  VALUES (1,3,3);
  INSERT INTO OFRECE (id, servicios_id, unidad_id)
  VALUES (1,4,4);
  INSERT INT OFRECE (id, servicios_id, unidad_id)
  VALUES (1,6,5);
  INSERT INTO OFRECE (id, servicios_id, unidad_id)
  VALUES (1,5,6);

INSERT INTO CONTINGENCIA (id, nombre, descripcion)
  VALUES (1,'lluvia','llueve');

  INSERT INTO CONTINGENCIA (id, nombre, descripcion)
  VALUES (2,'tormenta','llueve');
  INSERT INTO CONTINGENCIA (id, nombre, descripcion)
  VALUES (3,'choque','retraso');
  INSERT INTO CONTINGENCIA (id, nombre, descripcion)
  VALUES (4,'accidentado','retraso');
  INSERT INTO CONTINGENCIA (id, nombre, descripcion)
  VALUES (5,'herido','leve retraso');
INSERT INTO CONTINGENCIA (id, nombre, descripcion)
  VALUES (6,'huecos','retraso');
  INSERT INTO CONTINGENCIA (id, nombre, descripcion)
  VALUES (7,'alcabala','retraso');


  INSERT INTO RUTA (id, contingencia_id, nombre)
  VALUES (1,1,'plaza venezuela');
  INSERT INTO RUTA (id, contingencia_id, nombre)
  VALUES (2,1,'caricuao');
  INSERT INTO RUTA (id, contingencia_id, nombre)
  VALUES (3,1,'chacao');
  INSERT INTO RUTA (id, contingencia_id, nombre)
  VALUES (4,1,'Bellas Artes');
  INSERT INTO RUTA (id, contingencia_id, nombre)
  VALUES (5,1,'Los crotijos');
  INSERT INTO RUTA (id, contingencia_id, nombre)
  VALUES (6,1,'redoma');


 INSERT INTO PED (id,nombre,coordenadas)
  VALUES (1,'parada1','14.47, -66.59');

  
 INSERT INTO PED (id,nombre,coordenadas)
  VALUES (2,'parada2','30.47, -66.89');
  
 INSERT INTO PED (id,nombre,coordenadas)
  VALUES (3,'parada3','10.17, -63.69');
  
 INSERT INTO PED (id,nombre,coordenadas)
  VALUES (4,'parada4','10.67, -65.89');
  
 INSERT INTO PED (id,nombre,coordenadas)
  VALUES (5,'parada5','20.47, -66.89');
  
 INSERT INTO PED (id,nombre,coordenadas)
  VALUES (6,'parada6','16.47, -23.89');
  
 INSERT INTO PED (id,nombre,coordenadas)
  VALUES (7,'parada7','10.47, -66.83');


 INSERT INTO RECORRE (id,ruta_id,salida,llegada)
  VALUES (1,1,1,3);
   INSERT INTO RECORRE (id,ruta_id,salida,llegada)
  VALUES (2,2,5,6);
   INSERT INTO RECORRE (id,ruta_id,salida,llegada)
  VALUES (3,3,1,6);
   INSERT INTO RECORRE (id,ruta_id,salida,llegada)
  VALUES (4,4,1,7);
   INSERT INTO RECORRE (id,ruta_id,salida,llegada)
  VALUES (5,5,4,7);
   INSERT INTO RECORRE (id,ruta_id,salida,llegada)
  VALUES (6,6,2,5);