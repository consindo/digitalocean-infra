resource "kubernetes_secret" "mssql" {
  metadata {
    name      = "mssql"
    namespace = "waka-test"
  }

  data = {
    sa = var.SA_PASSWORD_TEST
  }
}

resource "kubernetes_secret" "mssql-prod" {
  metadata {
    name      = "mssql"
    namespace = "waka"
  }

  data = {
    sa = var.SA_PASSWORD_PROD
  }
}
