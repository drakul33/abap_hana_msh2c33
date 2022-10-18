*&---------------------------------------------------------------------*
*& Report zcolumn_esp_msh2c33
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
report zcolumn_esp_msh2c33.

*Crear un programa ejecutable llamado ZCOLUMN_ESP _USUARIOSAP*
*que consulte la tabla “SPFLI”, proyecte los campos “CARRID” y “PERIOD”,
* la información debe filtrarse mediante el campo “FLTIME” cuando este se
*encuentre en el rango de “60” y “500”, el resultado de la proyección debe
*agruparse mediante los dos campos proyectados (“CARRID” y “PERIOD”),
*finalmente los resultados deben ordenarse de manera descendente.


start-of-selection.


  select from spfli
  fields carrid, period ", fltime
  where fltime between 60 and 500
  group by carrid, period ", fltime
  order by carrid descending
  into table @data(gt_result).
  if sy-subrc eq 0.
    cl_demo_output=>display( gt_result ).
  endif.
