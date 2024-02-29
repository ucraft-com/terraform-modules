output get_latest_migration_version {
  value       = data.external.get_latest_migration_version.result["latest_version"]
}
