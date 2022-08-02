CREATE OR REPLACE FUNCTION SYSTEM.REPORTE7 (fecha_inicio date, fecha_final DATE, tipo_unidad VARCHAR2) return sys_refcursor
IS
  prc sys_refcursor;
BEGIN
	IF (fecha_inicio IS NOT NULL AND fecha_final IS NOT NULL AND fecha_inicio < fecha_final) THEN
	  OPEN PRC FOR SELECT
          m.fecha.fecha_inicial as "FECHA_MANT", m.fecha.fecha_final as "FECHA_PROX", u.foto as "FOTO_UNIDAD", u.placa as "PLACA", u.tipo AS "TIPO_UNIDAD",
          m.observaciones AS "OBSERVACIONES", m.repuestos
        FROM MANTENIMIENTO M
        INNER JOIN UNIDAD U on u.id  = m.unidad_id
        WHERE m.repuestos IS not null
          AND tipo_unidad = u.tipo
          AND fecha_inicio <= M.fecha.fecha_inicial
          and fecha_final >= M.fecha.fecha_inicial;
    ELSE
      OPEN PRC FOR SELECT * FROM DUAL;
    END IF;
    return prc;
END;

select SYSTEM.REPORTE7(sysdate-5, SYSDATE+1 ,'WAWA') from dual;
