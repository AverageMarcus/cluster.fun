provider "scaleway" {
  zone            = "fr-par-1"
  region          = "fr-par"
  organization_id = "5c1e5e2a-a6cd-4eb3-907f-2a83a29668fc"
}

provider "helm" {
  kubernetes {
    load_config_file = false
    host             = scaleway_k8s_cluster_beta.k8s-cluster.kubeconfig[0].host
    token            = scaleway_k8s_cluster_beta.k8s-cluster.kubeconfig[0].token
    cluster_ca_certificate = base64decode(
      scaleway_k8s_cluster_beta.k8s-cluster.kubeconfig[0].cluster_ca_certificate
    )
  }
}
