resource "kubernetes_namespace" "starter" {
  metadata {
    name = var.business_unit
  }
}

resource "kubernetes_manifest" "servicedefaults_starter" {
  manifest = {
    "apiVersion" = "consul.hashicorp.com/v1alpha1"
    "kind"       = "ServiceDefaults"
    "metadata" = {
      "name"      = var.name
      "namespace" = kubernetes_namespace.starter.metadata.0.name
    }
    "spec" = {
      "protocol" = "http"
    }
  }
}

resource "kubernetes_manifest" "service_starter" {
  manifest = {
    "apiVersion" = "v1"
    "kind"       = "Service"
    "metadata" = {
      "name"      = var.name
      "namespace" = kubernetes_namespace.starter.metadata.0.name
    }
    "spec" = {
      "ports" = [
        {
          "name"       = "http"
          "port"       = 8080
          "protocol"   = "TCP"
          "targetPort" = 8080
        },
      ]
      "selector" = {
        "app" = var.name
      }
    }
  }
}

resource "kubernetes_manifest" "serviceaccount_starter" {
  manifest = {
    "apiVersion" = "v1"
    "kind"       = "ServiceAccount"
    "metadata" = {
      "name"      = var.name
      "namespace" = kubernetes_namespace.starter.metadata.0.name
    }
  }
}

resource "kubernetes_manifest" "deployment_starter" {
  manifest = {
    "apiVersion" = "apps/v1"
    "kind"       = "Deployment"
    "metadata" = {
      "labels" = {
        "app" = var.name
      }
      "name"      = var.name
      "namespace" = kubernetes_namespace.starter.metadata.0.name
    }
    "spec" = {
      "replicas" = 1
      "selector" = {
        "matchLabels" = {
          "app" = var.name
        }
      }
      "template" = {
        "metadata" = {
          "annotations" = {
            "consul.hashicorp.com/connect-inject" = "true"
          }
          "labels" = {
            "app" = var.name
          }
        }
        "spec" = {
          "containers" = [
            {
              "image" = "rosemarywang/spring-boot-template:main"
              "name"  = var.name
              "ports" = [
                {
                  "containerPort" = 8080
                },
              ]
            },
          ]
          "serviceAccountName" = var.name
        }
      }
    }
  }
}
