data "aws_vpc" "audrey_vpc" {
  filter {
    name   = "tag:Name"
    values = ["001-AudreyMelhy-vpc"]
  }
  filter {
    name   = "tag:owner"
    values = ["AudreyMelhy"]
  }
  filter {
    name   = "tag:id"
    values = ["001"]
  }
}

data "aws_subnet" "bastion_sub_pub" {
  filter {
    name   = "tag:Name"
    values = ["001-AudreyMelhy-public-subnet-1-us-east-1a"]
  }
  filter {
    name   = "tag:owner"
    values = ["AudreyMelhy"]
  }
  filter {
    name   = "tag:id"
    values = ["001"]
  }
}
