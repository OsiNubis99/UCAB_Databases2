CREATE OR REPLACE PROCEDURE REPORTE_1 (prc out sys_refcursor,fecha_inicio date)
IS 
BEGIN
    IF ((fechainicio != 'null') and (fechafin is NULL) and (destinoturistico is NULL)) THEN

        OPEN PRC FOR SELECT r.fechas.fecha_inicial  "MES",c.tipo "TIPO_CLIENTE",r.calificacion.escala "ESCALA_ClASIFICACION" ,r.calificacion.observaciones"OBSERVACIONES" 
        FROM RESERVA R
        INNER JOIN CLIENTE C
        where  r.cliente_id   = c.id
    END IF;
END;



