module "network" {
    source = "./modules/network"
    vpc_cidr = "10.0.0.0/24"
    subnet_cidr = "10.0.0.0/24"
  
}

module "compute" {
    source = "./modules/compute"
    ami = var.ami
    instance_type = "t2.medium"
    subnet_id = module.network.subnet_id
}