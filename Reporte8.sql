CREATE OR REPLACE FUNCTION SYSTEM.REPORTE8 (fecha_inicial date, fecha_final date, tipo_unidad VARCHAR2) return sys_refcursor
IS
  prc sys_refcursor;
BEGIN
	IF (fecha_inicial IS NOT NULL AND fecha_final IS NOT NULL AND fecha_inicial < fecha_final) THEN
		OPEN PRC FOR SELECT
          m.fecha.fecha_inicial as "FECHA_DESPERFECTO", u.foto as "FOTO_UNIDAD", u.placa as "PLACA_UNIDAD", u.tipo AS "TIPO_UNIDAD",
          m.desperfectos AS "DESPERFECTOS", m.fecha.fecha_final AS "FECHA_REPARACION", m.observaciones AS "OBSERVACIONES"
        FROM MANTENIMIENTO M
        INNER JOIN UNIDAD U on u.id = m.unidad_id
        WHERE m.desperfectos IS NOT NULL
          and tipo_unidad = u.tipo
          and fecha_inicial <= m.fecha.fecha_inicial
          and fecha_final >= m.fecha.fecha_inicial;
    ELSE
      OPEN PRC FOR SELECT * FROM DUAL;
    END IF;
    return prc;
END;

select SYSTEM.REPORTE8(sysdate-3, sysdate + 2,'WAWA') from dual;
