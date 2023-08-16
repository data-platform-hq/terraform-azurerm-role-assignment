resource "azurerm_role_assignment" "this" {
  for_each = {
    for permision in var.azure_rbac : "${permision.key}-${permision.role}" => permision
    if permision.key != null
  }

  scope                = each.value.scope
  role_definition_name = each.value.role
  principal_id         = each.value.principal_id
}
