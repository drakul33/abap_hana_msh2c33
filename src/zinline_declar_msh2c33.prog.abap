*&---------------------------------------------------------------------*
*& Report zinline_declar_msh2c33
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
report zinline_declar_msh2c33.

*Crear un programa ejecutable llamado ZINLINE_DECLAR_USUARIOSAP* que consulte la tabla “SFLIGHT”
*proyectando todos los campos de la tabla, el almacenamiento de la información debe realizarse
*en una tabla interna creada “inline” dentro de la misma consulta SQL.
start-of-selection.

select from sflight
 fields *
 into table @data(gt_sflight).
  if sy-subrc eq 0.
    cl_demo_output=>display( gt_sflight ).
  endif.

break msh2c33.
*Modificar el programa creado en el punto anterior para que se proyecten únicamente los
*campos “carrid”, “connid”, “price” y “fldate.
select from sflight
      fields carrid, connid, price, fldate
      into table @data(gt_eje2_sflight).
      if sy-subrc eq 0.
    cl_demo_output=>display( gt_eje2_sflight ).
  endif.
