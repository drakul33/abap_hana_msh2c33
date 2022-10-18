*&---------------------------------------------------------------------*
*& Report zsql_hints_msh2c33
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
report zsql_hints_msh2c33.

*Crear el programa ZSQL_HINTS_USUARIOSAP que proyecta todos los
*campos de la tabla “SFLIGHTS”, filtrando la información cuando el
*“CARRID” es igual a “AA”, la consulta debe formar mediante HINTS el
*acceso a la capa persistente por “INDEX_SEARCH”.


select from sflights
fields *
where carrid eq 'AA'
%_hints hdb 'INDEX_SEARCH'

into table @data(lt_result)
.

if sy-subrc eq 0.
  cl_demo_output=>display( lt_result ).
endif.
