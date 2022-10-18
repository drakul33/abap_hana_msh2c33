@AbapCatalog.sqlViewName: 'ZSQL_01_CDS_C33' 
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Hierarchical data'
define view zsql_cds_01_tree_msh2c33 
  as select from demo_simple_tree
//  association [1..1] to zsql_cds_01_tree_msh2c33 as _tree on $projection.parent = _tree.id 
association [1..*] to zsql_cds_01_tree_msh2c33 as _tree on $projection.parent = _tree.id
{

  key id,
      parent_id as parent,
      name,
      _tree
}
