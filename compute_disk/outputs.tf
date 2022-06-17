output "gcp_disk_name" {
  description = "Name of the disk"
  value       = "google_disk.gcp_disk_name"
}

output "gcp_disk_type" {
  description = "URL of the disk type resource describing which disk type to use to create the disk"
  value       = "google_disk.gcp_disk_type"
}

output "gcp_disk_zone" {
  description = "A reference to the zone where the disk resides"
  value       = "google_compute_disk.gcp_disk_zone"
}

output "gcp_disk_image" {
  description = "The image from which to initialize this disk"
  value       = "google_compute_disk.gcp_disk_image"
}

output "physical_block_size_bytes" {
  description = "Physical block size of the persistent disk, in bytes"
  value       = "google_compute_disk.gcp_disk_physical_block_size_bytes"
}

output "gcp_disk_labels" {
  description = "Labels to apply to this disk"
  value       = "google_compute_disk.gcp_disk_labels"
}
