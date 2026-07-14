output "resource_group_ids" {
  value = { for k, v in module.resource_group : k => v.id }
}

output "resource_group_names" {
  value = { for k, v in module.resource_group : k => v.name }
}
