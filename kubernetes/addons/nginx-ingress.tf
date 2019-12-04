resource "helm_release" "nginx-ingress" {
  name       = "nginx-ingress"
  namespace  = kubernetes_namespace.nginx-ingress.metadata[0].name
  repository = data.helm_repository.stable.metadata[0].name
  chart      = "nginx-ingress"
  version    = "1.26.1"

  values = [
    local.nginx-ingress-values
  ]
}

locals {
  nginx-ingress-values = <<EOT
metrics:
  enabled: true
  replicaCount: 2
  EOT
}
