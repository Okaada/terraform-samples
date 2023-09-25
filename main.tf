terraform {
  required_version = "1.5.7"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.17.0"
    }
  }
}

provider "aws" {
  # Configuration options
  region = "sa-east-1"

  default_tags {
    tags = {
      owner      = "Ravel Okada"
      managed_by = "Terraform"
    }
  }
}