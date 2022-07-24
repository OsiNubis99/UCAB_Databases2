CREATE OR REPLACE FUNCTION SYSTEM.REPORTE7 (fecha_inicio date, tipo_unidad VARCHAR2) return sys_refcursor
IS
  prc sys_refcursor;
BEGIN
    IF (fecha_inicio IS NOT NULL) THEN
	  OPEN PRC FOR SELECT
          r.fecha.fecha_inicial as "FECHA_UNIDAD",u.logo as "FOTO_UNIDAD", u.tipo AS "TIPO_UNIDAD",
          r.calificacion.escala AS "ESCALA_ClASIFICACION" , u.desperfectos AS "OBSERVACIONES"
        FROM MANTENIMIENTO M
        INNER JOIN UNIDAD U on u.id  = m.unidad_id
        WHERE tipo_unidad = u.tipo
          and to_char(fecha_inicio,'mm') = to_char(r.fecha.fecha_inicial,'mm')
          and to_char(fecha_inicio,'yy') = to_char(r.fecha.fecha_inicial,'yy');
    ELSE
      OPEN PRC FOR SELECT * FROM DUAL;
    END IF;
    return prc;
END;

select SYSTEM.REPORTE7(sysdate,'WAWA') from dual;
