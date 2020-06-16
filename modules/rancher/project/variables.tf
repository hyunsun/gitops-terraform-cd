variable "cluster_id" {
  description = "The cluster where the project belongs to."
  type        = string
}

variable "name" {
  description = "Name of the project."
  type        = string
}

variable "description" {
  description = "Description of the project."
  type        = string
}

variable "members" {
  description = "List of project memebers."
  type        = list(string)
  default     = []
}

variable "apps" {
  description = "List of applications."
  type = map(object({
    name             = string
    catalog_name     = string
    template_name    = string
    template_version = string
    target_namespace = string
    values_file      = string
  }))
  default = {}
}
