variable "portfolio" {
  type = list(string)
  default = ["dev", "test", "prod"]
}



resource "aws_instance" "name" {
    ami = "ami-04b938437b69a2c9c"
    instance_type = "t2.medium"
    count=length(var.portfolio)
    tags = {
        Name = var.portfolio[count.index]
    }

  
}