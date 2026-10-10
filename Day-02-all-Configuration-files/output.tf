output "subnet_az" {
    value = aws_subnet.test
}

output "vpc_id" {
    value = aws_vpc.dev.id
  
}