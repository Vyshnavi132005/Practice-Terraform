resource "aws_instance" "web_server" {
  ami           = "ami-04b938437b69a2c9c"
  instance_type = "t2.micro"

  user_data = file("${path.module}/user.sh")

  tags = {
    Name = "terraform-user-data-server"
  }
}