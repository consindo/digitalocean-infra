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
controller:
  autoscaling:
    enabled: true
    minReplicas: 2
    maxReplicas: 4
    targetCPUUtilizationPercentage: 75
    targetMemoryUtilizationPercentage: 85
  resources:
    requests:
      cpu: 100m
      memory: 100Mi
    limits:
      cpu: 300m
      memory: 300Mi
  EOT
}
