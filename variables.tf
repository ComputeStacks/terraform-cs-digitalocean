variable "do_token" {
  type = string
}

variable "region" {
  type    = string
  default = "sfo3"
}

variable "ssh_keys" {
  type    = list(any)
  default = []
}

##
# VPC
variable "droplet_vpc_name" {
	type = string
	default = "primary"
}
variable "droplet_vpc_net" {
	type    = string
	default = "10.0.0.0/24"
}

# NS2 VPC
variable "ns2_vpc_name" {
	type = string
	default = "secondary"
}
variable "ns2_vpc_net" {
	type    = string
	default = "10.1.0.0/24"
}

##
# Droplet Image
variable "droplet_image_debian" {
  type    = string
  default = "debian-11-x64"
}
variable "cloudinit_debian" {
  type    = string
  default = <<EOF
#!/usr/bin/bash
apt update && apt -y install openssl ca-certificates linux-headers-amd64 python3 python3-pip python3-openssl python3-apt && pip3 install ansible
EOF
}

# Controller
variable "plan_controller" {
  type    = string
  default = "c-4"
}
variable "controller_enable_backups" {
  type    = bool
  default = true
}

# Node
variable "node_count" {
  type    = number
  default = 3
}
variable "node_enable_backups" {
  type    = bool
  default = true
}
# Used to create a consistent naming scheme for our nodes.
# This is for our recommend hostname scheme for nodes:
# * 3 digits for each node, following an identifier like 'node'.
# * 1st digit is the region (e.g. 1, 2, 3)
# * 2nd digit is the availability-zone
# * 3rd digit is the node.
variable "node_base_name" {
  type    = string
  default = "10" # '10' would create node101, node102, node103, etc.
}
variable "plan_node" {
  type    = string
  default = "g-4vcpu-16gb"
}


# Backup
variable "plan_backup" {
  type    = string
  default = "s-1vcpu-1gb"
}
variable "backup_enable_backups" {
  type    = bool
  default = true
}
variable "backup_volume_size" {
  type    = number
  default = 100
}

# Prometheus & Loki
variable "metrics_enable_backups" {
  type    = bool
  default = true
}
variable "plan_metrics" {
  type    = string
  default = "c-2"
}

# Registry
variable "registry_enable_backups" {
  type    = bool
  default = true
}
variable "plan_registry" {
  type    = string
  default = "s-2vcpu-4gb"
}

##
# PowerDNS
variable "plan_nameserver" {
  type    = string
  default = "s-1vcpu-1gb"
}
variable "region_nstwo" {
  type    = string
  default = "nyc3"
}
variable "nameserver_enable_backups" {
	type    = bool
	default = true
}

variable "primary_nameserver_zone" {
  type    = string
  default = ""
}

variable "secondary_nameserver_zone" {
  type    = string
  default = ""
}
variable "primary_nameserver_domain" {
  type    = string
  default = ""
}

variable "secondary_nameserver_domain" {
  type    = string
  default = ""
}

##
# ComputeStacks
variable "region_name" {
  type    = string
  default = "digitalocean"
}
variable "cs_app_url" {
  type    = string
  default = "a.do"
}
variable "cs_currency" {
  type    = string
  default = "USD"
}
variable "cs_network_range" {
  type    = string
  default = "10.100.0.0/21"
}

##
# Domains
variable "zone_name" {
  type = string
}
variable "cs_portal_domain" {
  type    = string
  default = "portal.do"
}
variable "cs_registry_domain" {
  type    = string
  default = "cr.do"
}
variable "cs_metrics_domain" {
  type    = string
  default = "metrics.do"
}

##
# Digital Ocean Projects
variable "do_project_name" {
  type    = string
  default = "ComputeStacks"
}
variable "do_project_description" {
  type    = string
  default = "ComputeStacks Deployment"
}
variable "do_project_env" {
  type    = string
  default = "Production" # Development, Staging, Production
}

# Admin User
variable "cs_admin_email" {
  type    = string
  default = "root@cstacks.local"
}
