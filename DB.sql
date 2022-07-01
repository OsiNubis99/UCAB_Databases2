CREATE OR REPLACE
TYPE DatosPersonales AS OBJECT(
  nombre VARCHAR2(40),
  tipo_documento VARCHAR2(15),
  id_documento VARCHAR2(10),
  STATIC FUNCTION validar_documento ( id_documento VARCHAR2, tipo_documento VARCHAR2 ) RETURN VARCHAR2,
  STATIC FUNCTION validar_nombre ( nombre VARCHAR2 ) RETURN VARCHAR2
);

CREATE OR REPLACE
TYPE Costo AS OBJECT(
  monto INT,
  agregado INT,
  STATIC FUNCTION monto_total ( monto INT, agregado INT ) RETURN INT,
  STATIC FUNCTION convertir ( monto INT, agregado INT ) RETURN INT
);

CREATE OR REPLACE
TYPE RangoFecha AS OBJECT(
  fecha_inicial DATE,
  fecha_final DATE,
  STATIC FUNCTION validar_fecha ( fecha DATE ) RETURN VARCHAR2,
  STATIC FUNCTION mover_fecha ( fecha DATE ) RETURN VARCHAR2
);

CREATE OR REPLACE
TYPE Calificacion AS OBJECT(
  escala VARCHAR2(2),
  observaciones VARCHAR2(200),
  STATIC FUNCTION promedio RETURN VARCHAR2,
  STATIC FUNCTION validar_escala ( escala VARCHAR2 ) RETURN VARCHAR2
);

DROP TABLE Contingencia;
CREATE TABLE Contingencia (
  id INT NOT NULL,
  CONSTRAINT contingencia_pk PRIMARY KEY (id),
  nombre VARCHAR2(100) NOT NULL,
  descripcion VARCHAR2(100) NOT NULL
);
CREATE SEQUENCE SEQ_CONTINGENCIA_ID
START WITH 1 INCREMENT BY 1 NOCYCLE;
CREATE OR REPLACE
TRIGGER BI_CONTINGENCIA
BEFORE INSERT ON Contingencia
REFERENCING NEW AS NEW
FOR EACH ROW
  WHEN (NEW.id IS NULL)
BEGIN
    SELECT SEQ_CONTINGENCIA_ID.NEXTVAL INTO :NEW.idRuta FROM dual;
END;

DROP TABLE Ruta;
CREATE TABLE Ruta (
  id INT NOT NULL,
  CONSTRAINT ruta_pk PRIMARY KEY (id),
  contingencia_id INT NOT NULL,
  nombre VARCHAR2(100) NOT NULL,
  FOREIGN KEY (contingencia_id)
    REFERENCES Contingencia(id)
    ON DELETE CASCADE
);
CREATE SEQUENCE SEQ_RUTA_ID
START WITH 1 INCREMENT BY 1 NOCYCLE;
CREATE OR REPLACE
TRIGGER BI_RUTA
BEFORE INSERT ON Ruta
REFERENCING NEW AS NEW
FOR EACH ROW
  WHEN (NEW.id IS NULL)
BEGIN
    SELECT SEQ_RUTA_ID.NEXTVAL INTO :NEW.id FROM dual;
END;

DROP TABLE Unidad;
CREATE TABLE Unidad (
  id INT NOT NULL,
  CONSTRAINT unidad_pk PRIMARY KEY (id),
  ruta_id INT,
  fecha RangoFecha NOT NULL,
  placa VARCHAR2(100) NOT NULL,
  foto BLOB NOT NULL,
  tipo VARCHAR2(100) NOT NULL,
  estado VARCHAR2(100) NOT NULL,
  ubicacion VARCHAR2(100) NOT NULL,
  numero_asientos INT,
  FOREIGN KEY (ruta_id)
    REFERENCES Ruta(id)
    ON DELETE CASCADE
);
CREATE SEQUENCE SEQ_UNIDAD_ID
START WITH 1 INCREMENT BY 1 NOCYCLE;
CREATE OR REPLACE
TRIGGER BI_UNIDAD
BEFORE INSERT ON Unidad
REFERENCING NEW AS NEW
FOR EACH ROW
  WHEN (NEW.id IS NULL)
BEGIN
  SELECT SEQ_UNIDAD_ID.NEXTVAL INTO :NEW.id FROM dual;
END;

DROP TABLE Alianza;
CREATE TABLE Alianza (
  id INT NOT NULL,
  CONSTRAINT alianza_pk PRIMARY KEY (id),
  nombre VARCHAR2(100) NOT NULL,
  fecha RangoFecha NOT NULL,
  descripcion VARCHAR2(100) NOT NULL
);
CREATE SEQUENCE SEQ_ALIANZA_ID
START WITH 1 INCREMENT BY 1 NOCYCLE;
CREATE OR REPLACE
TRIGGER BI_ALIANZA
BEFORE INSERT ON Alianza
REFERENCING NEW AS NEW
FOR EACH ROW
  WHEN (NEW.id IS NULL)
BEGIN
  SELECT SEQ_ALIANZA_ID.NEXTVAL INTO :NEW.id FROM dual;
END;

DROP TABLE Dispone;
CREATE TABLE Dispone (
  id INT NOT NULL,
  CONSTRAINT dispone_pk PRIMARY KEY (id),
  fecha RangoFecha NOT NULL,
  alianza_id INT NOT NULL,
  unidad_id INT NOT NULL,
  FOREIGN KEY (alianza_id)
    REFERENCES Alianza(id)
    ON DELETE CASCADE,
  FOREIGN KEY (unidad_id)
    REFERENCES Unidad(id)
    ON DELETE CASCADE
);
CREATE SEQUENCE SEQ_DISPONE_ID
START WITH 1 INCREMENT BY 1 NOCYCLE;
CREATE OR REPLACE
TRIGGER BI_DISPONE
BEFORE INSERT ON Dispone
FOR EACH ROW
BEGIN
  IF :new.id IS NULL THEN
    SELECT SEQ_DISPONE_ID.NEXTVAL INTO :new.id FROM dual;
  END IF;
END;

DROP TABLE Mantenimiento;
CREATE TABLE Mantenimiento(
  id INT NOT NULL,
  CONSTRAINT mantenimiento_pk PRIMARY KEY (id),
  unidad_id INT NOT NULL,
  observaciones VARCHAR2(100) NOT NULL,
  fecha RangoFecha NOT NULL,
  repuestos VARCHAR2(100),
  desperfectos VARCHAR2(100),
  FOREIGN KEY (unidad_id)
    REFERENCES Unidad(id)
    ON DELETE CASCADE
);
CREATE SEQUENCE SEQ_MANTENIMEINTO_ID
START WITH 1 INCREMENT BY 1 NOCYCLE;
CREATE OR REPLACE
TRIGGER BI_MANTENIMEINTO
BEFORE INSERT ON Mantenimiento
FOR EACH ROW
BEGIN
  IF :new.id IS NULL THEN
    SELECT SEQ_MANTENIMEINTO_ID.NEXTVAL INTO :new.id FROM dual;
  END IF;
END;

DROP TABLE PED;
CREATE TABLE PED (
  id INT NOT NULL,
  CONSTRAINT ped_pk PRIMARY KEY (id),
  nombre VARCHAR2(100) NOT NULL,
  coordenadas VARCHAR2(100) NOT NULL
);
CREATE SEQUENCE SEQ_PED_ID
START WITH 1 INCREMENT BY 1 NOCYCLE;
CREATE OR REPLACE
TRIGGER BI_PED
BEFORE INSERT ON Mantenimiento
FOR EACH ROW
BEGIN
  IF :new.id IS NULL THEN
    SELECT SEQ_PED_ID.NEXTVAL INTO :new.id FROM dual;
  END IF;
END;

DROP TABLE Cliente;
CREATE TABLE Cliente (
  id INT NOT NULL,
  CONSTRAINT cliente_pk PRIMARY KEY (id),
  datos DatosPersonales NOT NULL,
  nombre VARCHAR2(100) NOT NULL,
  fecha_desde DATE NOT NULL,
  logo BLOB,
  cedula INT,
  genero VARCHAR2(100),
  telefono VARCHAR2(100)
);
CREATE SEQUENCE SEQ_CLIENTE_ID
START WITH 1 INCREMENT BY 1 NOCYCLE;
CREATE OR REPLACE
TRIGGER BI_CLIENTE
BEFORE INSERT ON Cliente
FOR EACH ROW
BEGIN
  IF :new.id IS NULL THEN
    SELECT SEQ_CLIENTE_ID.NEXTVAL INTO :new.id FROM dual;
  END IF;
END;

DROP TABLE Reserva;
CREATE TABLE Reserva (
  id INT NOT NULL,
  CONSTRAINT reserva_pk PRIMARY KEY (id),
  estado VARCHAR2(100) NOT NULL,
  hora_traslado DATE NOT NULL,
  costo Costo NOT NULL,
  calificacion Calificacion NOT NULL,
  fechas RangoFecha NOT NULL,
  duracion INT NOT NULL,
  embarque INT NOT NULL,
  desembarque INT NOT NULL,
  unidad_id INT NOT NULL,
  cliente_id INT NOT NULL,
  FOREIGN KEY (unidad_id)
    REFERENCES Unidad(id)
    ON DELETE CASCADE,
  FOREIGN KEY (embarque)
    REFERENCES PED(id)
    ON DELETE CASCADE,
  FOREIGN KEY (desembarque)
    REFERENCES PED(id)
    ON DELETE CASCADE,
  FOREIGN KEY (cliente_id)
    REFERENCES Cliente(id)
    ON DELETE CASCADE
);
CREATE SEQUENCE SEQ_RESERVA_ID
START WITH 1 INCREMENT BY 1 NOCYCLE;
CREATE OR REPLACE
TRIGGER BI_RESERVA
BEFORE INSERT ON Reserva
FOR EACH ROW
BEGIN
  IF :new.id IS NULL THEN
    SELECT SEQ_RESERVA_ID.NEXTVAL INTO :new.id FROM dual;
  END IF;
END;

CREATE TABLE Horario (
  id INT NOT NULL,
  CONSTRAINT horario_pk PRIMARY KEY (id),
  hora_inicio DATE NOT NULL,
  hora_fin DATE NOT NULL,
  dia VARCHAR2(100) NOT NULL
);

CREATE TABLE Cumple(
  id INT NOT NULL,
  CONSTRAINT cumple_pk PRIMARY KEY (id),
  horario_id INT NOT NULL,
  unidad_id INT NOT NULL,
  FOREIGN KEY (horario_id)
    REFERENCES Horario(id)
    ON DELETE CASCADE,
  FOREIGN KEY (unidad_id)
    REFERENCES Unidad(id)
    ON DELETE CASCADE
);

CREATE TABLE Recorre (
  id INT NOT NULL,
  CONSTRAINT recorre_pk PRIMARY KEY (id),
  ruta_id INT NOT NULL,
  salida INT NOT NULL,
  llegada INT NOT NULL,
  FOREIGN KEY (ruta_id)
    REFERENCES Ruta(id)
    ON DELETE CASCADE,
  FOREIGN KEY (salida)
    REFERENCES PED(id)
    ON DELETE CASCADE,
  FOREIGN KEY (llegada)
    REFERENCES PED(id)
    ON DELETE CASCADE
);

CREATE TABLE servicios (
  id INT NOT NULL,
  CONSTRAINT servicios_pk PRIMARY KEY (id),
  nombre VARCHAR2(100) NOT NULL,
  descripcion VARCHAR2(100) NOT NULL,
  exclusivo INT NOT NULL
);

CREATE TABLE Ofrece (
  id INT NOT NULL,
  CONSTRAINT ofrece_pk PRIMARY KEY (id),
  servicios_id INT NOT NULL,
  unidad_id INT NOT NULL,
  FOREIGN KEY (servicios_id)
    REFERENCES Servicios(id)
    ON DELETE CASCADE,
  FOREIGN KEY (unidad_id)
    REFERENCES Unidad(id)
    ON DELETE CASCADE
);

CREATE TABLE Categoria(
  id INT NOT NULL,
  CONSTRAINT categoria_pk PRIMARY KEY (id),
  nommbre VARCHAR2(100) NOT NULL,
  foto BLOB
);

CREATE TABLE Plan(
  id INT NOT NULL,
  CONSTRAINT plan_pk PRIMARY KEY (id),
  tipo_cliente VARCHAR2(100) NOT NULL,
  tipo_unidad VARCHAR2(100) NOT NULL,
  nombre VARCHAR2(100) NOT NULL,
  caracteristicas VARCHAR2(100) NOT NULL,
  fecha RangoFecha NOT NULL,
  categoria_id INT NOT NULL,
  FOREIGN KEY (categoria_id)
    REFERENCES Categoria(id)
    ON DELETE CASCADE
);

CREATE TABLE Contrata(
  id INT NOT NULL,
  CONSTRAINT contrata_pk PRIMARY KEY (id),
  fecha RangoFecha NOT NULL,
  activo VARCHAR2(2) NOT NULL,
  plan_id INT NOT NULL,
  cliente_id INT NOT NULL,
  FOREIGN KEY (plan_id)
    REFERENCES Plan(id)
    ON DELETE CASCADE,
  FOREIGN KEY (cliente_id)
    REFERENCES Cliente(id)
    ON DELETE CASCADE
);


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



CREATE OR REPLACE FUNCTION list_of (required_type_in IN VARCHAR2)
    RETURN SYS_REFCURSOR
IS
    v_ SYS_REFCURSOR;
BEGIN

          OPEN v_ FOR
            SELECT * FROM Unidad  as u WHERE u.tipo=required_type_in;

-- Whit this use, you must not close the cursor.
    RETURN v_;
END list_of;




CREATE OR REPLACE FUNCTION reporteuno (tipo VARCHAR2)
DECLARE
   v_names   SYS_REFCURSOR;
   v_        Unidad%rowtype;
BEGIN
   v_names := list_of(tipo);
   LOOP
      FETCH v_names INTO v_;
      EXIT WHEN v_names%NOTFOUND;
      DBMS_OUTPUT.put_line(v_);
   END LOOP;
   -- here you close it
   CLOSE v_names;
END;