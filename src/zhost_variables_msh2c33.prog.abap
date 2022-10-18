*&---------------------------------------------------------------------*
*& Report zhost_variables_msh2c33
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
report zhost_variables_msh2c33.

*que consulte la tabla “SFLIGHT” y realice el guardado de los datos en variables host de tipo estructura,
* puntero y un tipo referenciado, las variables host deben tener una estructura con los campos “CARRID” y “CONNID”,
*el filtrado de los registros debe realizarse sobre el campo “CARRID” cuando es igual a “AA”

data(gv_carrid) = 'AA'.

*estructura
types: begin of ty_sflight,
         carrid type s_carr_id,
         connid type s_conn_id,
       end of ty_sflight,
       tt_sflight type standard table of ty_sflight.

data: lt_sflight type tt_sflight,
      wa_sflight type ty_sflight,   "work area / estructura
*referencia
      lv_sflight like ref to wa_sflight. " Tipo referencia

field-symbols: <fs_sflight> type ty_sflight. " FS


start-of-selection.

  lv_sflight = new #(  ).

  select single from sflight
        fields carrid, connid
*el @ indica que se esta utilizando la variable del host
        where carrid eq @gv_carrid
        into corresponding fields of @wa_sflight.
  if sy-subrc eq 0.

    assign wa_sflight to <fs_sflight>.

    select single from sflight
      fields carrid, connid
  where carrid eq @gv_carrid
  into  @<fs_sflight>.

    if sy-subrc = 0.
*con puntero
      select single from sflight
                  fields carrid,
                         connid
                  where carrid eq @gv_carrid
                  into  @lv_sflight->*.
*next_section crea una seccion que tiene titulo
      cl_demo_output=>new( )->next_section( title = 'Work Area / Estructura wa_sflight:'
                                          )->write( wa_sflight
                            )->next_section( title = 'Field Symbol <fs_sflight>:'
                                          )->write( <fs_sflight>
                            )->next_section( title = 'Referencia lv_sflight->*: '
                                          )->write( lv_sflight->* )->display(  ).
    endif.

  endif.
