# Hashicorp Examples



## Terraform
Examples of using Terraform in azure 

Using a plan to output your proposed deployment or changes 


    terraform plan -out example9.plan

    terraform apply "example9.plan"

[Documentation](https://developer.hashicorp.com/terraform/cli/commands/plan)

### Note 
This these examples are using azure cli for demonstration purposes only whereas they should be using a Service Principle Name