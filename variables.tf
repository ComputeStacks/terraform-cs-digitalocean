variable "do_token" {
	type = string
}

variable "region" {
	type = string
	default = "sfo3"
}

variable "ssh_keys" {
	type = list
	default = []
}

##
# Droplet Image

# Default = Debian 10
variable "droplet_image_default" {
	type = bool
	default = true
}
variable "droplet_image_centos" {
	type = string
	default = "centos-7-x64"
}
variable "droplet_image_debian" {
	type = string
	default = "debian-10-x64"
}
variable "cloudinit_centos" {
	type = string
	default = <<EOF
#!/usr/bin/bash
yum -y update && yum -y install epel-release kernel-headers && yum -y install ansible
EOF
}
variable "cloudinit_debian" {
	type = string
	default = <<EOF
#!/usr/bin/bash
apt update && apt -y install openssl ca-certificates linux-headers-amd64 python3 python3-pip python3-openssl python3-apt && pip3 install ansible
EOF
}

# Controller
variable "plan_controller" {
	type = string
	default = "c-4"
}
variable "controller_enable_backups" {
	type = bool
	default = true
}

# Node
variable "node_count" {
	type = number
	default = 3
}
variable "node_enable_backups" {
	type = bool
	default = true
}
# Used to create a consistent naming scheme for our nodes.
# This is for our recommend hostname scheme for nodes:
# * 3 digits for each node, following an identifier like 'node'.
# * 1st digit is the region (e.g. 1, 2, 3)
# * 2nd digit is the availability-zone
# * 3rd digit is the node.
variable "node_base_name" {
	type = string
	default = "10" # '10' would create node101, node102, node103, etc.
}
variable "plan_node" {
	type = string
	default = "g-4vcpu-16gb"
}


# Backup
variable "plan_backup" {
	type = string
	default = "s-1vcpu-1gb"
}
variable "backup_enable_backups" {
	type = bool
	default = true
}
variable "backup_volume_size" {
	type = number
	default = 100
}

# Prometheus & Loki
variable "dedicated_metrics_server" {
	type = bool
	default = true # false = place loki/prom on the controller
}
variable "metrics_enable_backups" {
	type = bool
	default = true
}
variable "plan_metrics" {
	type = string
	default = "c-2"
}

# Registry
variable "dedicated_registry_server" {
	type = bool
	default = true # false = place loki/prom on the controller
}
variable "registry_enable_backups" {
	type = bool
	default = true
}
variable "plan_registry" {
	type = string
	default = "s-2vcpu-4gb"
}

##
# ComputeStacks
variable "license_key" {
	type = string
	default = ""
}
variable "region_name" {
	type = string
	default = "digitalocean"
}
variable "cs_app_url" {
	type = string
	default = "a.do"
}
variable "cs_currency" {
	type = string
	default = "USD"
}
variable "cs_network_range" {
	type = string
	default = "10.100.10.0/24"
}

##
# Domains
variable "zone_name" {
	type = string
}
variable "cs_portal_domain" {
	type = string
	default = "portal.do"
}
variable "cs_registry_domain" {
	type = string
	default = "cr.do"
}
variable "cs_metrics_domain" {
	type = string
	default = "metrics.do"
}

##
# DNS
variable "use_do_ns" {
	type = bool
	default = false
}
variable "zone_ttl" {
	type = number
	default = 3600
}

##
# SSL
variable "use_zerossl" {
	type = bool
	default = true
}
variable "acme_challenge_method" {
	type = string
	default = "http"
}
variable "acme_cf_token" {
	type = string
	default = ""
}
variable "acme_cf_account" {
	type = string
	default = ""
}

##
# Digital Ocean Projects
variable "do_project_name" {
	type = string
	default = "ComputeStacks"
}
variable "do_project_description" {
	type = string
	default = "ComputeStacks Deployment"
}
variable "do_project_env" {
	type = string
	default = "Production" # Development, Staging, Production
}

# Admin User
variable "cs_admin_create" {
	type = bool
	default = true
}
variable "cs_admin_email" {
	type = string
	default = "root@localhost"
}
