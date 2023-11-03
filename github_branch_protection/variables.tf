variable "repository_id" {
  type = string
}

variable "pattern" {
  type    = string
  default = "main"
}

variable "lock_branch" {
  type    = bool
  default = false
}

variable "blocks_creations" {
  type    = bool
  default = false
}

variable "require_conversation_resolution" {
  type    = bool
  default = false
}

variable "required_linear_history" {
  type    = bool
  default = false
}

variable "require_signed_commits" {
  type    = bool
  default = false
}

variable "enforce_admins" {
  type    = bool
  default = false
}

variable "required_status_checks" {
  type = object(
    {
      strict   = bool
      contexts = list(string)
    }
  )
  default = null

}

variable "required_pull_request_reviews" {
  type = object(
    {
      dismiss_stale_reviews           = bool
      restrict_dismissals             = bool
      dismissal_restrictions          = list(string)
      pull_request_bypassers          = list(string)
      require_code_owner_reviews      = bool
      required_approving_review_count = number
      require_last_push_approval      = bool
    }
  )
  default = null
}

variable "allows_deletions" {
  type    = bool
  default = false
}

variable "allows_force_pushes" {
  type    = bool
  default = false
}

variable "push_restrictions" {
  type    = list(string)
  default = []
}

variable "enable_file_management" {
  description = "Set to true to enable file management"
  type        = bool
  default     = true
}

variable "github_token" {
  description = "The GitHub token for API access"
  type        = string
}

variable "repository" {
  description = "The name of the repository"
  type        = string
}

variable "file_path" {
  description = "The path to the file in the repository"
  type        = string
}

variable "branch" {
  description = "The branch to commit to"
  type        = string
  default     = "main"
}

variable "commit_message" {
  description = "The commit message when updating the file"
  type        = string
}
variable "overwrite_on_create" {
  description = "Enable overwriting existing files"
  type        = bool
  default     = true
}

variable "template_vars" {
  description = "A map of variables to pass to the template file"
  type        = map(string)
  default     = {}
}
variable "file_paths" {
  description = "List of file paths to create in the GitHub repository"
  type        = list(string)
}

variable "template_dir" {
  description = "The directory where the template files are located"
  type        = string
  default     = "templates"
}
