resource "null_resource" "clone_repo" {

  triggers = {
    always_run = "${timestamp()}"
  }

  provisioner "local-exec" {
    command = <<EOF
      if [ ! -d "${var.microservice_catalog_path}/${var.service_repo}" ]; then
        if [ -d "${var.microservice_catalog_path}/${var.service_repo}" ] && [ -d "${var.microservice_catalog_path}/${var.service_repo}/.git" ]; then
            echo "Repository ${var.service_repo} already cloned. Skipping..."
        else
            git clone --branch ${var.clone_branch} "${var.github_base}/${var.service_repo}" "${var.microservice_catalog_path}/${var.service_repo}"
        fi
      fi
    EOF
  }
}

data "template_file" "env" {
  template = file(var.env_template_path)

  vars = {
    username = var.username
  }
}

resource "local_file" "env_file" {
  count      = var.env_file != null ? 1 : 0
  content    = data.template_file.env.rendered
  filename   = var.env_file
  depends_on = [resource.null_resource.clone_repo]

}
