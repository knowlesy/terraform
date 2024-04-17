# Hashicorp Examples

## Terraform
Examples of using Terraform

Study Material

-[Using Terraform with Azure](https://youtu.be/JKVkblsp3cM)

-[how to pass the hashicorp certified: terraform associate exam in 2022](https://youtu.be/R6tVMpNtvQo)

-[Beginners Tutorial to Terraform with Azure](https://www.youtube.com/watch?v=gyZdCzdkSY4)



## Commands

[initialise](https://www.terraform.io/cli/commands/init)

    terraform init 

[format script](https://www.terraform.io/cli/commands/fmt)
    
    terraform fmt 

[Validate](https://www.terraform.io/cli/commands/validate)

    terraform validate

[plan](https://www.terraform.io/cli/commands/plan)

    terraform plan

[deploy the config](https://www.terraform.io/cli/commands/apply)

    terraform apply
    terraform apply -auto-approve

[destroy](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/aws-destroy)

    terraform plan -destroy
    terraform apply -destroy
    terraform apply -destroy -auto-approve

[variables](https://developer.hashicorp.com/terraform/language/values/variables)

    terraform plan -var-file values.tfvars
    terraform apply -var-file values.tfvars
    