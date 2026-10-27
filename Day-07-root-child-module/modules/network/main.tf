resource "aws_vpc" "name" {
  cidr_block = var.vpc_cidr

  tags = {
    Name = "dev-vpc"
  }
}

resource "aws_subnet" "dev" {
  cidr_block = var.subnet_cidr
  vpc_id     = aws_vpc.name.id

  tags = {
    Name = "dev-subnet"
  }
}

output "subnet_id" {
  value = aws_subnet.dev.id
}