

resource "github_branch_protection" "branch" {
  repository_id                   = var.repository_id
  pattern                         = var.pattern
  enforce_admins                  = var.enforce_admins
  allows_deletions                = var.allows_deletions
  push_restrictions               = var.push_restrictions
  allows_force_pushes             = var.allows_force_pushes
  require_signed_commits          = var.require_signed_commits
  required_linear_history         = var.required_linear_history
  require_conversation_resolution = var.require_conversation_resolution
  blocks_creations                = var.blocks_creations
  lock_branch                     = var.lock_branch


  dynamic "required_status_checks" {
    for_each = var.required_status_checks == null ? [] : [var.required_status_checks]

    content {
      strict   = required_status_checks.value.strict
      contexts = required_status_checks.value.contexts
    }
  }

  dynamic "required_pull_request_reviews" {
    for_each = var.required_pull_request_reviews != null ? [var.required_pull_request_reviews] : []
    content {
      restrict_dismissals             = required_pull_request_reviews.value.restrict_dismissals
      pull_request_bypassers          = required_pull_request_reviews.value.pull_request_bypassers
      require_last_push_approval      = required_pull_request_reviews.value.require_last_push_approval
      dismiss_stale_reviews           = required_pull_request_reviews.value.dismiss_stale_reviews
      dismissal_restrictions          = required_pull_request_reviews.value.dismissal_restrictions
      require_code_owner_reviews      = required_pull_request_reviews.value.require_code_owner_reviews
      required_approving_review_count = required_pull_request_reviews.value.required_approving_review_count
    }
  }

}
