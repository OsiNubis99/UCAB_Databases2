

create or replace procedure  reporteuno ( fechainicio varchar, fechafin varchar , destinoturistico varchar,  reporte1_cur out sys_refcursor) is 
begin
IF ((fechainicio != 'null') and (fechafin is NULL) and (destinoturistico is NULL)) THEN

open reporte1_cur for
SELECT DISTINCT  p.periodo.fecha_inicio as "Fecha de Creacion",
	p.periodo.fecha_inicio as "Fecha desde",
 	p.periodo.fecha_fin as "Fecha hasta",
	d.NOMBRE_DESTINO as "Destino",
	CASE
	    WHEN 1 = 1 THEN (SELECT rtrim(xmlagg(xmlelement(SERVICIO,' • ' || s.datos.nombre || CHR(13) || CHR(10))).extract('//text()'), CHR(13) || CHR(10))
			     from servicio s, paquete n, destino m
			     where s.id_paquete = n.paquete_id
			     AND n.id_destino = m.destino_id
		             AND TO_CHAR(n.periodo.fecha_inicio,'DD/MM/YYYY') = TO_CHAR(p.periodo.fecha_inicio,'DD/MM/YYYY')
			     AND TO_CHAR(n.periodo.fecha_fin,'DD/MM/YYYY') = TO_CHAR(p.periodo.fecha_fin,'DD/MM/YYYY')
			     AND m.NOMBRE_DESTINO = d.NOMBRE_DESTINO)
           ELSE 'No posee'
        end as "Servicios Ofrecidos"
from paquete p, destino d, servicio  s
where p.id_destino = d.destino_id
and s.id_paquete = p.paquete_id  and ((fechainicio = TO_CHAR(p.periodo.fecha_inicio,'DD/MM/YY')));

END IF;

IF ((fechainicio is NULL) and (fechafin != 'null') and (destinoturistico is NULL)) THEN

open reporte1_cur for
SELECT DISTINCT  p.periodo.fecha_inicio as "Fecha de Creacion",
	p.periodo.fecha_inicio as "Fecha desde",
 	p.periodo.fecha_fin as "Fecha hasta",
	d.NOMBRE_DESTINO as "Destino",
	CASE
	    WHEN 1 = 1 THEN (SELECT rtrim(xmlagg(xmlelement(SERVICIO,' • ' || s.datos.nombre || CHR(13) || CHR(10))).extract('//text()'), CHR(13) || CHR(10))
			     from servicio s, paquete n, destino m
			     where s.id_paquete = n.paquete_id
			     AND n.id_destino = m.destino_id
		             AND TO_CHAR(n.periodo.fecha_inicio,'DD/MM/YYYY') = TO_CHAR(p.periodo.fecha_inicio,'DD/MM/YYYY')
			     AND TO_CHAR(n.periodo.fecha_fin,'DD/MM/YYYY') = TO_CHAR(p.periodo.fecha_fin,'DD/MM/YYYY')
			     AND m.NOMBRE_DESTINO = d.NOMBRE_DESTINO)
           ELSE 'No posee'
        end as "Servicios Ofrecidos"
from paquete p, destino d, servicio  s
where p.id_destino = d.destino_id
and s.id_paquete = p.paquete_id  and ((fechafin = TO_CHAR(p.periodo.fecha_fin,'DD/MM/YY')));

END IF;

IF ((fechainicio is NULL) and (fechafin is NULL) and (destinoturistico != 'null')) THEN

open reporte1_cur for
SELECT DISTINCT  p.periodo.fecha_inicio as "Fecha de Creacion",
	p.periodo.fecha_inicio as "Fecha desde",
 	p.periodo.fecha_fin as "Fecha hasta",
	d.NOMBRE_DESTINO as "Destino",
	CASE
	    WHEN 1 = 1 THEN (SELECT rtrim(xmlagg(xmlelement(SERVICIO,' • ' || s.datos.nombre || CHR(13) || CHR(10))).extract('//text()'), CHR(13) || CHR(10))
			     from servicio s, paquete n, destino m
			     where s.id_paquete = n.paquete_id
			     AND n.id_destino = m.destino_id
		             AND TO_CHAR(n.periodo.fecha_inicio,'DD/MM/YYYY') = TO_CHAR(p.periodo.fecha_inicio,'DD/MM/YYYY')
			     AND TO_CHAR(n.periodo.fecha_fin,'DD/MM/YYYY') = TO_CHAR(p.periodo.fecha_fin,'DD/MM/YYYY')
			     AND m.NOMBRE_DESTINO = d.NOMBRE_DESTINO)
           ELSE 'No posee'
        end as "Servicios Ofrecidos"
from paquete p, destino d, servicio  s
where p.id_destino = d.destino_id
and s.id_paquete = p.paquete_id  and (destinoturistico = d.nombre_destino);

END IF;

IF ((fechainicio != 'null') and (fechafin != 'null') and (destinoturistico != 'null')) THEN

open reporte1_cur for
SELECT DISTINCT  p.periodo.fecha_inicio as "Fecha de Creacion",
	p.periodo.fecha_inicio as "Fecha desde",
 	p.periodo.fecha_fin as "Fecha hasta",
	d.NOMBRE_DESTINO as "Destino",
	CASE
	    WHEN 1 = 1 THEN (SELECT rtrim(xmlagg(xmlelement(SERVICIO,' • ' || s.datos.nombre || CHR(13) || CHR(10))).extract('//text()'), CHR(13) || CHR(10))
			     from servicio s, paquete n, destino m
			     where s.id_paquete = n.paquete_id
			     AND n.id_destino = m.destino_id
		             AND TO_CHAR(n.periodo.fecha_inicio,'DD/MM/YYYY') = TO_CHAR(p.periodo.fecha_inicio,'DD/MM/YYYY')
			     AND TO_CHAR(n.periodo.fecha_fin,'DD/MM/YYYY') = TO_CHAR(p.periodo.fecha_fin,'DD/MM/YYYY')
			     AND m.NOMBRE_DESTINO = d.NOMBRE_DESTINO)
           ELSE 'No posee'
        end as "Servicios Ofrecidos"
from paquete p, destino d, servicio  s
where p.id_destino = d.destino_id
and s.id_paquete = p.paquete_id  and (destinoturistico = d.nombre_destino) and ((fechainicio = TO_CHAR(p.periodo.fecha_inicio,'DD/MM/YY')) or (fechafin = TO_CHAR(p.periodo.fecha_fin,'DD/MM/YY')));

END IF;

IF ((fechainicio != 'null') and (fechafin != 'null') and (destinoturistico is NULL)) THEN

open reporte1_cur for
SELECT DISTINCT  p.periodo.fecha_inicio as "Fecha de Creacion",
	p.periodo.fecha_inicio as "Fecha desde",
 	p.periodo.fecha_fin as "Fecha hasta",
	d.NOMBRE_DESTINO as "Destino",
	CASE
	    WHEN 1 = 1 THEN (SELECT rtrim(xmlagg(xmlelement(SERVICIO,' • ' || s.datos.nombre || CHR(13) || CHR(10))).extract('//text()'), CHR(13) || CHR(10))
			     from servicio s, paquete n, destino m
			     where s.id_paquete = n.paquete_id
			     AND n.id_destino = m.destino_id
		             AND TO_CHAR(n.periodo.fecha_inicio,'DD/MM/YYYY') = TO_CHAR(p.periodo.fecha_inicio,'DD/MM/YYYY')
			     AND TO_CHAR(n.periodo.fecha_fin,'DD/MM/YYYY') = TO_CHAR(p.periodo.fecha_fin,'DD/MM/YYYY')
			     AND m.NOMBRE_DESTINO = d.NOMBRE_DESTINO)
           ELSE 'No posee'
        end as "Servicios Ofrecidos"
from paquete p, destino d, servicio  s
where p.id_destino = d.destino_id
and s.id_paquete = p.paquete_id  and ((fechainicio = TO_CHAR(p.periodo.fecha_inicio,'DD/MM/YY')) or (fechafin = TO_CHAR(p.periodo.fecha_fin,'DD/MM/YY')));

END IF;

IF ((fechainicio != 'null') and (fechafin is NULL) and (destinoturistico != 'null')) THEN

open reporte1_cur for
SELECT DISTINCT  p.periodo.fecha_inicio as "Fecha de Creacion",
	p.periodo.fecha_inicio as "Fecha desde",
 	p.periodo.fecha_fin as "Fecha hasta",
	d.NOMBRE_DESTINO as "Destino",
	CASE
	    WHEN 1 = 1 THEN (SELECT rtrim(xmlagg(xmlelement(SERVICIO,' • ' || s.datos.nombre || CHR(13) || CHR(10))).extract('//text()'), CHR(13) || CHR(10))
			     from servicio s, paquete n, destino m
			     where s.id_paquete = n.paquete_id
			     AND n.id_destino = m.destino_id
		             AND TO_CHAR(n.periodo.fecha_inicio,'DD/MM/YYYY') = TO_CHAR(p.periodo.fecha_inicio,'DD/MM/YYYY')
			     AND TO_CHAR(n.periodo.fecha_fin,'DD/MM/YYYY') = TO_CHAR(p.periodo.fecha_fin,'DD/MM/YYYY')
			     AND m.NOMBRE_DESTINO = d.NOMBRE_DESTINO)
           ELSE 'No posee'
        end as "Servicios Ofrecidos"
from paquete p, destino d, servicio  s
where p.id_destino = d.destino_id
and s.id_paquete = p.paquete_id and (destinoturistico = d.nombre_destino) and ((fechainicio = TO_CHAR(p.periodo.fecha_inicio,'DD/MM/YY')));

END IF;

IF ((fechainicio is NULL ) and (fechafin != 'null') and (destinoturistico != 'null')) THEN

open reporte1_cur for
SELECT DISTINCT  p.periodo.fecha_inicio as "Fecha de Creacion",
	p.periodo.fecha_inicio as "Fecha desde",
 	p.periodo.fecha_fin as "Fecha hasta",
	d.NOMBRE_DESTINO as "Destino",
	CASE
	    WHEN 1 = 1 THEN (SELECT rtrim(xmlagg(xmlelement(SERVICIO,' • ' || s.datos.nombre || CHR(13) || CHR(10))).extract('//text()'), CHR(13) || CHR(10))
			     from servicio s, paquete n, destino m
			     where s.id_paquete = n.paquete_id
			     AND n.id_destino = m.destino_id
		             AND TO_CHAR(n.periodo.fecha_inicio,'DD/MM/YYYY') = TO_CHAR(p.periodo.fecha_inicio,'DD/MM/YYYY')
			     AND TO_CHAR(n.periodo.fecha_fin,'DD/MM/YYYY') = TO_CHAR(p.periodo.fecha_fin,'DD/MM/YYYY')
			     AND m.NOMBRE_DESTINO = d.NOMBRE_DESTINO)
           ELSE 'No posee'
        end as "Servicios Ofrecidos"
from paquete p, destino d, servicio  s
where p.id_destino = d.destino_id
and s.id_paquete = p.paquete_id  and (destinoturistico = d.nombre_destino) and  ((fechafin = TO_CHAR(p.periodo.fecha_fin,'DD/MM/YY')));

END IF;

IF ((fechainicio is NULL) and (fechafin is NULL) and (destinoturistico is NULL)) THEN

open reporte1_cur for
SELECT DISTINCT  p.periodo.fecha_inicio as "Fecha de Creacion",
	p.periodo.fecha_inicio as "Fecha desde",
 	p.periodo.fecha_fin as "Fecha hasta",
	d.NOMBRE_DESTINO as "Destino",
	CASE
	    WHEN 1 = 1 THEN (SELECT rtrim(xmlagg(xmlelement(SERVICIO,' • ' || s.datos.nombre || CHR(13) || CHR(10))).extract('//text()'), CHR(13) || CHR(10))
			     from servicio s, paquete n, destino m
			     where s.id_paquete = n.paquete_id
			     AND n.id_destino = m.destino_id
		             AND TO_CHAR(n.periodo.fecha_inicio,'DD/MM/YYYY') = TO_CHAR(p.periodo.fecha_inicio,'DD/MM/YYYY')
			     AND TO_CHAR(n.periodo.fecha_fin,'DD/MM/YYYY') = TO_CHAR(p.periodo.fecha_fin,'DD/MM/YYYY')
			     AND m.NOMBRE_DESTINO = d.NOMBRE_DESTINO)
           ELSE 'No posee'
        end as "Servicios Ofrecidos"
from paquete p, destino d, servicio  s
where p.id_destino = d.destino_id
and s.id_paquete = p.paquete_id ;

END IF;


end;