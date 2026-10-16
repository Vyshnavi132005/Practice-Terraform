module "dev" {
  source = "../Day-06-ec2-module"
  ami_id        = "ami-0ed59cbb87dfa8dba"
  instance_type = "t2.micro"
  az            = "us-east-1a"
  tags          = "dev"
}