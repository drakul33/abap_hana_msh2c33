*&---------------------------------------------------------------------*
*& Report zsql_with_msh2c33
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
report zsql_with_msh2c33.

*Crear un programa ejecutable llamado ZSQL_WITH_USUARIOSAP* que consulte las tablas
*“SCARR”, “SPFLI” como se muestra a continuación.
*SELECT FROM scarr
*FIELDS carrname, CAST( '-' AS CHAR( 4 ) ) AS connid,
*'-' AS cityfrom, '-' AS cityto
*WHERE carrid = 'LH'
*UNION
*SELECT FROM spfli
*FIELDS '-' AS carrname, CAST( connid AS CHAR( 4 ) ) AS connid,
*cityfrom, cityto
*WHERE carrid = 'LH' )
*Hacer uso de la instrucción “WITH” para proyectar los datos de la consulta anterior y
*ordenar de manera descendente el campo “CARRNAME”.

data(lo_output) = cl_demo_output=>new(  ).

with +tmp_table as (
 select from scarr
    fields carrname, cast( '-' as char( 4 ) ) as connid,
    '-' as cityfrom,
    '-' as cityto
    where carrid = 'LH'
union
select from spfli
fields '-' as carrname, cast( connid as char( 4 ) ) as connid,
cityfrom, cityto
where carrid = 'LH' )
select from +tmp_table
fields *
order by carrname descending
into table @data(lt_result).


lo_output->display( lt_result ).


*Creo mi clase
*class lcl_with definition.
*public section.
*  class-methods main.
*endclass.
*
*class lcl_with implementation.
*
*method main.
*
*  data(lo_output) = cl_demo_output=>new(  ).
*
*endmethod.
*
*endclass.

*
*start-of-selection.
*  lcl_with=>main( ).
