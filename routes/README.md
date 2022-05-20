# Terraform Routes Module

It supports creating:

- Routes within vpc network.
- Optionally deletes the default internet gateway routes.

## Usage

Basic usage of this submodule is as follows:

```hcl
module "vpc" {
    source  = ""
    version = ""

    project_id   = "<PROJECT ID>"
    network_name = "example-vpc"

    routes = [
        {
            name                   = "egress-internet"
            description            = "route through IGW to access internet"
            destination_range      = "0.0.0.0/0"
            tags                   = "egress-inet"
            next_hop_internet      = "true"
        },
        {
            name                   = "app-proxy"
            description            = "route through proxy to reach app"
            destination_range      = "10.50.10.0/24"
            tags                   = "app-proxy"
            next_hop_instance      = "app-proxy-instance"
            next_hop_instance_zone = "us-west1-a"
        },
    ]
}
```
