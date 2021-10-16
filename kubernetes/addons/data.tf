data "helm_repository" "stable" {
  name = "stable"
  url  = "https://charts.helm.sh/stable"
}

data "helm_repository" "incubator" {
  name = "incubator"
  url  = "https://charts.helm.sh/incubator"
}
