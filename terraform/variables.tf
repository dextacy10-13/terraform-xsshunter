variable "zone_id" {}

variable "region" {
  default = "eu-west-2"
}

variable "domain" {}

variable "xsshunter_ami" {
  default = ""
}

variable "ami_key_pair_name" {}

variable "instance_type" {
  default = "t2.micro"
}

variable "access_cidr" {}