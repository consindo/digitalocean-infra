resource "digitalocean_kubernetes_cluster" "sfo2" {
  name    = "sfo2-prod"
  region  = "sfo2"
  version = "1.16.2-do.0"

  node_pool {
    name       = "memory-optimized"
    size       = "s-1vcpu-3gb"
    node_count = 3
  }
}
