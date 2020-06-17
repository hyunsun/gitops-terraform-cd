terraform {
  required_version = ">= 0.13"
  backend "gcs" {
    bucket  = "aether-terraform-bucket"
    prefix  = "prod/state"
  }
  required_providers {
    rancher2 = {
      source  = "terraform-providers/rancher2"
      version = "<= 1.8.3"
    }
    null = {
      source = "hashicorp/null"
      version = "~> 2.1.2"
    }
  }
}

provider "rancher2" {
  api_url = var.rancher_url
  access_key = var.rancher_access_key
  secret_key = var.rancher_secret_key
}

module "clusters" {
  for_each = local.enabled_clusters

  source       = "../modules/rancher/cluster"
  cluster_name = each.value.cluster_name
  members      = each.value.members
  rke_config   = each.value.rke_config
  nodes        = each.value.nodes
  projects     = each.value.projects
}
