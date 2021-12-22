# -----------------------------------------------------------------------------
# DEPLOY STATIC-WEBSITE.COM ON AWS.
# -----------------------------------------------------------------------------
terraform {
  backend "s3" {
    bucket         = "nhk-terraform-state"
    key            = "static-website-com/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "nhk-terraform-state"
  }
}

provider "aws" {
  region = "us-east-1"
}

module "terraform_aws_static_website" {
  source      = "git@github.com:infrable-io/terraform-aws-static-website.git"
  domain_name = "static-website.com"
}
