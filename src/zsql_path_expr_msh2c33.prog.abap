*&---------------------------------------------------------------------*
*& Report zsql_path_expr_msh2c33
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
report zsql_path_expr_msh2c33.

select from DEMO_CDS_ASSOC_SCARR
fields carrname,
       \_spfli[ (*) ]-connid as connid, "navegamos a una asociacion con la barra \
       \_spfli[ (*) ]\_sflight[ (*) ]-fldate as fldate,
       \_spfli[ (*) ]\_sairport[ (1) ]-name as name
       where carrid eq 'LH'
       order by carrname, connid, fldate ascending
       into table @data(lt_result) up to 10 rows.

       if sy-subrc eq 0.
         cl_demo_output=>display( lt_result ).
       endif.
