resource "scaleway_k8s_cluster_beta" "k8s-cluster" {
  name             = "cluster-fun"
  description      = ""
  version          = "1.19"
  cni              = "weave"
  enable_dashboard = false
  ingress          = "traefik"

  feature_gates = [
    "HPAScaleToZero",
    "TTLAfterFinished"
  ]

  auto_upgrade {
    enable                        = true
    maintenance_window_start_hour = 2
    maintenance_window_day        = "any"
  }
}


resource "scaleway_k8s_pool_beta" "k8s-cluster-pool-1" {
  cluster_id  = scaleway_k8s_cluster_beta.k8s-cluster.id
  name        = "node pool 1"
  node_type   = "DEV1-M"
  size        = 1
  min_size    = 1
  max_size    = 3
  autoscaling = true
  autohealing = true

  lifecycle {
    ignore_changes = [size]
  }
}

output "api_server" {
  value = scaleway_k8s_cluster_beta.k8s-cluster.apiserver_url
}

output "wildcard_dns" {
  value = scaleway_k8s_cluster_beta.k8s-cluster.wildcard_dns
}

output "kubeconfig" {
  value = scaleway_k8s_cluster_beta.k8s-cluster.kubeconfig[0].config_file
}
