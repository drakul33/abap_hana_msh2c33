*&---------------------------------------------------------------------*
*& Report ztimezone_msh2c33
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
report ztimezone_msh2c33.

data(lo_output) = cl_demo_output=>new(  ).

select single from zdemo_expression
    fields abap_system_timezone( client = @sy-mandt,
                                 on_error = @sql_abap_system_timezone=>set_to_null ) as system_tz,
           abap_user_timezone( user     = @sy-uname,
                               client   = @sy-mandt,
                               on_error = @sql_abap_user_timezone=>set_to_null ) as user_Tz
                               into @data(wa_result).
    if sy-subrc ne 0.

    else.
        lo_output->display( wa_result ).
    endif.
