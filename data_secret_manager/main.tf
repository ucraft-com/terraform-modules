data "google_secret_manager_secret_version" "this" {
  secret = var.secret
}
resource "local_file" "private_key" {
  content  = data.google_secret_manager_secret_version.this.secret_data
  filename = var.filename
}
