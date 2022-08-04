CREATE OR REPLACE FUNCTION SYSTEM.REPORTE14 (finicial DATE DEFAULT SYSDATE, ffinal DATE DEFAULT SYSDATE, tunidad VARCHAR2, tcliente VARCHAR2) return sys_refcursor
IS
  TIPO_CLIENTE VARCHAR2(20);
  tipo_unidad VARCHAR2(20);
  fecha_inicial DATE;
  fecha_final DATE;
  prc sys_refcursor;
BEGIN
    IF (TCLIENTE IS NULL) THEN
        TIPO_CLIENTE := '%';
    else
        TIPO_CLIENTE := TCLIENTE;
    END IF;
    IF (tunidad IS NULL) THEN
        tipo_unidad := '%';
    else
        tipo_unidad := tunidad;
    END IF;
    IF (finicial IS NULL) THEN
        SELECT TO_DATE(1, 'J') INTO FECHA_INICIAL FROM dual;
    else
        fecha_inicial := finicial;
    END IF;
    IF (ffinal IS NULL) THEN
        fecha_final := SYSDATE;
    else
        fecha_final := ffinal;
    END IF;
    OPEN PRC FOR SELECT
      TO_CHAR(R.FECHAS.fecha_inicial, 'DD-MM-YYYY') as "FECHA-RESERVA",
      TO_CHAR(R.hora_traslado, 'DD-MM-YYYY') as "FECHA-TRASLADO",
      TO_CHAR(R.hora_traslado, 'HH:MI') as "HORA-TRASLADO",
      u.tipo "TIPO_UNIDAD",
      c.tipo "TIPO_CLIENTE",
      'Punto embarque ' || r.embarque "PUNTO_EMBARQUE",
      'Punto desembarque ' || r.desembarque "PUNTO_DESEMBARQUE"
    FROM RESERVA R
    INNER JOIN CLIENTE C  on r.cliente_id   = c.id
    INNER JOIN UNIDAD U on u.id= r.unidad_id
    where R.estado = 'ESPERA'
      AND c.TIPO LIKE tipo_cliente
      AND u.TIPO LIKE tipo_unidad
      AND fecha_inicial <= r.fechas.fecha_inicial
      AND fecha_final >= r.fechas.fecha_inicial;
    RETURN PRC;
END;

select SYSTEM.REPORTE14(NULL,NULL,NULL,NULL) from dual;
