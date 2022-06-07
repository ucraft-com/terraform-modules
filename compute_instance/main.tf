resource "google_compute_instance" "default" {
  project      = var.project
  name         = var.name
  machine_type = var.machine_type
  zone         = var.zone

  tags = var.tags

  boot_disk {
    initialize_params {
      image = var.image
      size  = var.size
      type  = var.type
    }
  }

  scratch_disk {
    interface = "SCSI"

  }

  network_interface {
    network    = var.network
    subnetwork = var.subnetwork

    access_config {}
  }

  allow_stopping_for_update = var.allow_stopping_for_update
  can_ip_forward            = var.can_ip_forward
  description               = var.description
  deletion_protection       = var.deletion_protection
  labels                    = var.labels
  metadata                  = var.metadata
  metadata_startup_script   = var.metadata_startup_script

  service_account {
    scopes = var.scopes
  }
}

