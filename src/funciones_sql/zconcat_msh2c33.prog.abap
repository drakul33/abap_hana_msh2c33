*&---------------------------------------------------------------------*
*& Report zconcat_msh2c33
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
report zconcat_msh2c33.
*En un programa ejecutable, declarar la variable LV_CHAR de tipo C con una longitud de 6 y asignarle el valor 'LOGALI'.
*Realizar una comprobación que verifique si en la tabla de base de datos estándar DEMO_EXPRESSIONS
*existe el registro con el valor L en la columna ID. Si el registro no existe, insertar en la tabla
*añadiendo los valores 'AABbCDDe' y '123456' en las columnas CHAR1 y CHAR2.
*A continuación, seleccionar el mismo registro con la instrucción SELECT en una estructura declarada
*en línea con @DATA. La estructura debe contener los siguientes componentes:
*- ID (Columna de la tabla)
*- CHAR1 (Columna de la tabla)
*- CHAR2 (Columna de la tabla)
*- CONCAT (La concatenación entre los valores de las columnas CHAR1 y CHAR2)
*- CONCAT_WITH_SPACE (La concatenación entre los valores de las columnas CHAR1 y la variable LV_CHAR separados por dos caracteres de espacio)
*- AMPERSAND (La concatenación entre los valores de las columnas CHAR1, CHAR2, el valor 'HANA-' y el valor de la variable LV_CHAR)


data lv_char type c length  6 value 'LOGALI'.

data(lo_output) = cl_demo_output=>new(  ).


select from zdemo_expression
    fields id,
           char1,
           char2,
           concat( char1, char2 ) as concat,
           concat_with_space( char1, @lv_char, 2 ) as concat2,
           'Hola' && char1 && char2 && 'HANA-' && @lv_char as ampersand
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
