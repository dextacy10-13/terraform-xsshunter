resource "aws_eip" "xsshunter_eip" {
  instance = aws_instance.xsshunter.id
  vpc      = true
  tags = {
    ManaagedByTerraform = true
  }
}

resource "aws_route53_record" "this" {
  zone_id = var.zone_id
  name    = var.domain
  type    = "A"
  ttl     = "300"
  records = [
    aws_eip.xsshunter_eip.public_ip
  ]
}

resource "aws_route53_record" "wildcard" {
  zone_id = var.zone_id
  name    = "*"
  type    = "CNAME"
  ttl     = "300"
  records = [
    var.domain
  ]
}

resource "aws_vpc" "cicd" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true
}

resource "aws_subnet" "subnet" {
  cidr_block        = cidrsubnet(aws_vpc.cicd.cidr_block, 3, 1)
  vpc_id            = aws_vpc.cicd.id
  availability_zone = "${var.region}a"
  tags = {
    ManagedByTerraform = true
  }
}


resource "aws_route_table" "this" {
  vpc_id = aws_vpc.cicd.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.this.id
  }
}

resource "aws_route_table_association" "subnet-association" {
  subnet_id      = aws_subnet.subnet.id
  route_table_id = aws_route_table.this.id
}