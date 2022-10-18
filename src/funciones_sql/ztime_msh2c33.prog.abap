*&---------------------------------------------------------------------*
*& Report ztime_msh2c33
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
report ztime_msh2c33.

data lv_char type c length  6 value 'LOGALI'.
data(gv_seconds) = 3600.
get time stamp field data(lv_timestamp).

data(lo_output) = cl_demo_output=>new(  ).

      delete from zdemo_expression.
        insert zdemo_expression from @( value #( id = 'F'
                                   num1 = gv_seconds
                                   timestamp1 = lv_timestamp ) ).


try.
"tstmp_current_utctimestamp funcion que devuelve el timestamp actual
select from zdemo_expression
    fields id,
           num1,
           timestamp1,
           tstmp_is_valid( timestamp1 ) as valid,
           tstmp_seconds_between( tstmp1 = tstmp_current_utctimestamp(  ),
                                  tstmp2 = tstmp_add_seconds( tstmp = timestamp1,
                                                              seconds = cast( num1 as dec( 15,0 ) ),
                                                              on_error = @sql_tstmp_add_seconds=>fail ), "primer parametro del between
                                  on_error = @sql_tstmp_seconds_between=>fail ) as difference
    where id = 'F'
    into table @data(lt_result).

    catch cx_sy_open_sql_db into data(gx_sql_db).
    lo_output->display( gx_sql_db->get_longtext(  ) ).

    endtry.

    lo_output->display( lt_result ).
