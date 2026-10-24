
resource "aws_instance" "name" {
  ami           = "ami-08c46876c64a927b8"
  instance_type = "t2.micro"

  tags = {
    Name = "testing-server"
  }
}

resource "aws_s3_bucket" "test" {
  bucket = "terraform-testing-vyshnavi-2026"
}

resource "aws_s3_bucket_versioning" "versioning_example" {
  bucket = aws_s3_bucket.test.id

  versioning_configuration {
    status = "Enabled"
  }
}