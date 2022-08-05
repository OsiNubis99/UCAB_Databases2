CREATE role administrador_role;
CREATE role desarrollador_role;
CREATE role director_role;

CREATE role gerente_finanzas_role;
CREATE role gerente_viajes_role;
CREATE role gerente_auditoria_role;

CREATE role empleado_finanzas_role;
CREATE role empleado_viajes_role;
CREATE role empleado_auditoria_role;

CREATE role reporte_role;
CREATE role cliente_role;

CREATE USER administrador IDENTIFIED BY administrador;
CREATE USER desarrollador IDENTIFIED BY desarrollador;
CREATE USER director IDENTIFIED BY director;
CREATE USER gerente_finanzas IDENTIFIED BY gerente;
CREATE USER gerente_viajes IDENTIFIED BY gerente;
CREATE USER gerente_auditoria IDENTIFIED BY gerente;
CREATE USER empleado_finanzas IDENTIFIED BY empleado;
CREATE USER empleado_viajes IDENTIFIED BY empleado;
CREATE USER empleado_auditoria IDENTIFIED BY empleado;
CREATE USER cliente IDENTIFIED BY cliente;
CREATE USER reporte IDENTIFIED BY reporte;

GRANT ALL PRIVILEGES TO administrador_role;
GRANT administrador_role TO administrador;

GRANT CREATE TABLE,CREATE ROLE,CREATE USER,DROP USER,CREATE PROCEDURE,CREATE TRIGGER,CREATE VIEW,CREATE SEQUENCE,CREATE SESSION TO desarrollador_role;
GRANT EXECUTE ANY PROCEDURE TO desarrollador_role;
GRANT UPDATE ANY TABLE, SELECT ANY TABLE, INSERT ANY TABLE, DELETE ANY TABLE TO desarrollador_role;
GRANT desarrollador_role TO desarrollador;

GRANT CREATE SESSION TO director_role;
GRANT UPDATE ANY TABLE, SELECT ANY TABLE, INSERT ANY TABLE TO director_role;
GRANT director_role TO director;


GRANT CREATE SESSION TO gerente_finanzas_role;
GRANT UPDATE,SELECT , INSERT ON CATEGORIA TO gerente_finanzas_role;
GRANT UPDATE,SELECT , INSERT ON PLAN TO gerente_finanzas_role;
GRANT UPDATE,SELECT , INSERT ON CONTRATA TO gerente_finanzas_role;
GRANT SELECT ON CLIENTE TO gerente_finanzas_role;
GRANT SELECT ON RESERVA TO gerente_finanzas_role;
GRANT SELECT ON UNIDAD TO gerente_finanzas_role;
GRANT SELECT ON CUMPLE TO gerente_finanzas_role;
GRANT SELECT ON HORARIO TO gerente_finanzas_role;
GRANT gerente_finanzas_role TO gerente_finanzas;

GRANT CREATE SESSION TO empleado_finanzas_role;
GRANT SELECT ON CATEGORIA TO empleado_finanzas_role;
GRANT SELECT ON PLAN TO empleado_finanzas_role;
GRANT SELECT,UPDATE(activo) ON CONTRATA TO empleado_finanzas_role;
GRANT SELECT ON CLIENTE TO empleado_finanzas_role;
GRANT SELECT ON RESERVA TO empleado_finanzas_role;
GRANT SELECT ON UNIDAD TO empleado_finanzas_role;
GRANT SELECT ON CUMPLE TO empleado_finanzas_role;
GRANT SELECT ON HORARIO TO empleado_finanzas_role;
GRANT empleado_finanzas_role TO empleado_finanzas;

GRANT CREATE SESSION TO gerente_viajes_role;
GRANT UPDATE,SELECT , INSERT ON RESERVA TO gerente_viajes_role;
GRANT UPDATE,SELECT , INSERT ON UNIDAD TO gerente_viajes_role;
GRANT UPDATE,SELECT , INSERT ON CLIENTE TO gerente_viajes_role;
GRANT UPDATE,SELECT , INSERT ON RUTA TO gerente_viajes_role;
GRANT UPDATE,SELECT , INSERT ON CONTINGENCIA TO gerente_viajes_role;
GRANT UPDATE,SELECT , INSERT ON PED TO gerente_viajes_role;
GRANT UPDATE,SELECT , INSERT ON RECORRE TO gerente_viajes_role;
GRANT UPDATE,SELECT , INSERT ON DISPONE TO gerente_viajes_role;
GRANT UPDATE,SELECT , INSERT ON ALIANZA TO gerente_viajes_role;
GRANT UPDATE,SELECT , INSERT ON CUMPLE TO gerente_viajes_role;
GRANT UPDATE,SELECT , INSERT ON HORARIO TO gerente_viajes_role;
GRANT UPDATE,SELECT , INSERT ON OFRECE TO gerente_viajes_role;
GRANT UPDATE,SELECT , INSERT ON SERVICIOS TO gerente_viajes_role;
GRANT gerente_viajes_role TO gerente_viajes;

GRANT CREATE SESSION TO empleado_viajes_role;
GRANT UPDATE,SELECT , INSERT ON RESERVA TO empleado_viajes_role;
GRANT UPDATE,SELECT ON UNIDAD TO empleado_viajes_role;
GRANT SELECT ON CLIENTE TO empleado_viajes_role;
GRANT SELECT ON RUTA TO empleado_viajes_role;
GRANT SELECT ON CONTINGENCIA TO empleado_viajes_role;
GRANT SELECT ON PED TO empleado_viajes_role;
GRANT SELECT ON RECORRE TO empleado_viajes_role;
GRANT SELECT,INSERT ON DISPONE TO empleado_viajes_role;
GRANT SELECT ON ALIANZA TO empleado_viajes_role;
GRANT UPDATE,SELECT , INSERT ON CUMPLE TO empleado_viajes_role;
GRANT UPDATE,SELECT , INSERT ON HORARIO TO empleado_viajes_role;
GRANT SELECT , INSERT ON OFRECE TO empleado_viajes_role;
GRANT SELECT ON SERVICIOS TO empleado_viajes_role;
GRANT empleado_viajes_role TO empleado_viajes;

GRANT CREATE SESSION TO gerente_auditoria_role;
GRANT UPDATE,SELECT , INSERT ON MANTENIMIENTO TO gerente_auditoria_role;
GRANT UPDATE,SELECT ON UNIDAD TO gerente_auditoria_role;
GRANT gerente_auditoria_role TO gerente_auditoria;

GRANT CREATE SESSION TO empleado_auditoria_role;
GRANT UPDATE,SELECT , INSERT ON MANTENIMIENTO TO empleado_auditoria_role;
GRANT UPDATE(estado_unidad),SELECT ON UNIDAD TO empleado_auditoria_role;
GRANT empleado_auditoria_role TO empleado_auditoria;

GRANT CREATE SESSION TO reporte_role;
GRANT SELECT ANY TABLE TO reporte_role;
GRANT EXECUTE ANY PROCEDURE TO reporte_role;
GRANT reporte_role TO reporte;

GRANT CREATE SESSION TO cliente_role;
GRANT EXECUTE ANY PROCEDURE TO cliente_role;
GRANT cliente_role TO cliente;
