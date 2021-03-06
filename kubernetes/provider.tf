provider "kubernetes" {
  version = "= 1.10.0"
  host    = digitalocean_kubernetes_cluster.sfo2.endpoint
  token   = digitalocean_kubernetes_cluster.sfo2.kube_config[0].token
  cluster_ca_certificate = base64decode(
    digitalocean_kubernetes_cluster.sfo2.kube_config[0].cluster_ca_certificate
  )
}

provider "helm" {
  version = "= 0.10.4"
  service_account = kubernetes_service_account.tiller.metadata[0].name
  kubernetes {
    host  = digitalocean_kubernetes_cluster.sfo2.endpoint
    token = digitalocean_kubernetes_cluster.sfo2.kube_config[0].token
    cluster_ca_certificate = base64decode(
      digitalocean_kubernetes_cluster.sfo2.kube_config[0].cluster_ca_certificate
    )
  }
}
