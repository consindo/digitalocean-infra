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

resource "kubernetes_namespace" "jono_home" {
  metadata {
    name = "jono-home"
  }
}
