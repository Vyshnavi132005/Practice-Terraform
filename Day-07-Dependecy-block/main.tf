resource "aws_vpc" "name" {
    cidr_block = "10.0.0.0/16"
    tags = {
        Name = "my-vpc"
    }
  depends_on = [aws_s3_bucket.my_bucket]
}

resource "aws_s3_bucket" "my_bucket" {
    bucket = "terraform-for-day07practice"
    tags = {
        Name        = "My bucket"
        Environment = "Dev"
    }
}