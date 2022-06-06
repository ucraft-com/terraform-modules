locals {
  hostname      = var.hostname == "" ? "default" : var.hostname
  num_instances = length(var.static_ips) == 0 ? var.num_instances : length(var.static_ips)

  static_ips = concat(var.static_ips, ["NOT_AN_IP"])
  project_id = length(regexall("/projects/([^/]*)", var.instance_template)) > 0 ? flatten(regexall("/projects/([^/]*)", var.instance_template))[0] : null

  network_interface = length(format("%s%s", var.network, var.subnetwork)) == 0 ? [] : [1]
}

data "google_compute_zones" "available" {
  project = local.project_id
  region  = var.region
}

resource "google_compute_instance_from_template" "compute_instance" {
  provider            = google
  count               = local.num_instances
  name                = var.add_hostname_suffix ? format("%s%s%s", local.hostname, var.hostname_suffix_separator, format("%03d", count.index + 1)) : local.hostname
  project             = local.project_id
  zone                = var.zone == null ? data.google_compute_zones.available.names[count.index % length(data.google_compute_zones.available.names)] : var.zone
  deletion_protection = var.deletion_protection


  dynamic "network_interface" {
    for_each = local.network_interface

    content {
      network            = var.network
      subnetwork         = var.subnetwork
      subnetwork_project = var.subnetwork_project
      network_ip         = length(var.static_ips) == 0 ? "" : element(local.static_ips, count.index)
      dynamic "access_config" {
        for_each = var.access_config
        content {
          nat_ip       = access_config.value.nat_ip
          network_tier = access_config.value.network_tier
        }
      }

      dynamic "alias_ip_range" {
        for_each = var.alias_ip_ranges
        content {
          ip_cidr_range         = alias_ip_range.value.ip_cidr_range
          subnetwork_range_name = alias_ip_range.value.subnetwork_range_name
        }
      }
    }
  }

  source_instance_template = var.instance_template
}

