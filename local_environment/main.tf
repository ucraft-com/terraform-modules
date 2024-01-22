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

data "template_file" "supervisor" {
  template = file(var.supervisor_template_path)

  vars = {
    service_name = var.service_name
    service_repo = var.service_repo
  }
}

resource "local_file" "supervisor_file" {
  count      = var.supervisor_file != null ? ((anytrue([for suffix in var.valid_suffixes_supervisor : endswith(var.proxy_pass, suffix)])) != true ? 1 : 0) : 0
  content    = data.template_file.supervisor.rendered
  filename   = var.supervisor_file
  depends_on = [resource.null_resource.clone_repo]

}
data "template_file" "nginx" {
  template = file(var.nginx_template_path)

  vars = {
    service_name = var.service_name
    server_host  = var.server_host
    proxy_pass   = var.proxy_pass
    service_repo = var.service_repo
    proxy_header = anytrue([for suffix in var.valid_suffixes_supervisor : endswith(var.proxy_pass, suffix)]) == true ? var.proxy_pass : "$host"
  }
}

resource "local_file" "nginx_file" {
  count      = endswith(var.nginx_template_path, "none") != true ? ((anytrue([for suffix in var.valid_suffixes_supervisor : endswith(var.server_host, suffix)])) != true ? 1 : 0) : 0
  content    = data.template_file.nginx.rendered
  filename   = var.nginx_file
  depends_on = [resource.null_resource.clone_repo]

}
