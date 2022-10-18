*&---------------------------------------------------------------------*
*& Report zgtt_msh2c33
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
report zgtt_msh2c33.

data(lo_output) = cl_demo_output=>new(  ).

insert zemployees_m2c33 from table @( value #( ( employee_id = 5223
                                                 name = 'Hilde'
                                                 last_name = 'Rosas'
                                                 gender = 'M' ) ) ).

select from zemployees_m2c33 fields *
into table @data(lt_result).

delete from zemployees_m2c33. "siempre debe ir o un rollbak work
*rollback work. " no es la mejor practica pero tambien sirve

if sy-subrc eq 0.
  lo_output->display( lt_result ).
endif.
