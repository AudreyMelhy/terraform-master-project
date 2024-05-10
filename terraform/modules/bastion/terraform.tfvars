aws_region                    = "us-east-1"
instance_ami              = "ami-04b70fa74e45c3917"
instance_type             = "t2.micro"
sg_name                       = "test"
instance_name                 = "test"
volume_size              = 10
api_termination = false
key        = "terraform-aws"
allowed_ports = [
  22,
]
tags = {
  id          = "001"
  owner       = "AudreyMelhy"
  environment = "dev"
  resource    = "bastion_module"
  cloudProvider = "aws"
  createdBy = "Terraform"
}
