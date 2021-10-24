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

