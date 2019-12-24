resource "kubernetes_namespace" "waka" {
  metadata {
    name = "waka"
  }
}

resource "kubernetes_namespace" "waka_test" {
  metadata {
    name = "waka-test"
  }
}
