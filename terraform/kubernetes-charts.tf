resource "helm_release" "helm-operator" {
  name       = "helm-operator"
  repository = "https://charts.fluxcd.io"
  chart      = "helm-operator"

  max_history = 3

  set {
    name  = "helm.versions"
    value = "v3"
  }

  set {
    name  = "createCRD"
    value = "false"
  }
}



