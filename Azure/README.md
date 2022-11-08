# Hashicorp Examples


## Terraform
Examples of using Terraform in azure 

see tf.ps1 for how to login commands etc


### Note 
This these examples are using azure cli for demonstration purposes only whereas they should be using a Service Principle Name


[MS Getting Startd Azure](https://docs.microsoft.com/en-us/azure/developer/terraform/get-started-windows-powershell?tabs=bash)

[Terraform Azure Provider](https://registry.terraform.io/providers/hashicorp/azurerm/2.99.0/docs?utm_content=documentHover&utm_medium=Visual+Studio+Code&utm_source=terraform-ls)

#Powershell CLI Login

    az login -t "XYZ"

    az account set -s “########”

    az account list --output table

