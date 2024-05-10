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

data "aws_subnet" "audrey_public-01" {
  filter {
    name   = "tag:Name"
    values = ["001-AudreyMelhy-public-subnet-1-us-east-1a"] 
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

data "aws_subnet" "audrey_public-02" {
  filter {
    name   = "tag:Name"
    values = ["001-AudreyMelhy-public-subnet-2-us-east-1b"] 
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

data "aws_subnet" "audrey_public-03" {
  filter {
    name   = "tag:Name"
    values = ["001-AudreyMelhy-public-subnet-3-us-east-1c"] 
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
