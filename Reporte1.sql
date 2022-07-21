CREATE OR REPLACE PROCEDURE REPORTE_12 (prc out sys_refcursor,fecha_inicio date,tipo_cliente VARCHAR2(100))
IS 
BEGIN
    IF ((fechainicio != 'null')) THEN

        OPEN PRC FOR SELECT r.fechas.fecha_inicial  "MES",c.tipo "TIPO_CLIENTE",r.calificacion.escala "ESCALA_ClASIFICACION" ,r.calificacion.observaciones"OBSERVACIONES" 
        FROM RESERVA R
        INNER JOIN CLIENTE C    
        where  r.cliente_id   = c.id 
        and    tipo_cliente = c.tipo
        and to_char(fecha_inicio,'mm') = to_char(r.fechas.fecha_inicial,'mm') and to_char(fecha_inicio,'yy') = to_char(r.fechas.fecha_inicial,'yy')
        


    END IF;
END;

CREATE OR REPLACE PROCEDURE REPORTE_10 (prc out sys_refcursor,fecha_inicio date,tipo_cliente VARCHAR2(100))
IS 
BEGIN
    IF ((fechainicio != 'null')) THEN

        OPEN PRC FOR SELECT p.fechas.fecha_inicial  "MES",p.tipo_cliente "TIPO_CLIENTE",p.nombre "NOMBRE_PLAN" ,COUNT(p.id) "PLANES_CONTRATADOS" 
        FROM PLANES P
        INNER JOIN CLIENTE C    
        where tipo_cliente = p.tipo_cliente
        and to_char(fecha_inicio,'mm') = to_char(p.fechas.fecha_inicial,'mm') and to_char(fecha_inicio,'yy') = to_char(p.fechas.fecha_inicial,'yy')
        


    END IF;
END;




set autoprint on;
VARIABLE MEMORYCURSOR REFCURSOR;
EXECUTE REPORTE_12(:MEMORYCURSOR,DATE '2022-JUN-20');
