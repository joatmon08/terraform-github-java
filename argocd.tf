resource "kubernetes_manifest" "application_argocd_hashicups" {
  manifest = {
    "apiVersion" = "argoproj.io/v1alpha1"
    "kind"       = "Application"
    "metadata" = {
      "finalizers" = [
        "resources-finalizer.argocd.argoproj.io",
      ]
      "name"      = var.business_unit
      "namespace" = "argocd"
    }
    "spec" = {
      "destination" = {
        "namespace" = var.business_unit
        "server"    = var.kubernetes_server
      }
      "project" = "default"
      "source" = {
        "path"           = "kubernetes"
        "repoURL"        = github_repository.app.http_clone_url
        "targetRevision" = "main"
      }
      "syncPolicy" = {
        "automated" = {
          "prune"    = true
          "selfHeal" = true
        }
        "syncOptions" = [
          "CreateNamespace=true",
        ]
      }
    }
  }
}
