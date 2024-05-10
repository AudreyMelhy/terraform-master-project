variable "aws_region" {
  type = string
}

variable "instance_type" {
  type = string
}

variable "instance_ami" {
  type = string
}

variable "instance_name" {
  type = string
}

variable "sg_name" {
  type = string
} 

variable "volume_size" {
  type = string
}

variable "api_termination" {
  type = bool
}


variable "tenancy" {
  type = string
}

variable "key" {
  type = string
}
variable "tags" {
  type = map(any)
}

variable "pub_ip" {
  type = string
}

variable "allowed_ports" {
  type = list(number)
}

