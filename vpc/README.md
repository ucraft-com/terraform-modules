# Terraform VPC Module

It supports creating:

- A VPC Network
- Optionally enabling the network as a Shared VPC host

## Usage

Basic usage of this submodule is as follows:

```hcl
module "vpc" {
    source  = ""
    
    project_id   = "<PROJECT ID>"
    network_name = "example-vpc"
    shared_vpc_host = false
}
```