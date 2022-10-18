*&---------------------------------------------------------------------*
*& Report zstring_msh2c33
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
report zstring_msh2c33.


data lv_char type c length  6 value 'LOGALI'.
data(gv_offset) = 18.
data GV_DECIMAL type p length 13 decimals 4 value '27.0671'.

data(lo_output) = cl_demo_output=>new(  ).


select from zdemo_expression
    fields id,
           char1,
           char2,
           left( char1, 2 ) as left,
           right( char1, 2 ) as right,
           lpad( char2, 18, '0' ) as lpad,
           rpad( char2, 18, '0' ) as rpad,
           ltrim( char1, 'A' ) as ltrim,
           rtrim( char1, 'A' ) as rtrim,
           instr( char1, 'bC' ) as instr,
           length( char1 ) as length,
           replace( char1, 'DD', '__' ) as replace,
           substring( char1, 3, 2 ) as substring,
           lower( char1 ) as lower,
           upper( char1 ) as upper
           where id = 'L'
    into table @data(lt_result).
    if sy-subrc ne 0.
        delete from zdemo_expression.
        insert zdemo_expression from @( value #( id = 'L'
                                   char1 = 'AABbCDDe'
                                   char2 = '123456' ) ).
    else.
        lo_output->display( lt_result ).
    endif.
