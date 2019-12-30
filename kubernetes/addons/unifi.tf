resource "helm_release" "unifi" {
  name       = "unifi"
  namespace  = "jono-home"
  repository = data.helm_repository.stable.metadata[0].name
  chart      = "unifi"
  version    = "0.5.2"
}

resource "kubernetes_ingress" "unifi-controller" {
  metadata {
    name      = "unfi-controller"
    namespace = "jono-home"
    annotations = {
      "kubernetes.io/ingress.class" = "nginx"
    }
  }

  spec {
    rule {
      host = "jono-home.dymajo.com"
      http {
        path {
          backend {
            service_name = "unifi-controller"
            service_port = "8080"
          }
          path = "/"
        }
      }
    }
  }
}
