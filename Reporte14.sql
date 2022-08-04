CREATE OR REPLACE FUNCTION SYSTEM.REPORTE14 (fecha_inicio date) return sys_refcursor
IS
  prc sys_refcursor;

BEGIN
    IF ((fechainicio != 'null')) THEN
        OPEN PRC FOR SELECT r.fechas.fecha_inicial "MES",u.tipo "TIPO_UNIDAD", c.tipo "TIPO_CLIENTE",r.embarque "PUNTO_EMBARQUE",r.desembarque "PUNTO_DESEMBARQUE"
        FROM RESERVA R
        INNER JOIN CLIENTE C  on r.cliente_id   = c.id
        INNER JOIN UNIDAD U on u.id= r.unidad_id
        where tipo_cliente = p.tipo_cliente
          and to_char(fecha_inicio,'mm') = to_char(p.fechas.fecha_inicial,'mm')
          and to_char(fecha_inicio,'yy') = to_char(p.fechas.fecha_inicial,'yy')
    END IF;
    return prc;
END;

select SYSTEM.REPORTE14(sysdate) from dual;
