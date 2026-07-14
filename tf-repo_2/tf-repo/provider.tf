provider "azurerm" {
  subscription_id = var.subscription_id

  features {
    virtual_machine {
      delete_os_disk_on_deletion    = true
      graceful_shutdown              = false
      skip_shutdown_and_force_delete = false
    }
  }
}
