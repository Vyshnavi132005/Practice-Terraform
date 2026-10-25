resource "aws_instance" "name" {
    ami = "ami-04b938437b69a2c9c"
    instance_type = "t2.micro"
    tags = {
        Name = "testing-server"
    }
  
}


resource "aws_s3_bucket" "test" {
  bucket   = "vyshnavi-terraform-testing-20261025"
  provider = aws.dev
}
