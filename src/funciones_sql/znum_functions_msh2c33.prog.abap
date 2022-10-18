*&---------------------------------------------------------------------*
*& Report znum_functions_msh2c33
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
report znum_functions_msh2c33.

*ID (Columna de la tabla)
*- NUM1 (Columna de la tabla)
*- NUM2 (Columna de la tabla)
*- RATIO (La división entre los valores del punto flotante de las columnas NUM1 y NUM2)
*- DIVISION (La división con dos decimales entre las columnas NUM1 y NUM2)
*- DIV (El cociente del dividiendo NUM1 y divisor NUM2)
*- MOD (El resto del dividiendo NUM1 y NUM2)
*- SUM (La suma entre los valores de las columnas NUM1, NUM2 y el valor de una variable GV_OFFSET)
*- ABS (El valor absoluto entre la resta de las columnas NUM1 y NUM2)
*- DECIMAL (El valor de la variable GV_DECIMAL
*- CEIL (El entero más pequeño de la variable GV_DECIMAL)
*- FLOOR (El entero más grande de la variable GV_DECIMAL)
*- ROUND (El valor de la variable GV_DECIMAL redondeado por dos decimales)
data(gv_offset) = 18.
data GV_DECIMAL type p length 13 decimals 4 value '27.0671'.

data(lo_output) = cl_demo_output=>new(  ).


select from zdemo_expression
    fields id,
           num1,
           num2,
*           num1 / num2 as ratio1,
           cast( num1 as fltp ) / cast( num2 as fltp ) as ratio, "convertimos a floting point
           division( num1, num2, 2 ) as division,
           div( num1, num2 ) as div,
           mod( num1, num2 ) as mod,
           num1 + num2 + @gv_offset as sum,
           abs( num1 - num2 ) as abs,
           @gv_decimal as decimal,
           ceil( @gv_decimal ) as ceil,
           floor( @gv_decimal ) as floor,
           round( @gv_decimal, 2 ) as round
           where num1 eq '14' and num2 eq '8'
    into table @data(lt_result).
    if sy-subrc ne 0.
        delete from zdemo_expression.
        insert zdemo_expression from @( value #( id = 1
                                   num1 = 14
                                   num2 = 8 ) ).
    else.
        lo_output->display( lt_result ).
    endif.
