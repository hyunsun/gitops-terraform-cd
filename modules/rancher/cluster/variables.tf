variable "cluster_name" {
  description = "Name of the cluster."
  type        = string
}

variable "members" {
  description = "Username of the cluster members."
  type        = list(string)
  default     = []
}

variable "rke_config" {
  description = "RKE configurations."
  type        = map
}

variable "nodes" {
  description = "List of the cluster nodes."
  type        = map
  default     = {}
}

variable "projects" {
  description = "List of projects."
  type        = map
  default     = {}
}
