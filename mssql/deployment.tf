resource "kubernetes_deployment" "waka-mssql-test" {
  metadata {
    name      = "mssql"
    namespace = "waka-test"
    labels = {
      app = "mssql"
    }
  }

  spec {
    replicas = 1
    strategy {
      type = "Recreate"
    }

    selector {
      match_labels = {
        app = "mssql"
      }
    }

    template {
      metadata {
        labels = {
          app = "mssql"
        }
      }

      spec {
        container {
          image = "mcr.microsoft.com/mssql/server:2019-GA-ubuntu-16.04"
          name  = "mssql"

          env {
            name  = "ACCEPT_EULA"
            value = "Y"
          }
          env {
            name  = "SA_PASSWORD"
            value = var.SA_PASSWORD_TEST
          }
          env {
            name  = "MSSQL_PID"
            value = "Express"
          }

          resources {
            limits {
              cpu    = "2"
              memory = "2500Mi"
            }
            requests {
              cpu    = "1"
              memory = "1500Mi"
            }
          }

          volume_mount {
            name       = kubernetes_persistent_volume_claim.waka-mssql-test.metadata.0.name
            mount_path = "/var/opt/mssql"
          }
        }
        persistent_volume_claim {
          claim_name = kubernetes_persistent_volume_claim.waka-mssql-test.metadata.0.name
        }
      }
    }
  }
}
