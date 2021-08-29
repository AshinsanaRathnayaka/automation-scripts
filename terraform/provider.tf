provider "aws" {
  region                      = var.region
  shared_credentials_file     = "~/.aws/credentials"
  profile                     = "test"
}

# or provide aws credential below

# provider "aws" {
#   region                      = var.region
#   access_key                  = ""
#   secret_key                  = ""
# }