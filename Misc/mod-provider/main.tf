resource "random_pet" "server" {

}



module "subnet_addrs" {
  source = "hashicorp/subnets/cidr"

  base_cidr_block = var.test
  networks = [
    {
      name     = random_pet.server.id
      new_bits = 8
    },
  ]
}

output "TestNetworkName" {
  value = module.subnet_addrs.networks
}