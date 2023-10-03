terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = ">= 5.39"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = ">= 2.13"
    }
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.0"
    }
  }
}

provider "aws" {}

module "test" {
  source        = "../.."
  name          = "starter"
  business_unit = "hashicups"
}