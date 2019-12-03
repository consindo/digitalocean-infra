resource "helm_release" "kube-state-metrics" {
  name       = "kube-state-metrics"
  namespace  = "kube-system"
  repository = data.helm_repository.stable.metadata[0].name
  chart      = "kube-state-metrics"
  version    = "2.4.1"
}
