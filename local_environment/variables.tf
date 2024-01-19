variable "config_path" {
  description = "Relative path to the config file"
  type        = string
  default     = "/../../config.json"
}
variable "env_template_path" {
  description = "env template path"
  type        = string
  default     = null
}
variable "env_file" {
  description = "env template path"
  type        = string
  default     = null
}
variable "microservice_catalog_path" {
  description = "Microservice Catalog Folder Path"
  type        = string
  default     = "../../microservice_catalog"
}
variable "clone_branch" {
  description = "Clone Branch"
  type        = string
  default     = "master"
}
variable "service_repo" {
  description = "Service Repo"
  type        = string
}
variable "github_base" {
  description = "GitHub org path"
  type        = string
  default     = "git@github.com:ucraft-com"
}
variable "username" {
  description = "A map of variables to pass to the template"
  type        = string
  default     = null
}
