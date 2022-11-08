# Hashicorp Examples


## Terraform
Examples of using Terraform in azure 

This is for deploying multiple VMs

Example Based on [here](https://github.com/alfonsof/terraform-azure-examples)

Use of an [Element Function](https://developer.hashicorp.com/terraform/language/functions/element)

Use of a Count [Examples here](https://buildvirtual.net/terraform-count-examples/)

Use of [conditions in variables](https://developer.hashicorp.com/terraform/language/expressions/custom-conditions#input-variable-validation)

Use of [operators](https://developer.hashicorp.com/terraform/language/expressions/operators) eg equal to / less than

[variables](https://developer.hashicorp.com/terraform/language/values/variables)

    terraform plan -var-file values.tfvars
    terraform apply -var-file values.tfvars

# ERROR
Expected Error as part of var file which will require you to fix 


![alt text](https://github.com/knowlesy/terraform/blob/main/Azure/Example%205%20Deploy%20VMs%20with%20VAR%20File/error.png?raw=true)

### Note 
This these examples are using azure cli for demonstration purposes only whereas they should be using a Service Principle Name