CREATE OR REPLACE PROCEDURE SYSTEM.REPORTE15 (prc out sys_refcursor, finicial DATE DEFAULT SYSDATE, ffinal DATE DEFAULT SYSDATE)
IS
  fecha_inicial DATE;
  fecha_final DATE;
BEGIN
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
        TO_CHAR(a.FECHA.fecha_inicial, 'DD-MM-YYYY') as "FECHA",
        a.logo AS "LOGO_EMPRESA",
        a.nombre AS "NOMBRE" ,
        a.descripcion AS "OBSERVACIONES"
      FROM ALIANZA A
      where a.fecha.fecha_final IS NULL
        AND fecha_inicial <= a.fecha.fecha_inicial
        AND fecha_final >= a.fecha.fecha_inicial;
END;

select SYSTEM.REPORTE15(null,null) from dual;
