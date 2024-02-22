data "google_secret_manager_secret_version" "this" {
  secret = var.secret
}
data "template_file" "env" {
  template = data.google_secret_manager_secret_version.this.secret_data

  vars = {
    protocol = var.protocol
    domain   = var.domain
  }
}
resource "local_file" "private_key" {
  content  = data.template_file.env.rendered
  filename = var.filename
}
