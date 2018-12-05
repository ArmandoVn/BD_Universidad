--@Autor(es):       Gutiérrez Castillo Oscar, Valderrama Navarro Armando
--@Fecha creación:  01/12/2018
--@Descripción:     <breve descripción del contenido y propósito del archivo>

--Consulta 1
--Determinar el numero de cursos que imparte cada profesor
--agruparlos por profesor

select c.curso_id, count(p.profesor_id) as numero_profesores
from curso c, profesor p
where c.profesor_id = p.profesor_id
group by p.profesor_id;

-- Consulta 2
-- Determinar los datos del director de tesis de la primer tesis registrada en
-- la base de datos.
select p.*
from profesor p, profesor_carrera pc, tesis t
where pc.profesor_id = p.profesor_id
and t.director_tesis = pc.profesor_id
and t.fecha_registro = (select t.fecha_registro
                        from tesis t
                        where t.fecha_registro )

-- Consulta 3
-- Determinar todos lo profesores que han impartido mas de dos cursos
-- en el semestre X.