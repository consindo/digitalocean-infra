resource "digitalocean_kubernetes_cluster" "sfo2" {
  name    = "sfo2-prod"
  region  = "sfo2"
  version = "1.16.2-do.1"

  node_pool {
    name       = "memory-optimized"
    size       = "s-1vcpu-3gb"
    auto_scale = true
    min_nodes  = 1
    max_nodes  = 3
  }
}

resource "digitalocean_kubernetes_node_pool" "general-purpose" {
  cluster_id = digitalocean_kubernetes_cluster.sfo2.id
  name       = "general-purpose"
  size       = "s-1vcpu-2gb"
  auto_scale = true
  min_nodes  = 0
  max_nodes  = 3
}

