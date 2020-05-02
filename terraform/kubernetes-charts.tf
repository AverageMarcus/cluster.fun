provider "helm" {
  kubernetes {
    load_config_file = false
    host  = scaleway_k8s_cluster_beta.k8s-cluster.kubeconfig[0].host
    token = scaleway_k8s_cluster_beta.k8s-cluster.kubeconfig[0].token
    cluster_ca_certificate = base64decode(
      scaleway_k8s_cluster_beta.k8s-cluster.kubeconfig[0].cluster_ca_certificate
    )
  }
}

data "helm_repository" "stable" {
  name = "stable"
  url  = "https://kubernetes-charts.storage.googleapis.com"
}

data "helm_repository" "fluxcd" {
  name = "fluxcd"
  url  = "https://charts.fluxcd.io"
}

resource "helm_release" "helm-operator" {
  name       = "helm-operator"
  repository = data.helm_repository.fluxcd.metadata[0].name
  chart      = "helm-operator"

  max_history = 4

  set {
    name  = "helm.versions"
    value = "v3"
  }

  set {
    name  = "createCRD"
    value = "false"
  }
}



