locals {
  clusters = {
    central = jsondecode(file("${path.module}/central/cluster.json"))
    #edge_onf_menlo = jsondecode(file("${path.module}/edge-onf-menlo/cluster.json"))
  }
}
