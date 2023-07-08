variable "do_token" {
  type = string
}
variable "region" {
  type    = string
  default = "sfo3"
}

# List of fingerprints from your DO Account
variable "ssh_keys" {
  type    = list(any)
  default = []
}
# ssh-keygen -q -C "${USER}@cstacks-terraform" -t ed25519 -N '' -f ~/.ssh/cstacks-terraform <<<y >/dev/null 2>&1 && cat ~/.ssh/cstacks-terraform.pub
# Should also be installed into your DO Account and fingerprint listed above.
# This is used to populate the inventory.yml file and will be used by Ansible to provision.
variable "ssh_connection_priv_key_path" {
  type = string
  default = "~/.ssh/id_rsa"
  description = "Path to your private key"
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
  default = "debian-12-x64"
}
variable "cloudinit_debian" {
  type    = string
  default = <<EOF
#!/usr/bin/bash
apt-get update && apt-get -y install apt-utils software-properties-common jq curl wget lsb-release iputils-ping vim openssl dnsutils ca-certificates linux-headers-amd64 python3 python3-pip python3-openssl python3-apt
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
variable "node_enable_backups" {
  type    = bool
  default = true
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


##
# CloudFlare Auto Provisioning
#acme_cf_token: "" # API Token
#acme_cf_account: "" # Account ID
variable "cloudflare_api_token" {
  type = string
  default = ""
}
variable "cloudflare_account_id" {
  type = string
  default = ""
}
variable "cloudflare_proxied" {
  type = bool
  default = false
  description = "Enable if you want cloudflare to proxy your traffic."
}
