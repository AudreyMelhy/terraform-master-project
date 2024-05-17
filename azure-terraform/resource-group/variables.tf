variable "location" {
  type    = string
  default = "Central US"
}

variable "tags" {
  type = map(any)
}

variable "subscription_id" {
  type = string
  default = "e631ee46-0c94-4b48-bc3d-7f2d2ca1d592"
}
