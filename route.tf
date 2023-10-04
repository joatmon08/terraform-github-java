resource "kubernetes_manifest" "httproute_consul_starter" {
  manifest = {
    "apiVersion" = "gateway.networking.k8s.io/v1alpha2"
    "kind"       = "HTTPRoute"
    "metadata" = {
      "name"      = "starter"
      "namespace" = "consul"
    }
    "spec" = {
      "parentRefs" = [
        {
          "name"      = "api-gateway"
          "namespace" = "consul"
        },
      ]
      "rules" = [
        {
          "backendRefs" = [
            {
              "kind"      = "Service"
              "name"      = "starter"
              "namespace" = var.business_unit
              "port"      = 8080
            },
          ]
          "matches" = [
            {
              "path" = {
                "type"  = "PathPrefix"
                "value" = "/"
              }
            },
          ]
        },
      ]
    }
  }
}
