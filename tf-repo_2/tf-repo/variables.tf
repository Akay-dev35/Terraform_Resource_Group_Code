
variable "subscription_id" {
  type        = string
  description = "Azure subscription ID."
}

variable "default_location" {
  type    = string
  default = "centralindia"
}

variable "default_rg_tags" {
  type    = map(string)
  default = {}
}


variable "resource_groups" {
  description = "Map of resource groups to create. Key = RG name."
  type = map(object({
    location = optional(string)
    tags     = optional(map(string))
  }))
}
