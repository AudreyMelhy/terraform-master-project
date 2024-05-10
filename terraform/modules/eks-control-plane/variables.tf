variable "aws_region" {
  type = string  
}


variable "cluster_version" {
  type = string
}

variable "tags" {
    type = map(any)
}


variable "endpoint_public_access" {
    type = bool
}

variable "endpoint_private_access" {
    type = bool
}

