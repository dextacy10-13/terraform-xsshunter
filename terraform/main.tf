terraform {
  backend "local" {

  }
}

provider "aws" {
  version = "2.59.0"
  region  = var.region
}

// wordpress frontend
resource "aws_instance" "xsshunter" {
  ami           = var.xsshunter_ami
  instance_type = var.instance_type
  key_name      = var.ami_key_pair_name

  tags = {
    Name               = "xsshunter"
    ManagedByTerraform = true
  }
  vpc_security_group_ids = [aws_security_group.xsshunter.id]
  subnet_id              = aws_subnet.subnet.id
}