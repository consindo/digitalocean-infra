resource "kubernetes_service" "waka-mssql-test" {
  metadata {
    name = "waka-mssql-test"
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
