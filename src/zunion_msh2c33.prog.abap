*&---------------------------------------------------------------------*
*& Report zunion_msh2c33
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
report zunion_msh2c33.

*Creo mi clase
class lcl_case definition.
  public section.
    class-methods main.
endclass.

class lcl_case implementation.

  method main.
    data(lo_output) = cl_demo_output=>new(  ).

**productos internos
*    insert zint_msh2c33 from table @( value #(
*    ( product_id = 'P1'
*    description = 'Placa Base Asus ROG Zenith' )
*    ( product_id = 'P2'
*    description = 'Procesador I9-7980XE 2.6Ghz' )
*    ( product_id = 'P3'
*    description = 'Disco duro - SSD Samsung 850 Eco 4TB SATA3' )
*    ( product_id = 'P4'
*    description = 'RAM - G.Skill Trident Z RGB DDR4 PC4-25600 64GB' ) ) ).

**productos externos
*
*    insert zext_msh2c33 from table @( value #(
*    ( product_id = 'P3'
*    description = 'Disco duro - SSD Samsung 850 Eco 4TB SATA3' )
*    ( product_id = 'P4'
*    description = 'RAM - G.Skill Trident Z RGB DDR4 PC4-25600 64GB' )
*    ( product_id = 'P5'
*    description = 'Tarjeta Gráfica - PNY NVIDIA Quadro P6000 24GB GDDR5X' )
*    ( product_id = 'P6'
*    description = 'Fuente de alimentación - EVGA Supernova G2 1600W 80 Plus Gold' ) ) ).



    select from zint_msh2c33
            fields mandt, product_id, description
       union distinct
    select from zext_msh2c33
            fields mandt, product_id, description
*            order by product_id
                        into table @data(lt_result).
    if sy-subrc eq 0.
      lo_output->write( lt_result ).
      lo_output->display(  ).
*      cl_demo_output=>display(  ).
    endif.

*
*    select from zint_msh2c33
*           fields mandt, product_id, description
*      union all
*   select from zext_msh2c33
*           fields mandt, product_id, description
*           order by description
*                       into table @data(lt_result_all)
*                       .
*    if sy-subrc eq 0.
*      lo_output->write( lt_result_all ).
*
*      lo_output->display(  ).
*    endif.
  endmethod.

endclass.

start-of-selection.
*imprimimos lo que tenemos en la clase
  lcl_case=>main( ).
