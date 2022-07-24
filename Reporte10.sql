
CREATE OR  REPLACE FUNCTION SYSTEM.REPORTE10 (prc out sys_refcursor,fecha_inicio date,tipo_cliente VARCHAR2(100))
IS
BEGIN
    IF ((fechainicio != 'null')) THEN""
        OPEN PRC FOR SELECT p.fechas.fecha_inicial  "MES",h.foto "CATEGORIA_PLAN",p.tipo_cliente "TIPO_CLIENTE",p.nombre "NOMBRE_PLAN" ,COUNT(p.id) "PLANES_CONTRATADOS"
        FROM PLANES P
        INNER JOIN CLIENTE C
        on tipo_cliente = p.tipo_cliente
        INNER JOIN CATEGORITA H
        on h.id = p.categoria_id
        WHERE to_char(fecha_inicio,'mm') = to_char(p.fechas.fecha_inicial,'mm') and to_char(fecha_inicio,'yy') = to_char(p.fechas.fecha_inicial,'yy')
    END IF;
END;

set autoprint on;
VARIABLE MEMORYCURSOR REFCURSOR;
EXECUTE REPORTE_12(:MEMORYCURSOR,DATE '2022-JUN-20');


select SYSTEM.REPORTE12(sysdate,'NATURAL') from dual;
