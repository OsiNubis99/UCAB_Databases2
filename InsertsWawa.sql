INSERT INTO SYSTEM.CLIENTE (id, datos, tipo, telefono, genero)
  VALUES (1, SYSTEM.DatosPersonales('Alexis Quiros','CEDULA','10059565'),'NATURAL','04125941461','MASCULINO');
INSERT INTO SYSTEM.CLIENTE (id, datos, tipo, telefono, genero)
  VALUES (2, SYSTEM.DatosPersonales('Fernando','CEDULA','15452365'),'NATURAL','04125941461','MASCULINO');
INSERT INTO SYSTEM.CLIENTE (id, datos, tipo, telefono, genero)
  VALUES (3, SYSTEM.DatosPersonales('Andrea','CEDULA','15454565'),'NATURAL','04125941461','MASCULINO');
INSERT INTO SYSTEM.CLIENTE (id, datos, tipo, telefono, genero)
  VALUES (4, SYSTEM.DatosPersonales('Sergio Capon','CEDULA','26747663'),'NATURAL','04125941461','MASCULINO');
INSERT INTO SYSTEM.CLIENTE (id, datos, tipo, telefono, genero)
  VALUES (5, SYSTEM.DatosPersonales('Mariah Tacanga','CEDULA','28749638'),'NATURAL','04125941461','FEMENINO');
INSERT INTO SYSTEM.CLIENTE (id, datos, tipo, LOGO)
  VALUES (6, SYSTEM.DatosPersonales('UCAB','RIF','J101295658'),'CORPORATIVO',NULL);
INSERT INTO SYSTEM.CLIENTE (id, datos, tipo, LOGO)
  VALUES (7, SYSTEM.DatosPersonales('PANA','RIF','J854596981'),'CORPORATIVO', null);


INSERT INTO SYSTEM.CLIENTE (id, datos, tipo, LOGO)
  VALUES (8, SYSTEM.DatosPersonales('juan','CEDULA','270234981'),'NATURAL', null);

INSERT INTO SYSTEM.CLIENTE (id, datos, tipo, LOGO)
  VALUES (9, SYSTEM.DatosPersonales('FARAMATODO','RIF','J944596981'),'CORPORATIVO', null);

INSERT INTO SYSTEM.CLIENTE (id, datos, tipo, LOGO)
  VALUES (10, SYSTEM.DatosPersonales('CENTRA MADEREINSE','RIF','J867896981'),'CORPORATIVO', null);

INSERT INTO SYSTEM.CLIENTE (id, datos, tipo, LOGO)
  VALUES (11, SYSTEM.DatosPersonales('UNICASA','RIF','J854509881'),'CORPORATIVO', null);

INSERT INTO SYSTEM.CLIENTE (id, datos, tipo, LOGO)
  VALUES (12, SYSTEM.DatosPersonales('Fernando Quiros','CEDULA','6565897'),'NATURAL', null);

INSERT INTO SYSTEM.CLIENTE (id, datos, tipo, LOGO)
  VALUES (13, SYSTEM.DatosPersonales('Adriana Perez','CEDULA','23456091'),'NATURAL', null);

INSERT INTO SYSTEM.CLIENTE (id, datos, tipo, LOGO)
  VALUES (14, SYSTEM.DatosPersonales('OSCAR Alejandro','CEDULA','31029403'),'NATURAL', null);

INSERT INTO SYSTEM.CLIENTE (id, datos, tipo, LOGO)
  VALUES (15, SYSTEM.DatosPersonales('LOCATEL','RIF','J85430494'),'CORPORATIVO', null);

INSERT INTO SYSTEM.CLIENTE (id, datos, tipo, LOGO)
  VALUES (16, SYSTEM.DatosPersonales('UNICASA','RIF','J858496911'),'CORPORATIVO', null);

INSERT INTO SYSTEM.CLIENTE (id, datos, tipo, LOGO)
  VALUES (17, SYSTEM.DatosPersonales('POLAR','RIF','J8544395961'),'CORPORATIVO', null);

INSERT INTO SYSTEM.CLIENTE (id, datos, tipo, LOGO)
  VALUES (18, SYSTEM.DatosPersonales('SANTA MARIA','RIF','J812346981'),'CORPORATIVO', null);


SELECT * FROM CLIENTE ;

DELETE FROM SYSTEM.CLIENTE WHERE id = 0;

INSERT INTO SYSTEM.PED (id,nombre,tipo,coordenadas)
  VALUES (1,'parada1',1,'14.47, -66.59');
 INSERT INTO SYSTEM.PED (id,nombre,tipo,coordenadas)
  VALUES (2,'parada2',2,'30.47, -66.89');
 INSERT INTO SYSTEM.PED (id,nombre,tipo,coordenadas)
  VALUES (3,'parada3',3,'10.17, -63.69');
 INSERT INTO SYSTEM.PED (id,nombre,tipo,coordenadas)
  VALUES (4,'parada4',1,'10.67, -65.89');
 INSERT INTO SYSTEM.PED (id,nombre,tipo,coordenadas)
  VALUES (5,'parada5',2,'20.47, -66.89');
SELECT * FROM PED;

INSERT INTO SYSTEM.CONTINGENCIA (id, nombre, descripcion)
  VALUES (1,'lluvia','llueve');
SELECT * FROM CONTINGENCIA;

INSERT INTO SYSTEM.RUTA (id, contingencia_id, nombre)
  VALUES (1,null,'plaza venezuela');
SELECT * FROM RUTA;

INSERT INTO SYSTEM.RECORRE (id,ruta_id,pos,punto)
  VALUES (1,1,1,1);
INSERT INTO SYSTEM.RECORRE (id,ruta_id,pos,punto)
  VALUES (2,1,2,2);
INSERT INTO SYSTEM.RECORRE (id,ruta_id,pos,punto)
  VALUES (3,1,3,3);
INSERT INTO SYSTEM.RECORRE (id,ruta_id,pos,punto)
  VALUES (4,1,4,4);
INSERT INTO SYSTEM.RECORRE (id,ruta_id,pos,punto)
  VALUES (5,1,5,5);
SELECT * FROM RECORRE;

INSERT INTO SYSTEM.UNIDAD (id,placa, fecha, foto, estado, ruta_id, tipo, ubicacion, numero_asientos)
  VALUES (1,'AD85956F', SYSTEM.RangoFecha('06-JUN-2022', null), EMPTY_BLOB(), 'OPERATIVA', 1, 'WAWA', ' ', 0);
SELECT * FROM UNIDAD ;

INSERT INTO SYSTEM.RESERVA (id,estado,hora_traslado,fechas,costo,calificacion,duracion,puestos,embarque,desembarque,unidad_id,cliente_id)
  Values(1,'FINALIZADA',SYSDATE-1,SYSTEM.RangoFecha(SYSDATE-1, SYSDATE),SYSTEM.Costo(100,0),SYSTEM.Calificacion(':)','Bien'),11,2,1,4,1,1);
INSERT INTO SYSTEM.RESERVA (id,estado,hora_traslado,fechas,costo,calificacion,duracion,puestos,embarque,desembarque,unidad_id,cliente_id)
  Values(2,'FINALIZADA',SYSDATE-1,SYSTEM.RangoFecha(SYSDATE-1, SYSDATE),SYSTEM.Costo(100,0),SYSTEM.Calificacion(':|','ninguna'),11,5,1,3,1,2);
INSERT INTO SYSTEM.RESERVA (id,estado,hora_traslado,fechas,costo,calificacion,duracion,puestos,embarque,desembarque,unidad_id,cliente_id)
  Values(3,'FINALIZADA',SYSDATE-2,SYSTEM.RangoFecha(SYSDATE-2, SYSDATE),SYSTEM.Costo(100,0),SYSTEM.Calificacion(':(','ninguna'),11,1,2,4,1,3);
INSERT INTO SYSTEM.RESERVA (id,estado,hora_traslado,fechas,costo,calificacion,duracion,puestos,embarque,desembarque,unidad_id,cliente_id)
  Values(4,'FINALIZADA',SYSDATE-2,SYSTEM.RangoFecha(SYSDATE-2, SYSDATE),SYSTEM.Costo(100,0),SYSTEM.Calificacion(':)','ninguna'),11,2,1,2,1,4);
INSERT INTO SYSTEM.RESERVA (id,estado,hora_traslado,fechas,costo,calificacion,duracion,puestos,embarque,desembarque,unidad_id,cliente_id)
  Values(5,'FINALIZADA',SYSDATE-2,SYSTEM.RangoFecha(SYSDATE-2, SYSDATE),SYSTEM.Costo(100,0),SYSTEM.Calificacion(':)','ninguna'),11,3,1,3,1,5);
INSERT INTO SYSTEM.RESERVA (id,estado,hora_traslado,fechas,costo,calificacion,duracion,puestos,embarque,desembarque,unidad_id,cliente_id)
  Values(6,'FINALIZADA',SYSDATE-2,SYSTEM.RangoFecha(SYSDATE-2, SYSDATE),SYSTEM.Costo(100,0),SYSTEM.Calificacion(':|','ninguna'),11,1,2,3,1,6);
SELECT * FROM SYSTEM.RESERVA;


INSERT INTO SYSTEM.RESERVA (id,estado,hora_traslado,fechas,costo,calificacion,duracion,puestos,embarque,desembarque,unidad_id,cliente_id)
  Values(7,'FINALIZADA',SYSDATE-1,SYSTEM.RangoFecha(SYSDATE, SYSDATE),SYSTEM.Costo(100,0),SYSTEM.Calificacion(':)','Bien'),11,2,1,4,1,7);
  INSERT INTO SYSTEM.RESERVA (id,estado,hora_traslado,fechas,costo,calificacion,duracion,puestos,embarque,desembarque,unidad_id,cliente_id)
  Values(8,'FINALIZADA',SYSDATE-1,SYSTEM.RangoFecha(SYSDATE, SYSDATE),SYSTEM.Costo(100,0),SYSTEM.Calificacion(':)','Bien'),11,2,1,4,1,9);
  INSERT INTO SYSTEM.RESERVA (id,estado,hora_traslado,fechas,costo,calificacion,duracion,puestos,embarque,desembarque,unidad_id,cliente_id)
  Values(9,'FINALIZADA',SYSDATE-1,SYSTEM.RangoFecha(SYSDATE-1, SYSDATE),SYSTEM.Costo(100,0),SYSTEM.Calificacion(':)','Bien'),11,2,1,4,1,8);
  INSERT INTO SYSTEM.RESERVA (id,estado,hora_traslado,fechas,costo,calificacion,duracion,puestos,embarque,desembarque,unidad_id,cliente_id)
  Values(10,'FINALIZADA',SYSDATE-1,SYSTEM.RangoFecha(SYSDATE-1, SYSDATE),SYSTEM.Costo(100,0),SYSTEM.Calificacion(':)','Bien'),11,2,1,4,1,10);
  INSERT INTO SYSTEM.RESERVA (id,estado,hora_traslado,fechas,costo,calificacion,duracion,puestos,embarque,desembarque,unidad_id,cliente_id)
  Values(11,'FINALIZADA',SYSDATE-1,SYSTEM.RangoFecha(SYSDATE-1, SYSDATE),SYSTEM.Costo(100,0),SYSTEM.Calificacion(':)','Bien'),11,2,1,4,1,11);
  INSERT INTO SYSTEM.RESERVA (id,estado,hora_traslado,fechas,costo,calificacion,duracion,puestos,embarque,desembarque,unidad_id,cliente_id)
  Values(12,'FINALIZADA',SYSDATE-1,SYSTEM.RangoFecha(SYSDATE-1, SYSDATE),SYSTEM.Costo(100,0),SYSTEM.Calificacion(':)','Bien'),11,2,1,4,1,12);
  INSERT INTO SYSTEM.RESERVA (id,estado,hora_traslado,fechas,costo,calificacion,duracion,puestos,embarque,desembarque,unidad_id,cliente_id)
  Values(13,'FINALIZADA',SYSDATE-1,SYSTEM.RangoFecha(SYSDATE-1, SYSDATE),SYSTEM.Costo(100,0),SYSTEM.Calificacion(':)','Bien'),11,2,1,4,1,1);
  INSERT INTO SYSTEM.RESERVA (id,estado,hora_traslado,fechas,costo,calificacion,duracion,puestos,embarque,desembarque,unidad_id,cliente_id)
  Values(14,'FINALIZADA',SYSDATE-1,SYSTEM.RangoFecha(SYSDATE-1, SYSDATE),SYSTEM.Costo(100,0),SYSTEM.Calificacion(':)','Bien'),11,2,1,4,1,4);
  
  
  INSERT INTO SYSTEM.RESERVA (id,estado,hora_traslado,fechas,costo,calificacion,duracion,puestos,embarque,desembarque,unidad_id,cliente_id)
  Values(15,'ESPERA',SYSDATE,SYSTEM.RangoFecha(SYSDATE, null),SYSTEM.Costo(100,0),SYSTEM.Calificacion('',''),10,2,1,4,2,2);
  INSERT INTO SYSTEM.RESERVA (id,estado,hora_traslado,fechas,costo,calificacion,duracion,puestos,embarque,desembarque,unidad_id,cliente_id)
  Values(16,'ESPERA',SYSDATE,SYSTEM.RangoFecha(SYSDATE, null),SYSTEM.Costo(100,0),SYSTEM.Calificacion('',''),9,3,1,5,2,5);
  INSERT INTO SYSTEM.RESERVA (id,estado,hora_traslado,fechas,costo,calificacion,duracion,puestos,embarque,desembarque,unidad_id,cliente_id)
  Values(17,'ESPERA',SYSDATE,SYSTEM.RangoFecha(SYSDATE, null),SYSTEM.Costo(100,0),SYSTEM.Calificacion('',''),8,4,1,6,2,7);
  INSERT INTO SYSTEM.RESERVA (id,estado,hora_traslado,fechas,costo,calificacion,duracion,puestos,embarque,desembarque,unidad_id,cliente_id)
  Values(18,'ESPERA',SYSDATE,SYSTEM.RangoFecha(SYSDATE, null),SYSTEM.Costo(100,0),SYSTEM.Calificacion('',''),7,1,2,7,2,5);
  INSERT INTO SYSTEM.RESERVA (id,estado,hora_traslado,fechas,costo,calificacion,duracion,puestos,embarque,desembarque,unidad_id,cliente_id)
  Values(19,'ESPERA',SYSDATE,SYSTEM.RangoFecha(SYSDATE, null),SYSTEM.Costo(100,0),SYSTEM.Calificacion('',''),11,3,4,8,2,8);
  INSERT INTO SYSTEM.RESERVA (id,estado,hora_traslado,fechas,costo,calificacion,duracion,puestos,embarque,desembarque,unidad_id,cliente_id)
  Values(20,'ESPERA',SYSDATE,SYSTEM.RangoFecha(SYSDATE, null),SYSTEM.Costo(100,0),SYSTEM.Calificacion('',''),10,2,1,4,2,9);
  INSERT INTO SYSTEM.RESERVA (id,estado,hora_traslado,fechas,costo,calificacion,duracion,puestos,embarque,desembarque,unidad_id,cliente_id)
  Values(21,'ESPERA',SYSDATE,SYSTEM.RangoFecha(SYSDATE, null),SYSTEM.Costo(100,0),SYSTEM.Calificacion('',''),16,4,1,3,2,4);
  INSERT INTO SYSTEM.RESERVA (id,estado,hora_traslado,fechas,costo,calificacion,duracion,puestos,embarque,desembarque,unidad_id,cliente_id)
  Values(22,'ESPERA',SYSDATE,SYSTEM.RangoFecha(SYSDATE, null),SYSTEM.Costo(100,0),SYSTEM.Calificacion('',''),15,5,1,3,2,6);
  INSERT INTO SYSTEM.RESERVA (id,estado,hora_traslado,fechas,costo,calificacion,duracion,puestos,embarque,desembarque,unidad_id,cliente_id)
  Values(23,'ESPERA',SYSDATE,SYSTEM.RangoFecha(SYSDATE, null),SYSTEM.Costo(100,0),SYSTEM.Calificacion('',''),15,6,2,4,3,14);
  INSERT INTO SYSTEM.RESERVA (id,estado,hora_traslado,fechas,costo,calificacion,duracion,puestos,embarque,desembarque,unidad_id,cliente_id)
  Values(24,'ESPERA',SYSDATE,SYSTEM.RangoFecha(SYSDATE, null),SYSTEM.Costo(100,0),SYSTEM.Calificacion('',''),7,4,3,5,3,3);
  INSERT INTO SYSTEM.RESERVA (id,estado,hora_traslado,fechas,costo,calificacion,duracion,puestos,embarque,desembarque,unidad_id,cliente_id)
  Values(25,'ESPERA',SYSDATE,SYSTEM.RangoFecha(SYSDATE, null),SYSTEM.Costo(100,0),SYSTEM.Calificacion('',''),3,3,1,6,3,9);


