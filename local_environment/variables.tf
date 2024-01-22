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
variable "supervisor_template_path" {
  description = "supervisor template path"
  type        = string
  default     = "terraform/config/templates/supervisord/supervisord.ini"
}
variable "supervisor_file" {
  description = "supervisor template path"
  type        = string
  default     = null
}
variable "nginx_template_path" {
  description = "nginx template path"
  type        = string
  default     = null
}
variable "nginx_file" {
  description = "nginx template path"
  type        = string
  default     = null
}
variable "microservice_catalog_path" {
  description = "Microservice Catalog Folder Path"
  type        = string
  default     = "data_volummes/microservice_catalog"
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
  description = "A string of variables to pass to the template"
  type        = string
  default     = null
}
variable "service_name" {
  description = "A string of variables to pass to the template"
  type        = string
  default     = null
}
variable "server_host" {
  description = "A string of variables to pass to the template"
  type        = string
  default     = "remote"
}
variable "proxy_pass" {
  description = "A string of variables to pass to the template"
  type        = string
  default     = ""
}
variable "proxy_header" {
  description = "A string of variables to pass to the template"
  type        = string
  default     = ""
}
variable "valid_suffixes_supervisor" {
  description = "List of valid suffixes for server_host"
  type        = list(string)
  default     = [".ucraft.ai", "ucraft.ai/"]
}
