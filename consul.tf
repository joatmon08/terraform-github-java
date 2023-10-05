resource "kubernetes_manifest" "referencegrant_consul_reference_grant" {
  manifest = {
    "apiVersion" = "gateway.networking.k8s.io/v1alpha2"
    "kind"       = "ReferenceGrant"
    "metadata" = {
      "name" = "consul-reference-grant"
      "namespace" = var.business_unit
    }
    "spec" = {
      "from" = [
        {
          "group"     = "gateway.networking.k8s.io"
          "kind"      = "HTTPRoute"
          "namespace" = "consul"
        },
      ]
      "to" = [
        {
          "group" = ""
          "kind"  = "Service"
        },
      ]
    }
  }
}

