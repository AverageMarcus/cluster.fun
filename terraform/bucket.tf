resource "scaleway_object_bucket" "kubernetes" {
  name = "cluster.fun"
  acl  = "private"
}

output "bucket_id" {
  value = scaleway_object_bucket.kubernetes.id
}

resource "scaleway_object_bucket" "linx" {
  name = "cluster.fun-linx"
  acl  = "private"
}

output "linx-bucket_id" {
  value = scaleway_object_bucket.linx.id
}

resource "scaleway_object_bucket" "octoprint_timelapse" {
  name = "cluster.fun-octoprint"
  acl  = "private"
}

output "octoprint-bucket_id" {
  value = scaleway_object_bucket.octoprint_timelapse.id
}
