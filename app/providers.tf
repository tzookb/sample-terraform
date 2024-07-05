# providers.tf

terraform {
  backend "s3" {}

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"  # Use the latest 4.x version
    }
  }
}

provider "aws" {
  region = "us-east-1"
  profile = "loop"
}