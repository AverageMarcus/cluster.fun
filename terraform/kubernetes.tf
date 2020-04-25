resource "scaleway_k8s_cluster_beta" "k8s-cluster" {
  name             = "cluster-fun"
  description      = ""
  version          = "1.18.2"
  cni              = "weave"
  enable_dashboard = false
  ingress          = "traefik"

  default_pool {
    node_type   = "DEV1-M"
    size        = 1
    autoscaling = true
    autohealing = true
    min_size    = 1
    max_size    = 2
  }

  feature_gates = [
    "EphemeralContainers",
    "HPAScaleToZero",
    "TTLAfterFinished"
  ]
}


output "api_server" {
  value = scaleway_k8s_cluster_beta.k8s-cluster.apiserver_url
}

output "wildcard_dns" {
  value = scaleway_k8s_cluster_beta.k8s-cluster.wildcard_dns
}

output "kubeconfig" {
  value = scaleway_k8s_cluster_beta.k8s-cluster.kubeconfig
}
