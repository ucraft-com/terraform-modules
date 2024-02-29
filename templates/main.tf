resource "null_resource" "install_templates" {
  for_each = toset(var.templates)
  provisioner "local-exec" {
    command = <<-EOF
      LATEST_FOLDER=$(gsutil ls gs://templates-uc-next/ | grep -E "^.*/[0-9]+(\\.[0-9]+){0,2}/" | sort | tail -n 1)
      gsutil cp "$${LATEST_FOLDER}${each.key}.tar.gz" data_volumes/static/templates
    EOF
  }
}

data "external" "get_latest_migration_version" {
  program = ["python3", "get_latest_migration_version.py"]
}