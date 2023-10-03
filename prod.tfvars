cidr           = "172.0.0.0/16"
ami_id         = "ami-09042b2f6d07d164a"
instance_type  = "t2.micro"
subnet_public  = ["172.0.1.0/24", "172.0.2.0/24"]
subnet_private = ["172.0.3.0/24", "172.0.4.0/24"]
region         = "eu-central-1"
az             = ["eu-central-1a", "eu-central-1b", "eu-central-1c"]
server         = "prod"