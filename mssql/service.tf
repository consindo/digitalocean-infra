resource "kubernetes_service" "waka-mssql-test" {
  metadata {
    name      = "mssql"
    namespace = "waka-test"
  }
  spec {
    selector = {
      app = kubernetes_deployment.waka-mssql-test.metadata.0.labels.app
    }
    port {
      port        = 1433
      target_port = 1433
    }
    type = "ClusterIP"
  }
}

resource "kubernetes_service" "waka-mssql-prod" {
  metadata {
    name      = "mssql"
    namespace = "waka"
  }
  spec {
    selector = {
      app = kubernetes_deployment.waka-mssql-prod.metadata.0.labels.app
    }
    port {
      port        = 1433
      target_port = 1433
    }
    type = "ClusterIP"
  }
}
