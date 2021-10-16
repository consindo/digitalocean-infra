resource "helm_release" "kube-state-metrics" {
  name       = "kube-state-metrics"
  namespace  = "kube-system" # has to go in here, otherwise the DigitalOcean UI doesn't pick up metrics
  repository = "https://charts.helm.sh/stable"
  chart      = "kube-state-metrics"
  version    = "2.4.1"
}
