variable "vpc_id" {
  default = ""
  description = "VPC"
}

variable "ami_id" {
  default = "ami-0b33356b362c56df5"
  description = "Ubuntu 18 AMI."
}

variable "server_name" {
  default = "vpn-server"
  description = "Name of the EC2 instance."
}

variable "key_name" {
  default = "wireguard-2"
  description = "VPC"
}
