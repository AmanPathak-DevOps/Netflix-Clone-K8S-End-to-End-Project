terraform {
  required_version = "~> 1.12.2"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.14.1"
    }
  }
  backend "s3" {
    bucket       = "dev-aman-tf-bucket"
    region       = "us-east-1"
    key          = "netflix-clone/terraform.tfstate"
    use_lockfile = true
    encrypt      = true
  }
}

provider "aws" {
  region = var.aws-region
}