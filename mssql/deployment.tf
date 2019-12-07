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
            "ACCEPT_EULA" = "Y"
            "SA_PASSWORD" = var.SA_PASSWORD_TEST
            "MSSQL_PID" = "Express"
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
        }
      }
    }
  }
}
