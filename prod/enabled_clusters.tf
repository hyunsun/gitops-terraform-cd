locals {
  enabled_clusters = {
    central = jsondecode(file("${path.module}/central/cluster.json"))
    edge_cloudlab_utah = jsondecode(file("${path.module}/edge-cloudlab-utah/cluster.json"))
  }
}
