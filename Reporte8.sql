CREATE OR REPLACE PROCEDURE SYSTEM.REPORTE8 (prc out sys_refcursor, finicial DATE, ffinal DATE, tunidad VARCHAR2)
IS
  tipo_unidad VARCHAR2(10);
  fecha_inicial DATE;
  fecha_final DATE;
BEGIN
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
    IF (fecha_inicial <= fecha_final) THEN
        OPEN PRC FOR SELECT
            m.fecha.fecha_inicial as "FECHA_DESPERFECTO", u.foto as "FOTO_UNIDAD", u.placa as "PLACA_UNIDAD", u.tipo AS "TIPO_UNIDAD",
            m.desperfectos AS "DESPERFECTOS", m.fecha.fecha_final AS "FECHA_REPARACION", m.observaciones AS "OBSERVACIONES"
        FROM MANTENIMIENTO M
        INNER JOIN UNIDAD U on u.id  = m.unidad_id
        WHERE m.desperfectos IS NOT NULL
          AND u.tipo LIKE tipo_unidad
          AND fecha_inicial <= M.fecha.fecha_inicial
          and fecha_final >= M.fecha.fecha_inicial;
    ELSE
        OPEN PRC FOR SELECT DUMMY FROM DUAL;
    END IF;
END;
