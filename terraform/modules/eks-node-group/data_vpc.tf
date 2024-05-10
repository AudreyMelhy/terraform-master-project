data "aws_vpc" "vpc" {
  filter {
    name   = "tag:Name"
    values = ["001-AudreyMelhy-vpc"]
  }
  filter {
    name   = "tag:id"
    values = ["001"]
  }
  filter {
    name   = "tag:owner"
    values = ["AudreyMelhy"]
  }
}

data "aws_subnet" "audrey_private-01" {
  filter {
    name   = "tag:Name"
    values = ["001-AudreyMelhy-private-subnet-1-us-east-1a"] 
  }
  filter {
    name   = "tag:id"
    values = ["001"]
  }
  filter {
    name   = "tag:owner"
    values = ["AudreyMelhy"]
  }
}

data "aws_subnet" "audrey_private-02" {
  filter {
    name   = "tag:Name"
    values = ["001-AudreyMelhy-private-subnet-2-us-east-1b"] 
  }
  filter {
    name   = "tag:id"
    values = ["001"]
  }
  filter {
    name   = "tag:owner"
    values = ["AudreyMelhy"]
  }
}

data "aws_subnet" "audrey_private-03" {
  filter {
    name   = "tag:Name"
    values = ["001-AudreyMelhy-private-subnet-3-us-east-1c"] 
  }
  filter {
    name   = "tag:id"
    values = ["001"]
  }
  filter {
    name   = "tag:owner"
    values = ["AudreyMelhy"]
  }
}
