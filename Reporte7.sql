CREATE OR REPLACE FUNCTION SYSTEM.REPORTE7 (finicial DATE DEFAULT SYSDATE, ffinal DATE DEFAULT SYSDATE, tunidad VARCHAR2) return sys_refcursor
IS
  tipo_unidad VARCHAR2(10);
  fecha_inicial DATE;
  fecha_final DATE;
  prc sys_refcursor;
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
            m.fecha.fecha_inicial as "FECHA_MANT", m.fecha.fecha_final as "FECHA_PROX",
            u.foto as "FOTO_UNIDAD", u.placa as "PLACA", u.tipo AS "TIPO_UNIDAD",
            m.observaciones AS "OBSERVACIONES", m.repuestos
        FROM MANTENIMIENTO M
        INNER JOIN UNIDAD U on u.id  = m.unidad_id
        WHERE m.repuestos IS not null
          AND u.tipo LIKE tipo_unidad
          AND fecha_inicial <= M.fecha.fecha_inicial
          and fecha_final >= M.fecha.fecha_inicial;
    ELSE
        OPEN PRC FOR SELECT DUMMY FROM DUAL;
    END IF;
    return prc;
END;

select SYSTEM.REPORTE7(sysdate-5, SYSDATE, 'WAWA') from dual;
