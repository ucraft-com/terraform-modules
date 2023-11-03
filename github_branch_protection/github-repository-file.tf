locals {
  files_to_manage = { for file in var.file_paths : file => "${path.module}/${var.template_dir}/${file}.tpl" }
}

resource "github_repository_file" "this" {
  for_each            = var.enable_file_management ? local.files_to_manage : {}
  repository          = var.repository
  branch              = var.branch
  file                = each.key
  content             = base64encode(templatefile(each.value, var.template_vars))
  commit_message      = "Managed by Terraform: Update ${each.key}"
  overwrite_on_create = var.overwrite_on_create
}
