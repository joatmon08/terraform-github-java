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

provider "github" {
  owner = var.owner
}

data "aws_eks_cluster" "cluster" {
  name = local.eks_cluster_name
}

data "aws_eks_cluster_auth" "cluster" {
  name = local.eks_cluster_name
}

provider "kubernetes" {
  host                   = data.aws_eks_cluster.cluster.endpoint
  cluster_ca_certificate = base64decode(data.aws_eks_cluster.cluster.certificate_authority.0.data)
  token                  = data.aws_eks_cluster_auth.cluster.token
}