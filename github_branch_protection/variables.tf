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
