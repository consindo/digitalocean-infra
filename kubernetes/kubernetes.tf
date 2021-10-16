resource "digitalocean_kubernetes_cluster" "sfo2" {
  name    = "sfo2-prod"
  region  = "sfo2"
  version = "1.19.13-do.0"

  node_pool {
    name       = "general-purpose"
    size       = "s-2vcpu-4gb"
    auto_scale = true
    min_nodes  = 1
    max_nodes  = 3
  }
}

resource "digitalocean_kubernetes_node_pool" "memory-optimized" {
  cluster_id = digitalocean_kubernetes_cluster.sfo2.id
  name       = "memory-optimized"
  size       = "s-1vcpu-3gb"
  auto_scale = true
  min_nodes  = 0
  max_nodes  = 3
}

resource "digitalocean_kubernetes_node_pool" "compute-optimized" {
  cluster_id = digitalocean_kubernetes_cluster.sfo2.id
  name       = "compute-optimized"
  size       = "s-2vcpu-2gb"
  auto_scale = true
  min_nodes  = 0
  max_nodes  = 3
}

