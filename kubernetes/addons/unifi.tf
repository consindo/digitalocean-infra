resource "helm_release" "unifi" {
  name       = "unifi"
  namespace  = "jono-home"
  repository = data.helm_repository.stable.metadata[0].name
  chart      = "unifi"
  version    = "0.5.2"

  values = [
    local.unifi-values
  ]
}

locals {
  unifi-values = <<EOT
ingress:
  enabled: true
  annotations:
    kubernetes.io/ingress.class: nginx
  hosts:
    - jono-home.dymajo.com
  EOT
}
