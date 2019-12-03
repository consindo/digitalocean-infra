resource "helm_release" "metrics-server" {
  name       = "metrics-server"
  namespace  = kubernetes_namespace.monitoring.metadata[0].name
  repository = data.helm_repository.stable.metadata[0].name
  chart      = "metrics-server"
  version    = "2.8.8"
}
