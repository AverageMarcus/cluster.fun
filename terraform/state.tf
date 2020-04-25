terraform {
  backend "s3" {
    bucket                      = "cluster.fun-tfstate"
    key                         = "state.tfstate"
    region                      = "fr-par"
    endpoint                    = "https://s3.fr-par.scw.cloud"
    skip_credentials_validation = true
    skip_region_validation      = true
  }
}
