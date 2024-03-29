resource "helm_release" "metrics-server" {
  name       = "metrics-server"
  namespace  = kubernetes_namespace.monitoring.metadata[0].name
  repository = "https://charts.helm.sh/stable"
  chart      = "metrics-server"
  version    = "2.8.8"

  values = [
    local.metrics-server-values
  ]
}

locals {
  metrics-server-values = <<EOT
args:
- --logtostderr
- --kubelet-preferred-address-types=InternalIP
- --kubelet-insecure-tls
  EOT
}
