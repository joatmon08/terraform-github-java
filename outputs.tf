output "repository_url" {
  value = github_repository.app.html_url
}

output "kubernetes" {
  description = "Kubernetes attributes for application"
  value = {
    namespace  = kubernetes_namespace.starter.metadata.0.name
    deployment = var.name
  }
}