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

resource "scaleway_object_bucket" "outline" {
  name = "cluster.fun-outline"
  acl  = "private"
}

output "outline-bucket_id" {
  value = scaleway_object_bucket.outline.id
}

resource "scaleway_object_bucket" "logs" {
  name = "cluster.fun-logs"
  acl  = "private"
}

output "logs-bucket_id" {
  value = scaleway_object_bucket.logs.id
}
