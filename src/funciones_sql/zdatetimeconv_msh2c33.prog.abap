*&---------------------------------------------------------------------*
*& Report zdatetimeconv_msh2c33
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
report zdatetimeconv_msh2c33.

data lv_tzone type timezone.

call function 'GET_SYSTEM_TIMEZONE'
  importing
    timezone            = lv_tzone
  exceptions
    customizing_missing = 1
    others              = 2.
if sy-subrc <> 0.
* message id sy-msgid type sy-msgty number sy-msgno
*   with sy-msgv1 sy-msgv2 sy-msgv3 sy-msgv4.
endif.


data(lo_output) = cl_demo_output=>new(  ).


select single from zdemo_expression
    fields tstmp_current_utctimestamp(  ) as current_utc,
           tstmp_to_dats( tstmp = tstmp_current_utctimestamp(  ),
                          tzone = @lv_tzone,
                          client = @sy-mandt,
                          on_error = @sql_tstmp_to_dats=>set_to_null ) as to_dats,
           tstmp_to_tims( tstmp = tstmp_current_utctimestamp(  ),
                          tzone = @lv_tzone,
                          client = @sy-mandt,
                          on_error = @sql_tstmp_to_tims=>set_to_null ) as to_tims,
           tstmp_to_dst( tstmp = tstmp_current_utctimestamp(  ),
                          tzone = @lv_tzone,
                          client = @sy-mandt,
                          on_error = @sql_tstmp_to_dst=>set_to_null ) as to_dst,
           dats_tims_to_tstmp( date = dats1,
                               time = tims1,
                               tzone = @lv_tzone,
                               client = @sy-mandt,
                               on_error = @sql_dats_tims_to_tstmp=>set_to_null ) as to_tstmp
           where id = 'H'
        into @data(wa_result).
if sy-subrc ne 0.
  delete from zdemo_expression.
  insert zdemo_expression from @( value #( id = 'H'
                             dats1 = '20221012'
                             tims1 = '103040' ) ).
else.
  lo_output->display( wa_result ).
endif.
