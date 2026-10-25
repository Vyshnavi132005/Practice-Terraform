
provider "aws" {
  region = "us-east-1"
}

provider "aws" {
  alias  = "dev"
  region = "us-west-2"
}
