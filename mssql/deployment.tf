locals {
  mount_path = "/var/opt/mssql"
}

resource "kubernetes_deployment" "waka-mssql-test" {
  metadata {
    name      = "mssql"
    namespace = "waka-test"
    labels = {
      app = "mssql"
    }
  }

  spec {
    replicas = 0
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
        init_container {
          name    = "fix-permissions"
          image   = "busybox"
          command = ["/bin/chmod", "-R", "777", local.mount_path]

          volume_mount {
            name       = kubernetes_persistent_volume_claim.waka-mssql-test.metadata.0.name
            mount_path = local.mount_path
          }
        }

        container {
          image = "mcr.microsoft.com/mssql/server:2019-GA-ubuntu-16.04"
          name  = "mssql"

          env {
            name  = "ACCEPT_EULA"
            value = "Y"
          }
          env {
            name = "SA_PASSWORD"
            value_from {
              secret_key_ref {
                name = kubernetes_secret.mssql.metadata.0.name
                key  = "sa"
              }
            }
          }
          env {
            name  = "MSSQL_PID"
            value = "Express"
          }

          resources {
            limits {
              cpu    = "2000m"
              memory = "2500Mi"
            }
            requests {
              cpu    = "500m"
              memory = "1500Mi"
            }
          }

          volume_mount {
            name       = kubernetes_persistent_volume_claim.waka-mssql-test.metadata.0.name
            mount_path = local.mount_path
          }
        }
        volume {
          name = kubernetes_persistent_volume_claim.waka-mssql-test.metadata.0.name
          persistent_volume_claim {
            claim_name = kubernetes_persistent_volume_claim.waka-mssql-test.metadata.0.name
          }
        }
      }
    }
  }
}

resource "kubernetes_deployment" "waka-mssql-prod" {
  metadata {
    name      = "mssql"
    namespace = "waka"
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
        init_container {
          name    = "fix-permissions"
          image   = "busybox"
          command = ["/bin/chmod", "-R", "777", local.mount_path]

          volume_mount {
            name       = kubernetes_persistent_volume_claim.waka-mssql-prod.metadata.0.name
            mount_path = local.mount_path
          }
        }

        container {
          image = "mcr.microsoft.com/mssql/server:2019-GA-ubuntu-16.04"
          name  = "mssql"

          env {
            name  = "ACCEPT_EULA"
            value = "Y"
          }
          env {
            name = "SA_PASSWORD"
            value_from {
              secret_key_ref {
                name = kubernetes_secret.mssql-prod.metadata.0.name
                key  = "sa"
              }
            }
          }
          env {
            name  = "MSSQL_PID"
            value = "Express"
          }

          resources {
            limits {
              cpu    = "2000m"
              memory = "2500Mi"
            }
            requests {
              cpu    = "500m"
              memory = "1500Mi"
            }
          }

          volume_mount {
            name       = kubernetes_persistent_volume_claim.waka-mssql-prod.metadata.0.name
            mount_path = local.mount_path
          }
        }
        volume {
          name = kubernetes_persistent_volume_claim.waka-mssql-prod.metadata.0.name
          persistent_volume_claim {
            claim_name = kubernetes_persistent_volume_claim.waka-mssql-prod.metadata.0.name
          }
        }
      }
    }
  }
}
