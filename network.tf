module "lab_network" {
  source         = "./network"
  cidr           = var.cidr
  subnet_public  = var.subnet_public
  subnet_private = var.subnet_private
  az             = var.az
}