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

resource "kubernetes_namespace" "nitro" {
  metadata {
    name = "nitro"
  }
}

resource "kubernetes_namespace" "nitro_test" {
  metadata {
    name = "nitro-test"
  }
}
