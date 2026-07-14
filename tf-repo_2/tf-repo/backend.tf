terraform {
  backend "azurerm" {
    # Intentionally left blank. Supply real values at init time so
    # this file never has to change per environment:
    #
    #   terraform init \
    #     -backend-config="resource_group_name=tfstate-rg" \
    #     -backend-config="storage_account_name=tfstateXXXXX" \
    #     -backend-config="container_name=tfstate" \
    #     -backend-config="key=vm/terraform.tfstate"
    #
    # or point to a backend.hcl file with -backend-config=backend.hcl
  }
}
