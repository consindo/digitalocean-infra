resource "kubernetes_persistent_volume_claim" "waka-mssql-test" {
  metadata {
    name      = "mssql"
    namespace = "waka-test"
  }
  spec {
    access_modes = ["ReadWriteOnce"]
    resources {
      requests = {
        storage = "10Gi"
      }
    }
    storage_class_name = "do-block-storage"
  }
}
