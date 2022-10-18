*&---------------------------------------------------------------------*
*& Report zsql_subquery_msh2c33
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
report zsql_subquery_msh2c33.

data(lo_output) = cl_demo_output=>new(  ).

modify demo_join3 from ( select from demo_join1 as demo1
                         inner join demo_join2 as demo2
                         on demo1~d = demo2~d
                         fields demo1~a, demo1~b,
                                demo2~e, demo2~f ).

select from demo_join3 fields *
into table @data(lt_demo_join3).
if sy-subrc eq 0.
  lo_output->display( lt_demo_join3 ).
endif.
