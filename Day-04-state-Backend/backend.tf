
terraform {
  backend "s3" {
    bucket  = "s3-terraform-backendfiles"
    key     = "dev/terraform.tfstate"
    region  = "us-east-1"
    encrypt = true
    use_lockfile = true
    dynamodb_table = "state-terraform-file"
  }
}
