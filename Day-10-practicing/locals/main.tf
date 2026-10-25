
# Define local values
locals {
  project_name = "terraform-practice"
  environment  = "dev"
  owner        = "vyshu"

  common_tags = {
    Project     = local.project_name
    Environment = local.environment
    Owner       = local.owner
  }

  bucket_name = "${local.project_name}-${local.environment}-bucket"
}

# Output project name
output "project_name" {
  value = local.project_name
}

# Output environment
output "environment" {
  value = local.environment
}

# Output owner
output "owner" {
  value = local.owner
}

# Output bucket name
output "bucket_name" {
  value = local.bucket_name
}

# Output common tags
output "common_tags" {
  value = local.common_tags
}