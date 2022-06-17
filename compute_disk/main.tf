resource "google_compute_disk" "disk" {

  name                      = var.name
  type                      = var.type
  zone                      = var.zone
  image                     = var.image
  physical_block_size_bytes = var.physical_block_size_bytes
  labels                    = var.labels
  description               = var.description
  size                      = var.size
  provisioned_iops          = var.provisioned_iops
  snapshot                  = var.snapshot
  project                   = var.project

}
