resource "scaleway_object_bucket" "kubernetes" {
  name = "cluster.fun"
  acl  = "private"
}

output "bucket_id" {
  value = scaleway_object_bucket.kubernetes.id
}

resource "scaleway_object_bucket" "outline" {
  name = "cluster.fun-outline"
  acl  = "private"
}

output "outline-bucket_id" {
  value = scaleway_object_bucket.outline.id
}

resource "scaleway_object_bucket" "notea" {
  name = "cluster.fun-notea"
  acl  = "private"
}

output "notea-bucket_id" {
  value = scaleway_object_bucket.notea.id
}
