#https://docs.microsoft.com/en-us/azure/developer/terraform/get-started-windows-powershell?tabs=bash
#https://registry.terraform.io/providers/hashicorp/azurerm/2.99.0/docs?utm_content=documentHover&utm_medium=Visual+Studio+Code&utm_source=terraform-ls

az login

az account set -s “########”

cd c:\temp

#initialise https://www.terraform.io/cli/commands/init
terraform init
#format script https://www.terraform.io/cli/commands/fmt
terraform fmt 
#validate  https://www.terraform.io/cli/commands/validate
terraform validate
#plan a whatif https://www.terraform.io/cli/commands/plan
terraform plan
#deploy the config https://www.terraform.io/cli/commands/apply
terraform apply