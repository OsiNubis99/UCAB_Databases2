INSERT INTO ADMIN.CLIENTE (id, datos, tipo, telefono, genero)
  VALUES (1, ADMIN.DatosPersonales('Alexis Quiros','CEDULA','10059565'),'NATURAL','04125941461','MASCULINO');
INSERT INTO ADMIN.CLIENTE (id, datos, tipo, telefono, genero)
  VALUES (2, ADMIN.DatosPersonales('Fernando','CEDULA','15452365'),'NATURAL','04125941461','MASCULINO');
INSERT INTO ADMIN.CLIENTE (id, datos, tipo, telefono, genero)
  VALUES (3, ADMIN.DatosPersonales('Andrea','CEDULA','15454565'),'NATURAL','04125941461','MASCULINO');
INSERT INTO ADMIN.CLIENTE (id, datos, tipo, telefono, genero)
  VALUES (4, ADMIN.DatosPersonales('Sergio Capon','CEDULA','26747663'),'NATURAL','04125941461','MASCULINO');
INSERT INTO ADMIN.CLIENTE (id, datos, tipo, telefono, genero)
  VALUES (5, ADMIN.DatosPersonales('Mariah Tacanga','CEDULA','28749638'),'NATURAL','04125941461','FEMENINO');
INSERT INTO ADMIN.CLIENTE (id, datos, tipo, LOGO)
  VALUES (6, ADMIN.DatosPersonales('UCAB','RIF','J101295658'),'CORPORATIVO',NULL);
INSERT INTO ADMIN.CLIENTE (id, datos, tipo, LOGO)
  VALUES (7, ADMIN.DatosPersonales('PANA','RIF','J854596981'),'CORPORATIVO', null);
SELECT * FROM CLIENTE ;
DELETE FROM ADMIN.CLIENTE WHERE id = 0;

INSERT INTO ADMIN.PED (id,nombre,tipo,coordenadas)
  VALUES (1,'parada1',1,'14.47, -66.59');
 INSERT INTO ADMIN.PED (id,nombre,tipo,coordenadas)
  VALUES (2,'parada2',2,'30.47, -66.89');
 INSERT INTO ADMIN.PED (id,nombre,tipo,coordenadas)
  VALUES (3,'parada3',3,'10.17, -63.69');
 INSERT INTO ADMIN.PED (id,nombre,tipo,coordenadas)
  VALUES (4,'parada4',1,'10.67, -65.89');
 INSERT INTO ADMIN.PED (id,nombre,tipo,coordenadas)
  VALUES (5,'parada5',2,'20.47, -66.89');
SELECT * FROM PED;

INSERT INTO ADMIN.CONTINGENCIA (id, nombre, descripcion)
  VALUES (1,'lluvia','llueve');
SELECT * FROM CONTINGENCIA;

INSERT INTO ADMIN.RUTA (id, contingencia_id, nombre)
  VALUES (1,null,'plaza venezuela');
SELECT * FROM RUTA;

INSERT INTO ADMIN.RECORRE (id,ruta_id,pos,punto)
  VALUES (1,1,1,1);
INSERT INTO ADMIN.RECORRE (id,ruta_id,pos,punto)
  VALUES (2,1,2,2);
INSERT INTO ADMIN.RECORRE (id,ruta_id,pos,punto)
  VALUES (3,1,3,3);
INSERT INTO ADMIN.RECORRE (id,ruta_id,pos,punto)
  VALUES (4,1,4,4);
INSERT INTO ADMIN.RECORRE (id,ruta_id,pos,punto)
  VALUES (5,1,5,5);
SELECT * FROM RECORRE;

INSERT INTO ADMIN.UNIDAD (id,placa, fecha, foto, estado, ruta_id, tipo, ubicacion, numero_asientos)
  VALUES (1,'AD85956F', ADMIN.RangoFecha('06-JUN-2022', null), EMPTY_BLOB(), 'OPERATIVA', 1, 'WAWA', ' ', 0);
SELECT * FROM UNIDAD ;

INSERT INTO ADMIN.RESERVA (id,estado,hora_traslado,fechas,costo,calificacion,duracion,puestos,embarque,desembarque,unidad_id,cliente_id)
  Values(1,'ESPERA',SYSDATE,ADMIN.RangoFecha(SYSDATE, null),ADMIN.Costo(100,0),ADMIN.Calificacion(':)','Bien'),11,2,1,4,1,1);
INSERT INTO ADMIN.RESERVA (id,estado,hora_traslado,fechas,costo,calificacion,duracion,puestos,embarque,desembarque,unidad_id,cliente_id)
  Values(2,'ESPERA',SYSDATE,ADMIN.RangoFecha(SYSDATE, null),ADMIN.Costo(100,0),ADMIN.Calificacion(':|','ninguna'),11,5,1,3,1,2);
INSERT INTO ADMIN.RESERVA (id,estado,hora_traslado,fechas,costo,calificacion,duracion,puestos,embarque,desembarque,unidad_id,cliente_id)
  Values(3,'ESPERA',SYSDATE,ADMIN.RangoFecha(SYSDATE, null),ADMIN.Costo(100,0),ADMIN.Calificacion(':(','ninguna'),11,1,2,4,1,3);
INSERT INTO ADMIN.RESERVA (id,estado,hora_traslado,fechas,costo,calificacion,duracion,puestos,embarque,desembarque,unidad_id,cliente_id)
  Values(4,'ESPERA',SYSDATE,ADMIN.RangoFecha(SYSDATE, null),ADMIN.Costo(100,0),ADMIN.Calificacion(':)','ninguna'),11,2,1,2,1,4);
INSERT INTO ADMIN.RESERVA (id,estado,hora_traslado,fechas,costo,calificacion,duracion,puestos,embarque,desembarque,unidad_id,cliente_id)
  Values(5,'ESPERA',SYSDATE,ADMIN.RangoFecha(SYSDATE, null),ADMIN.Costo(100,0),ADMIN.Calificacion(':)','ninguna'),11,3,1,3,1,5);
INSERT INTO ADMIN.RESERVA (id,estado,hora_traslado,fechas,costo,calificacion,duracion,puestos,embarque,desembarque,unidad_id,cliente_id)
  Values(6,'ESPERA',SYSDATE,ADMIN.RangoFecha(SYSDATE, null),ADMIN.Costo(100,0),ADMIN.Calificacion(':|','ninguna'),11,1,2,3,1,6);
SELECT * FROM ADMIN.RESERVA;
