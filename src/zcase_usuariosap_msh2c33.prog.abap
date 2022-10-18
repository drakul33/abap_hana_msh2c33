*&---------------------------------------------------------------------*
*& Report zcase_usuariosap_msh2c33
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
report zcase_usuariosap_msh2c33.


*Crear un programa ejecutable llamado ZCASE_USUARIOSAP* que
*consulte la tabla “DEMO_EXPRESSIONS”, el programa debe realizar
*una consulta que proyecte y agrupe los campos “NUM1” y “NUM2”,
*debe utilizarse la sentencia “CASE” para asignar los valores de
*“Ambos < de 50” cuando “NUM1” y “NUM2” sea menor a 50, “Ambos
*> de 50” cuando “NUM1” y “NUM2” sea mayor a 50, “Ambos = de
*50” cuando “NUM1” y “NUM2” sean igual a 50 y la etiqueta de “Otro”
*para los registros que no cumplan con las condiciones anteriores,
*finalmente se deben ordenar los registros por el resultado de la
*sentencia “CASE”.

*Creo mi clase
class lcl_case definition.
  public section.
    class-methods main.
endclass.

*se crea la implemencacion
class lcl_case implementation.

  method main.

*    data(lv_random) = cl_abap_random_int=>create( seed = conv i( sy-uzeit )
*                      min = 1
*                      max = 100 ).

*    insert demo_expressions from table @( value #( for i = 0 until i > 9
*                                      ( id = i
*                                        num1 = lv_random->get_next( )
*                                        num2 = lv_random->get_next( ) ) ) ).

*control + boton izquiero ver el detalle de la tabla
    select from demo_expressions
            fields num1, num2,
            case
            when num1 > 50 and num2 > 50 then 'Num1 y Num2 mayores a 50'
            when num1 < 50 and num2 < 50 then 'Num1 y Num2 menor a 50'
            when num1 = 50 and num2 = 50 then 'Num1 y Num2 igual a 50'
            else 'Otros'
            end as number order by number
            into table @data(lt_result).
    if sy-subrc eq 0.
      cl_demo_output=>display( lt_result ).
    endif.

  endmethod.

endclass..


start-of-selection.
*imprimimos lo que tenemos en la clase
lcl_case=>main( ).
