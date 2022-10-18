*&---------------------------------------------------------------------*
*& Report zsql_cds_param_msh2c33
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
report zsql_cds_param_msh2c33.

*Crear el programa ZSQL_CDS_PARAM_USUARIOSAP que proyecta
*los campos de la CDS "DEMO_CDS_PARAMETERS" obteniendo la
*información con el paso de parámetros:
*• p_distance_l = 1000.
*• p_distance_u = 5000.
*• p_unit = “MI”.

constants: gc_distance_l type s_distance value 1000,
           gc_distance_s type s_distance value 5000,
           gc_unit       type s_distid value 'MI'.

select from DEMO_cds_parameters( p_distance_l = @gc_distance_l,
                                 p_distance_u =  @gc_distance_s,
                                 p_unit = @gc_unit )
                                 fields *
                                 order by carrid, connid
                                 into table @data(lt_result).

    if sy-subrc eq 0.
      cl_demo_output=>display( lt_result ).
    endif.
