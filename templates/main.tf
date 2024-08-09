# resource "null_resource" "install_templates" {
#   for_each = toset(var.templates)
#   provisioner "local-exec" {
#     command = <<-EOF
#       LATEST_FOLDER=$(gsutil ls gs://templates-uc-next/ | grep -E "^.*/[0-9]+(\\.[0-9]+){0,2}/" | sort | tail -n 1)
#       gsutil cp "$${LATEST_FOLDER}${each.key}.tar.gz" data_volumes/static/templates
#     EOF
#   }
# }

resource "null_resource" "download_script" {
  provisioner "local-exec" {
    command = "curl -o get_latest_migration_version.py https://raw.githubusercontent.com/ucraft-com/terraform-modules/master/templates/get_latest_migration_version.py"
  }

  triggers = {
    always_run = "${timestamp()}"
  }
}

data "external" "get_latest_migration_version" {
  depends_on = [null_resource.download_script]
  program = ["python3", "${path.module}/get_latest_migration_version.py"]
}
