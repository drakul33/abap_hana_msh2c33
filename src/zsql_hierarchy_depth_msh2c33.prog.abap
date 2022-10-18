*&---------------------------------------------------------------------*
*& Report zsql_hierarchy_depth_msh2c33
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
report zsql_hierarchy_depth_msh2c33.


select from hierarchy( source zsql_cds_01_tree_msh2c33
                       child to parent association _tree
                       start where id = 1
                       siblings order by id ascending
                       depth 2 ) "nos da el nivel de hierarchy padre, padre hijo, abuelo hasta nieto...
                       fields id, parent, name, hierarchy_level
                       into table @data(lt_result)
                       .

cl_demo_output=>display( lt_result ).
