# Google Cloud VPC Firewall Rules

This module allows creation of custom VPC firewall rules.

## Usage

Basic usage of this module is as follows:

```hcl
module "firewall_rules" {
  source       = "github.com/ucraft-com/terraform-modules//firewall_rules?ref=0.2.0"
  project_id   = var.project_id
  network_name = module.vpc.network_name
  rules = [{
    name                    = "allow-ssh-ingress"
    description             = null
    direction               = "INGRESS"
    priority                = null
    ranges                  = ["0.0.0.0/0"]
    source_tags             = null
    source_service_accounts = null
    target_tags             = null
    target_service_accounts = null
    allow = [{
      protocol = "tcp"
      ports    = ["22"]
    }]
    deny = []
    log_config = {
      metadata = "INCLUDE_ALL_METADATA"
    }
  }]
}
```