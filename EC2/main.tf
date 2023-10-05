terraform {
  required_version = "1.5.7"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.17.0"
    }
    //azurerm caso eu queria trabalhar com azure
  }

  backend "s3" {
    bucket = "okadara-remote-state"
    key    = "aws-vm/terraform.tfstate"
    region = "sa-east-1"
  }
}

provider "aws" {
  region = "sa-east-1"
  default_tags {
    tags = {
      owner      = "Ravel Okada"
      managed_by = "Terraform"
    }
  }
}

data "terraform_remote_state" "vpc" {
  backend = "s3"

  config = {
    bucket = "okadara-remote-state"
    key    = "aws-vpc/terraform.tfstate"
    region = "sa-east-1"
  }
}
