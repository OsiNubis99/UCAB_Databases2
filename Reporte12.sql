CREATE OR REPLACE FUNCTION ADMIN.REPORTE12 (fmes VARCHAR2, tcliente VARCHAR2) RETURN SYS_REFCURSOR
IS
  FECHA_MES VARCHAR2(20);
  TIPO_CLIENTE VARCHAR2(20);
  PRC sys_refcursor;
BEGIN
    IF (FMES IS NULL) THEN
        FECHA_MES := '%';
    else
        FECHA_MES := FMES;
    END IF;
    IF (TCLIENTE IS NULL) THEN
        TIPO_CLIENTE := '%';
    else
        TIPO_CLIENTE := TCLIENTE;
    END IF;
    OPEN PRC FOR SELECT
        TO_CHAR(R.FECHAS.fecha_inicial, 'MM YYYY') as "FECHA",
        c.tipo AS "TIPO_CLIENTE",
        r.calificacion.escala AS "ESCALA_ClASIFICACION",
        r.calificacion.observaciones AS "OBSERVACIONES"
      FROM RESERVA R
      INNER JOIN CLIENTE C on r.cliente_id   = c.id
      WHERE R.calificacion.escala is not null
        AND TO_CHAR(r.FECHAS.fecha_inicial, 'MM') LIKE fecha_mes
        AND c.TIPO LIKE tipo_cliente;
    RETURN PRC;
END;

select ADMIN.REPORTE12(null,null) from dual;
