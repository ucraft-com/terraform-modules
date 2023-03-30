output "repo_id" {
  value = github_branch_protection.branch.repository_id
}

output "pattern" {
  value = github_branch_protection.branch.pattern
}

output "enforce_admins" {
  value = github_branch_protection.branch.enforce_admins
}

output "push_restrictions" {
  value = github_branch_protection.branch.push_restrictions
}

output "allows_force_pushes" {
  value = github_branch_protection.branch.allows_force_pushes
}
