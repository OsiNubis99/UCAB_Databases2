CREATE OR REPLACE FUNCTION SYSTEM.REPORTE12 (fecha_inicio date, tipo_cliente VARCHAR2) return sys_refcursor
IS
  prc sys_refcursor;
BEGIN
    IF (fecha_inicio IS NOT NULL) THEN
	  OPEN PRC FOR SELECT
          r.fechas.fecha_inicial as "MES", c.tipo AS "TIPO_CLIENTE",
          r.calificacion.escala AS "ESCALA_ClASIFICACION" , r.calificacion.observaciones AS "OBSERVACIONES"
        FROM RESERVA R
        INNER JOIN CLIENTE C on r.cliente_id   = c.id
        WHERE tipo_cliente = c.tipo
          and to_char(fecha_inicio,'mm') = to_char(r.fechas.fecha_inicial,'mm')
          and to_char(fecha_inicio,'yy') = to_char(r.fechas.fecha_inicial,'yy');
    ELSE
      OPEN PRC FOR SELECT * FROM DUAL;
    END IF;
    return prc;
END;

select SYSTEM.REPORTE12(sysdate,'NATURAL') from dual;
