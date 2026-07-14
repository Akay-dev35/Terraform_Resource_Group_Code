# ============================================================
# REQUIRED — environment wiring
# ============================================================

variable "subscription_id" {
  type        = string
  description = "Azure subscription ID."
}

# ============================================================
# OPTIONAL — global defaults used when an RG doesn't override them
# ============================================================

variable "default_location" {
  type    = string
  default = "centralindia"
}

variable "default_rg_tags" {
  type    = map(string)
  default = {}
}

# ============================================================
# THE MAIN INPUT — one entry per resource group
#
# To create another RG, copy one block inside the map in
# terraform.tfvars and give it a new key (the RG name).
# Every field below is OPTIONAL — omit anything you don't
# want to override and it falls back to the defaults above.
# ============================================================

variable "resource_groups" {
  description = "Map of resource groups to create. Key = RG name."
  type = map(object({
    location = optional(string)
    tags     = optional(map(string))
  }))
}
