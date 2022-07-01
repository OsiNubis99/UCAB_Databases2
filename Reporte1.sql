
CREATE TABLE Wawa (
idWawa NUMBER PRIMARY KEY,
tipo VARCHAR(6),
capacidad NUMBER,
asientos_ocupados NUMBER
);


INSERT INTO Wawa VALUES (1, 'Wawita', NULL, 0);
INSERT INTO Wawa VALUES (2, 'Wawa', NULL, 0);
INSERT INTO Wawa VALUES (3, 'Wawita', NULL, 0);
INSERT INTO Wawa VALUES (4, 'Wawa', NULL, 0);
INSERT INTO Wawa VALUES (5, 'Wawa', NULL, 0);
INSERT INTO Wawa VALUES (6, 'Wawa', NULL, 0);
INSERT INTO Wawa VALUES (7, 'Wawita', NULL, 0);
INSERT INTO Wawa VALUES (8, 'Wawa', NULL, 0);
INSERT INTO Wawa VALUES (9, 'Wawita', NULL, 0);
INSERT INTO Wawa VALUES (10, 'Wawita', NULL, 0);





create or replace procedure  reporteuno (tipo Unidad.tipo%type) is 
begin
unidades Unidad%rowtype;

SELECT u.* INTO unidades from Unidad u  Where u.tipo= tipo;


for unidades in (SELECT u.* from Unidad u  Where u.tipo= tipo;)
loop

dbms_output.put_line();

end loop;

end;




create or replace reportedos()is 
begin

end;