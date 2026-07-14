output "resource_group_names" {
  value = { for rg_name, rg in module.resource_group : rg_name => rg.name }
}
