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