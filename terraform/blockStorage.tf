# resource "scaleway_instance_volume" "kubernetes" {
#     type       = "l_ssd"
#     name       = "kubernetes"
#     size_in_gb = 100
# }

# output "block-storage-id" {
#   value = scaleway_instance_volume.kubernetes.id
# }
