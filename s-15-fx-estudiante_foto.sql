--@Autor(es):       Gutiérrez Castillo Oscar, Valderrama Navarro Armando
--@Fecha creación:  01/12/2018
--@Descripción:     <breve descripción del contenido y propósito del archivo>
create or replace function estudiante_foto(
    v_estudiante_id number)
    return blob;
is
    v_estudiante_fotografia blob;
begin
    select e.fotografia into v_estudiante_fotografia
    from estudiante e
    where e.estudiante_id = v_estudiante_id;
    return v_estudiante_fotografia;
end;
/