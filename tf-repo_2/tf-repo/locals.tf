locals {
  resource_groups = {
    for name, rg in var.resource_groups : name => {
      location = coalesce(rg.location, var.default_location)
      tags     = merge(var.default_rg_tags, coalesce(rg.tags, {}))
    }
  }
}
