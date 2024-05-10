data "aws_security_group" "bastion_sg" {
  filter {
    name   = "tag:Name"
    values = ["001-dev-bastion-sg"]
  }
  filter {
    name   = "tag:environment"
    values = ["dev"]
  }
  filter {
    name   = "tag:id"
    values = ["001"]
  }
}
