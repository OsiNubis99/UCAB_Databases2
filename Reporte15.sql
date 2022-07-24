CREATE OR REPLACE FUNCTION SYSTEM.REPORTE15 (fecha_inicio date) return sys_refcursor
IS
  prc sys_refcursor;
BEGIN
    IF (fecha_inicio IS NOT NULL) THEN
	  OPEN PRC FOR SELECT
          a.fecha.fecha_inicial as "MES", a.tipo AS "LOGO_EMPRESA",
          a.nombre AS "NOMBRE" , a.descripcion AS "OBSERVACIONES"
        FROM ALIANZA A
      OPEN PRC FOR SELECT * FROM DUAL;
    END IF;
    return prc;
END;

select SYSTEM.REPORTE15(sysdate) from dual;