terraform {
  required_providers {
    helm = {
      source = "hashicorp/helm"
      version = "1.3.2"
    }
    kubectl = {
      source  = "gavinbunney/kubectl"
      version = ">= 1.7.0"
    }
    scaleway = {
      source = "scaleway/scaleway"
      version = "1.17.2"
    }
  }
  required_version = ">= 0.13"
}
