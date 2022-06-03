output "address" {
  description = "All compute address attributes."
  value       = try(google_compute_address.address, null)
}

output "module_enabled" {
  description = "Whether the module is enabled."
  value       = var.module_enabled
}
