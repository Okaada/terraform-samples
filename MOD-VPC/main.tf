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
    key    = "aws-vm-local-module/terraform.tfstate"
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

module "network" {
  source      = "./network"
  cidr_vpc    = "10.0.0.0/16"
  cidr_subnet = "10.0.0.1/24"
  environment = "development  "
}
