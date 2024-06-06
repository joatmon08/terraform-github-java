variable "tfc_organization" {
  type        = string
  description = "TFC Organization with infrastructure resources"
  default     = "hashicorp-stack-demoapp"
}

variable "tfc_workspace_infrastructure" {
  type        = string
  description = "TFC Workspace with infrastructure resources"
  default     = "infrastructure"
}

data "terraform_remote_state" "infrastructure" {
  backend = "remote"
  config = {
    organization = var.tfc_organization
    workspaces = {
      name = var.tfc_workspace_infrastructure
    }
  }
}

locals {
  eks_cluster_name = data.terraform_remote_state.infrastructure.outputs.eks_cluster_id
}

variable "name" {
  type        = string
  description = "Name of repository"
  default     = "payments-app"
}

variable "business_unit" {
  type        = string
  description = "Business unit for service"
  default     = "payments-app"
}

variable "owner" {
  type        = string
  description = "GitHub template owner"
  default     = "joatmon08"
}

variable "template_repository" {
  type        = string
  description = "Template repository for Java app"
  default     = "spring-boot-template"
}

variable "kubernetes_server" {
  type        = string
  description = "Deploy to Kubernetes server"
  default     = "https://kubernetes.default.svc"
}