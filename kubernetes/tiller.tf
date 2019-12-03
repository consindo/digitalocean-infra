resource "kubernetes_service_account" "tiller" {
  metadata { 
    name      = "tiller"
    namespace = "kube-system"
  }
}

resource "kubernetes_cluster_role_binding" "tiller" {
  metadata {
    name = kubernetes_service_account.tiller.metadata[0].name
  }

  role_ref {
    kind      = "ClusterRole"
    name      = "cluster-admin"
    api_group = "rbac.authorization.k8s.io"
  }

  subject {
    kind      = "ServiceAccount"
    name      = kubernetes_service_account.tiller.metadata[0].name
    api_group = ""
    namespace = "kube-system"
  }

  subject {
    kind = "User"
    name = "system:serviceaccount:${kubernetes_service_account.tiller.metadata[0].namespace}:${kubernetes_service_account.tiller.metadata[0].name}"
  }
}
