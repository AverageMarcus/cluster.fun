resource "scaleway_object_bucket" "kubernetes" {
  name = "cluster.fun"
  acl  = "private"
}

output "bucket_id" {
  value = scaleway_object_bucket.kubernetes.id
}
