CREATE OR REPLACE PROCEDURE SYSTEM.REPORTE10 (prc out sys_refcursor, fmes VARCHAR2, tcliente VARCHAR2)
IS
  FECHA_MES VARCHAR2(20);
  TIPO_CLIENTE VARCHAR2(20);
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
        CAT.foto "CATEGORIA_PLAN",
        CON."NOMBRE_PLAN",
        CON."TIPO_CLIENTE",
        CON."PLANES_CONTRATADOS",
        CON."FECHA"
      from (SELECT
          P.NOMBRE "NOMBRE_PLAN",
          P.categoria_id "CAT_ID",
          CLI.TIPO "TIPO_CLIENTE",
          COUNT(CON.id) "PLANES_CONTRATADOS",
          TO_CHAR(CON.FECHA.fecha_inicial, 'MM-YYYY') "FECHA"
        FROM SYSTEM.CONTRATA CON
        INNER JOIN SYSTEM.CLIENTE CLI on CLI.ID = CON.cliente_ID
        INNER JOIN SYSTEM.PLAN P ON P.ID = CON.PLAN_ID
        WHERE CON.ACTIVO = 1
          AND TO_CHAR(CON.FECHA.fecha_inicial, 'MM') LIKE fecha_mes
          AND CLI.TIPO LIKE tipo_cliente
        GROUP BY P.NOMBRE, P.categoria_id,
          CLI.TIPO, TO_CHAR(CON.FECHA.fecha_inicial, 'MM-YYYY')
      ) CON
      INNER JOIN SYSTEM.CATEGORIA CAT on CAT.id = CON.CAT_ID;
END;
