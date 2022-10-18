*&---------------------------------------------------------------------*
*& Report zdates_msh2c33
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
report zdates_msh2c33.

data lv_char type c length  6 value 'LOGALI'.
data(gv_offset) = 18.
data GV_DECIMAL type p length 13 decimals 4 value '27.0671'.

data(lo_output) = cl_demo_output=>new(  ).


select from zdemo_expression
    fields id,
           dats1,
           dats2,
           dats_is_valid( dats1 ) as valid,
           dats_days_between( dats1, dats2 ) as day_between,
           dats_add_days( dats1, 30 ) as add_days,
           dats_add_months( dats1, -2 ) as dats_add_months
           where id = 'F'
    into table @data(lt_result).
    if sy-subrc ne 0.
        delete from zdemo_expression.
        insert zdemo_expression from @( value #( id = 'F'
                                   dats1 = '20230329'
                                   dats2 = '20250329' ) ).
    else.
        lo_output->display( lt_result ).
    endif.
