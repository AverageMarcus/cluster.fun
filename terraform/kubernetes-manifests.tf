provider "kubectl" {
  load_config_file = false
  host             = scaleway_k8s_cluster_beta.k8s-cluster.kubeconfig[0].host
  token            = scaleway_k8s_cluster_beta.k8s-cluster.kubeconfig[0].token
  cluster_ca_certificate = base64decode(
    scaleway_k8s_cluster_beta.k8s-cluster.kubeconfig[0].cluster_ca_certificate
  )
}

resource "kubectl_manifest" "manifests" {
  for_each = fileset(path.module, "../manifests/*")
  yaml_body = file(each.key)
}


resource "kubectl_manifest" "tekton-install" {
  for_each = fileset(path.module, "../tekton/1-Install/*")
  yaml_body = file(each.key)
}

resource "kubectl_manifest" "tekton-setup" {
  for_each = fileset(path.module, "../tekton/2-Setup/*")
  yaml_body = file(each.key)
}


resource "kubectl_manifest" "tekton" {
  for_each = fileset(path.module, "../tekton/{bindings,conditions,eventlisteners,pipelines,tasks,triggertemplates}/*")
  yaml_body = file(each.key)
}

