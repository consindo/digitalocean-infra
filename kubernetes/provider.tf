provider "kubernetes" {
  host  = data.digitalocean_kubernetes_cluster.sfo2.endpoint
  token = data.digitalocean_kubernetes_cluster.sfo2.kube_config[0].token
  cluster_ca_certificate = base64decode(
    data.digitalocean_kubernetes_cluster.sfo2.kube_config[0].cluster_ca_certificate
  )
}
