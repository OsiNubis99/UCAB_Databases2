INSERT INTO DATOS VALUES ('Andrés','Álvarez');
INSERT INTO DATOS VALUES ('Cristiano','Andrade');
INSERT INTO DATOS VALUES ('Gerard','Benítez');
INSERT INTO DATOS VALUES ('Lionel','Castillo');
INSERT INTO DATOS VALUES ('Neymar','Castro');
INSERT INTO DATOS VALUES ('Ana','Contreras');
INSERT INTO DATOS VALUES ('Enzo','De León');
INSERT INTO DATOS VALUES ('Eva','Díaz');
INSERT INTO DATOS VALUES ('Eric','Duarte');
INSERT INTO DATOS VALUES ('Hugo','Espinoza');
INSERT INTO DATOS VALUES ('Iván','Fernández');
INSERT INTO DATOS VALUES ('Juan','Flores');
INSERT INTO DATOS VALUES ('Lara','García');
INSERT INTO DATOS VALUES ('Leo','Giménez');
INSERT INTO DATOS VALUES ('Luz','Gómez');
INSERT INTO DATOS VALUES ('Mar','Gonzales');
INSERT INTO DATOS VALUES ('Nora','Gutiérrez');
INSERT INTO DATOS VALUES ('Raúl','Hernández');
INSERT INTO DATOS VALUES ('Héctor','Jiménez');
INSERT INTO DATOS VALUES ('Sara','López');


INSERT INTO UNIDAD (id, placa, fecha, foto, estado, ruta_id, tipo, ubicacion, numero_asientos)
  VALUES (0,'AD85956F', RangoFecha('06-JUN-2022', null), EMPTY_BLOB(), 'OPERATIVA', 1, 'WAWA', ' ', 0);





  
INSERT INTO UNIDAD (id,placa, fecha, foto, estado, ruta_id, tipo, ubicacion, numero_asientos)
  VALUES (0,'JH21786A', RangoFecha('10-JUL-2022', null), EMPTY_BLOB(), 'OPERATIVA', NULL, 'WAWITA', ' ', 0);
INSERT INTO UNIDAD (id,placa, fecha, foto, estado, ruta_id, tipo, ubicacion, numero_asientos)
  VALUES (0,'RT852456', RangoFecha('22-JUN-2022', null), EMPTY_BLOB(), 'NO OPERATIVA', NULL, 'WAWA', ' ', 0);

INSERT INTO UNIDAD (id,placa, fecha, foto, estado, ruta_id, tipo, ubicacion, numero_asientos)
  VALUES (0,'AB85916F', RangoFecha('06-JUN-2022', null), EMPTY_BLOB(), 'OPERATIVA', NULL, 'WAWA', ' ', 0);

  INSERT INTO UNIDAD (id,placa, fecha, foto, estado, ruta_id, tipo, ubicacion, numero_asientos)
  VALUES (0,'BD869FFF', RangoFecha('08-JUN-2022', null), EMPTY_BLOB(), 'OPERATIVA', NULL, 'WAWA', ' ', 0);

    INSERT INTO UNIDAD (id,placa, fecha, foto, estado, ruta_id, tipo, ubicacion, numero_asientos)
  VALUES (0,'AC8GHFFF', RangoFecha('03-JUN-2022', null), EMPTY_BLOB(), 'OPERATIVA', NULL, 'WAWA', ' ', 0);


INSERT INTO CLIENTE (id, datos, FECHA_DESDE, tipo, telefono, genero)
  VALUES (0, DatosPersonales('Alexis Quiros','CEDULA','10059565'),'01-JUL-2022','NATURAL','04125941461','MASCULINO');
INSERT INTO CLIENTE (id, datos, FECHA_DESDE, tipo, telefono, genero)
  VALUES (0, DatosPersonales('Fernando','CEDULA','15452365'),'01-JUL-2022','NATURAL','04125941461','MASCULINO');
INSERT INTO CLIENTE (id, datos, FECHA_DESDE, tipo, telefono, genero)
  VALUES (0, DatosPersonales('Andrea','CEDULA','15454565'),'01-JUL-2022','NATURAL','04125941461','MASCULINO');
INSERT INTO CLIENTE VALUES(0,DatosPersonales('Sergio Capon','CEDULA','26747663'),'10-AUG-2022','NATURAL','04125941461','MASCULINO',NULL);
INSERT INTO CLIENTE VALUES(0,DatosPersonales('Mariah Tacanga','CEDULA','28749638'),'23-MAY-2022','NATURAL','04125941461','FEMENINO',NULL);
INSERT INTO CLIENTE VALUES(0,DatosPersonales('UCAB','RIF','J101295658'),'1-MAY-2022','CORPORATIVO','021244455','MASCULINO',EMPTY_BLOB()) RETURNING FOTO INTO V_TEMP;
INSERT INTO CLIENTE VALUES(0,DatosPersonales('PANA','RIF','J854596981'),'6-MAY-2022','CORPORATIVO','041455555','FEMENINO',EMPTY_BLOB()) RETURNING FOTO INTO V_TEMP;

    INSERT INTO SERVICIOS (id, nombre, descripcion, exclusivo)
  VALUES (0, 'serivicio1', 'a todos lados', 1);
  INSERT INTO SERVICIOS (id, nombre, descripcion, exclusivo)
  VALUES (0, 'serivicio1', 'a todos lados', 0);
  INSERT INTO SERVICIOS (id, nombre, descripcion, exclusivo)
  VALUES (0, 'serivicio1', 'a todos lados', 0);
  INSERT INTO SERVICIOS (id, nombre, descripcion, exclusivo)
  VALUES (0, 'serivicio1', 'a todos lados', 0);
  INSERT INTO SERVICIOS (id, nombre, descripcion, exclusivo)
  VALUES (0, 'serivicio1', 'a todos lados', 0);
  INSERT INTO SERVICIOS (id, nombre, descripcion, exclusivo)
  VALUES (0, 'serivicio1', 'a todos lados', 1);


  INSERT INTO OFRECE (id, servicios_id, unidad_id)
  VALUES (0,2,1);
  INSERT INTO OFRECE (id, servicios_id, unidad_id)
  VALUES (0,1,2);
  INSERT INTO OFRECE (id, servicios_id, unidad_id)
  VALUES (0,3,3);
  INSERT INTO OFRECE (id, servicios_id, unidad_id)
  VALUES (0,4,4);
  INSERT INT OFRECE (id, servicios_id, unidad_id)
  VALUES (0,6,5);
  INSERT INTO OFRECE (id, servicios_id, unidad_id)
  VALUES (0,5,6);

INSERT INTO CONTINGENCIA (id, nombre, descripcion)
  VALUES (0,'lluvia','llueve');

  INSERT INTO CONTINGENCIA (id, nombre, descripcion)
  VALUES (0,'tormenta','llueve');
  INSERT INTO CONTINGENCIA (id, nombre, descripcion)
  VALUES (0,'choque','retraso');
  INSERT INTO CONTINGENCIA (id, nombre, descripcion)
  VALUES (0,'accidentado','retraso');
  INSERT INTO CONTINGENCIA (id, nombre, descripcion)
  VALUES (0,'herido','leve retraso');
INSERT INTO CONTINGENCIA (id, nombre, descripcion)
  VALUES (0,'huecos','retraso');
  INSERT INTO CONTINGENCIA (id, nombre, descripcion)
  VALUES (0,'alcabala','retraso');


INSERT INTO RUTA (id, contingencia_id, nombre)
  VALUES (0,1,'plaza venezuela');
  INSERT INTO RUTA (id, contingencia_id, nombre)
  VALUES (0,1,'caricuao');
  INSERT INTO RUTA (id, contingencia_id, nombre)
  VALUES (0,1,'chacao');
  INSERT INTO RUTA (id, contingencia_id, nombre)
  VALUES (0,1,'Bellas Artes');
  INSERT INTO RUTA (id, contingencia_id, nombre)
  VALUES (0,1,'Los crotijos');
  INSERT INTO RUTA (id, contingencia_id, nombre)
  VALUES (0,1,'redoma');


 INSERT INTO PED (id,nombre,coordenadas)
  VALUES (0,'parada1','14.47, -66.59');

  
 INSERT INTO PED (id,nombre,coordenadas)
  VALUES (0,'parada2','30.47, -66.89');
  
 INSERT INTO PED (id,nombre,coordenadas)
  VALUES (0,'parada3','10.17, -63.69');
  
 INSERT INTO PED (id,nombre,coordenadas)
  VALUES (0,'parada4','10.67, -65.89');
  
 INSERT INTO PED (id,nombre,coordenadas)
  VALUES (0,'parada5','20.47, -66.89');
  
 INSERT INTO PED (id,nombre,coordenadas)
  VALUES (0,'parada6','16.47, -23.89');
  
 INSERT INTO PED (id,nombre,coordenadas)
  VALUES (0,'parada7','10.47, -66.83');


 INSERT INTO RECORRE (id,ruta_id,pos,punto)
  VALUES (0,1,1,1);
 INSERT INTO RECORRE (id,ruta_id,pos,punto)
  VALUES (0,1,2,2);
 INSERT INTO RECORRE (id,ruta_id,pos,punto)
  VALUES (0,1,3,3);
 INSERT INTO RECORRE (id,ruta_id,pos,punto)
  VALUES (0,1,4,4);
 INSERT INTO RECORRE (id,ruta_id,pos,punto)
  VALUES (0,5,4,7);
 INSERT INTO RECORRE (id,ruta_id,pos,punto)
  VALUES (0,6,2,5);



  
INSERT INTO CATEGORIA (id,nombre,foto)
  VALUES (0,'bronce',EMPTY_BLOB());
  
INSERT INTO CATEGORIA (id,nombre,foto)
  VALUES (0,'plata',EMPTY_BLOB());

  
INSERT INTO CATEGORIA (id,nombre,foto)
  VALUES (0,'oro',EMPTY_BLOB());
  




  INSERT INTO PLAN (id,tipo_cliente,tipo_unidad,nombre,caracteristicas,fecha)
  VALUES (0,'natural','Wawa','PLAN1','Caract1', RangoFecha('08-JUN-2022', null));
   INSERT INTO PLAN (id,tipo_cliente,tipo_unidad,nombre,caracteristicas,fecha)
  VALUES (0,'natural','Wawa','PLAN2','Caract2', RangoFecha('02-JUN-2022', null));
   INSERT INTO PLAN (id,tipo_cliente,tipo_unidad,nombre,caracteristicas,fecha)
  VALUES (0,'natural','Wawa','PLAN3','Caract3', RangoFecha('01-JUN-2022', null));
   INSERT INTO PLAN (id,tipo_cliente,tipo_unidad,nombre,caracteristicas,fecha)
  VALUES (0,'natural','Wawa','PLAN4','Caract4', RangoFecha('06-JUN-2022', null));


     INSERT INTO CONTRATA (id,fecha,activo,plan_id,cliente_id)
  VALUES (0,'natural','Wawa','PLAN4','Caract4', RangoFecha('06-JUN-2022', null));

  INSERT INTO RESERVA (id,estado,hora_traslado,costo,calificacion,duracion,puestos,embarque,desembarque,unidad_id,cliente_id)
  Values(0,'ESPERA',RangoFecha('18-JUN-2022', null),100,Calificacion('2','ninguna'),11,23,1,4,1,1);
    INSERT INTO RESERVA (id,estado,hora_traslado,costo,calificacion,duracion,puestos,embarque,desembarque,unidad_id,cliente_id)
  Values(0,'ESPERA',RangoFecha('18-JUN-2022', null),100,Calificacion('2','ninguna'),11,23,1,3,1,2);
    INSERT INTO RESERVA (id,estado,hora_traslado,costo,calificacion,duracion,puestos,embarque,desembarque,unidad_id,cliente_id)
  Values(0,'ESPERA',RangoFecha('18-JUN-2022', null),100,Calificacion('2','ninguna'),11,23,2,4,1,3);
    INSERT INTO RESERVA (id,estado,hora_traslado,costo,calificacion,duracion,puestos,embarque,desembarque,unidad_id,cliente_id)
  Values(0,'ESPERA',RangoFecha('18-JUN-2022', null),100,Calificacion('2','ninguna'),11,23,1,2,1,4);
    INSERT INTO RESERVA (id,estado,hora_traslado,costo,calificacion,duracion,puestos,embarque,desembarque,unidad_id,cliente_id)
  Values(0,'ESPERA',RangoFecha('18-JUN-2022', null),100,Calificacion('2','ninguna'),11,23,1,3,1,5);
    INSERT INTO RESERVA (id,estado,hora_traslado,costo,calificacion,duracion,puestos,embarque,desembarque,unidad_id,cliente_id)
  Values(0,'ESPERA',RangoFecha('18-JUN-2022', null),100,Calificacion('2','ninguna'),11,23,2,3,1,6);

