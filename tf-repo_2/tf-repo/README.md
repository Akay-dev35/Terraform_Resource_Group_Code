# tf-repo

Reusable Terraform for Azure resource groups. Add more RGs by editing a
map — no copy-pasting resource blocks.

## Structure

```
tf-repo/
├── main.tf                    # calls the module once per RG (for_each)
├── output.tf                  # outputs, keyed by RG name
├── provider.tf                # azurerm provider config
├── terraform.tf                # terraform block + required_providers
├── variables.tf                # required inputs + OPTIONAL values/defaults
├── locals.tf                   # merges each RG's overrides with the defaults
├── backend.tf                  # remote state config (filled in at init time)
├── terraform.tfvars.example    # copy to terraform.tfvars and edit
├── README.md
└── modules/
    └── resource_group/
        ├── main.tf
        ├── variables.tf
        ├── output.tf
        └── versions.tf
```

## How to add resource groups

1. Copy `terraform.tfvars.example` to `terraform.tfvars`.
2. Fill in `subscription_id`.
3. In the `resource_groups` map, add one block per RG using the RG name as
   the key. `location` and `tags` are both optional and fall back to
   `default_location` / `default_rg_tags`.

```hcl
resource_groups = {
  "rg-prod-network" = {}
}
```

That's it — no changes needed anywhere else to add another RG.

## Usage

```bash
terraform init -backend-config="resource_group_name=tfstate-rg" \
                -backend-config="storage_account_name=tfstateXXXXX" \
                -backend-config="container_name=tfstate" \
                -backend-config="key=rg/terraform.tfstate"
terraform plan
terraform apply
```
