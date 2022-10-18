*&---------------------------------------------------------------------*
*& Report zsql_hier_mult_msh2c33
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
report zsql_hier_mult_msh2c33.

*Crear el programa ejecutable llamado
*ZSQL_HIER_MULT_USUARIOSAP* haciendo uso del CDS
*“DEMO_CDS_PARENT_CHILD_SOURCE” que debe consultar a sus
*múltiples padres comenzando con el “ID” igual a “A”, la consulta debe
*proyectar los campos de “ID”, ”PARENT” y “HIERARCHY_LEVEL”, los
*múltiples padres deben ser “LEAVES ONLY”.


select from hierarchy( source zsql_cds_01_tree_msh2c33
                       child to parent association _tree
                       start where id = 1
                       siblings order by id ascending
                       depth 2  "nos da el nivel de hierarchy padre, padre hijo, abuelo hasta nieto...
                       multiple parents leaves only  "leaves only necesita cardinalidad 1 a n para poder realizar la accion
                      )
                       fields id, parent, name, hierarchy_level
                       into table @data(lt_result)
                       .

cl_demo_output=>display( lt_result ).
