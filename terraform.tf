terraform {
  #existem várias maneiras de informar a versão
  #1.5.3 // = 1.5.3 // > 1.5.0, < 1.5.3 // != 1.0.0 // ˜> 1.0.0 (indica da 1.0.0 até a 1.0.20)
  required_version = "1.5.7"

  required_providers {
    aws = {
      version = "3.73.0"
      source  = "hashicorp/aws"
    }
  }
}

provider "aws" {
  region = "sa-east-1"

  default_tags {
    tags = {
      owner      = "okada"
      managed-by = "terraform"
    }
  }
}
