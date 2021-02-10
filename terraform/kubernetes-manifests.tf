resource "kubectl_manifest" "manifests" {
  for_each  = fileset(path.module, "../manifests/*")
  yaml_body = file(each.key)
}


resource "kubectl_manifest" "tekton-install" {
  for_each  = fileset(path.module, "../tekton/1-Install/*")
  yaml_body = file(each.key)
}

resource "kubectl_manifest" "tekton-setup" {
  for_each  = fileset(path.module, "../tekton/2-Setup/*")
  yaml_body = file(each.key)
}


resource "kubectl_manifest" "tekton" {
  for_each  = fileset(path.module, "../tekton/{bindings,conditions,eventlisteners,pipelines,tasks,triggertemplates}/*")
  yaml_body = file(each.key)
}

