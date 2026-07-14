# tf-repo

Reusable Terraform for Azure resource groups. Add more RGs by editing a
map

## Structure

```
tf-repo/
main.tf                    --> calls the module once per RG (for_each)
output.tf                  --> outputs, keyed by RG name
provider.tf                --> azurerm provider config
terraform.tf               --> terraform block + required_providers
variables.tf               --> required inputs + OPTIONAL values/defaults
locals.tf                  --> merges each RG's overrides with the defaults
backend.tf                 --> remote state config (filled in at init time)
terraform.tfvars           -->  copy to terraform.tfvars and edit
README.md
modules/
     resource_group/
     main.tf
     variables.tf
     output.tf
     versions.tf
```

## How to add resource groups

1. Copy `terraform.tfvars` to `terraform.tfvars`.
2. Fill in `subscription_id`.
3. In the `resource_groups` map, add one block per RG using the RG name as
   the key. `location` and `tags` are both optional and fall back to
   `default_location` / `default_rg_tags`.


```

That's it — no changes needed anywhere else to add another RG.

## Usage

```
terraform init 
terraform plan
terraform apply
```
