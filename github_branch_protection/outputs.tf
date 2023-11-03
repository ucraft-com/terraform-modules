
output "file_sha" {
  value = github_repository_file.this.sha
}

output "file_download_url" {
  value = github_repository_file.this.download_url
}
