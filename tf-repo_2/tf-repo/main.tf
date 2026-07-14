module "resource_group" {
  source   = "./modules/resource_group"
  for_each = local.resource_groups

  name     = each.key
  location = each.value.location
  tags     = each.value.tags
}
