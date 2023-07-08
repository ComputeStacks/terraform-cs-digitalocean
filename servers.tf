resource "digitalocean_droplet" "controller" {
  region     = var.region
  image      = var.droplet_image_debian
  name       = "controller"
  size       = var.plan_controller
  backups    = var.controller_enable_backups
  monitoring = true
  ipv6       = true
  user_data  = var.cloudinit_debian
  ssh_keys   = var.ssh_keys
  vpc_uuid   = digitalocean_vpc.computestacks.id
}

resource "digitalocean_droplet" "backup" {
  region     = var.region
  image      = var.droplet_image_debian
  name       = "backup"
  size       = var.plan_backup
  backups    = var.backup_enable_backups
  monitoring = true
  ipv6       = true
  user_data  = var.cloudinit_debian
  ssh_keys   = var.ssh_keys
  vpc_uuid   = digitalocean_vpc.computestacks.id
}

resource "digitalocean_droplet" "node" {
  region     = var.region
  image      = var.droplet_image_debian
  name       = "node100"
  size       = var.plan_node
  backups    = var.node_enable_backups
  monitoring = true
  ipv6       = true
  user_data  = var.cloudinit_debian
  ssh_keys   = var.ssh_keys
  vpc_uuid   = digitalocean_vpc.computestacks.id
}

resource "digitalocean_droplet" "metrics" {
  region     = var.region
  image      = var.droplet_image_debian
  name       = "metrics"
  size       = var.plan_metrics
  backups    = var.metrics_enable_backups
  monitoring = true
  ipv6       = true
  user_data  = var.cloudinit_debian
  ssh_keys   = var.ssh_keys
  vpc_uuid   = digitalocean_vpc.computestacks.id
}

resource "digitalocean_droplet" "registry" {
  region     = var.region
  image      = var.droplet_image_debian
  name       = "registry"
  size       = var.plan_registry
  backups    = var.registry_enable_backups
  monitoring = true
  ipv6       = true
  user_data  = var.cloudinit_debian
  ssh_keys   = var.ssh_keys
  vpc_uuid   = digitalocean_vpc.computestacks.id
}

resource "digitalocean_droplet" "nsone" {
  region     = var.region
  image      = var.droplet_image_debian
  name       = "ns1"
  size       = var.plan_nameserver
  backups    = var.nameserver_enable_backups
  monitoring = true
  ipv6       = true
  user_data  = var.cloudinit_debian
  ssh_keys   = var.ssh_keys
  vpc_uuid   = digitalocean_vpc.computestacks.id
}

resource "digitalocean_droplet" "nstwo" {
  region     = var.region_nstwo
  image      = var.droplet_image_debian
  name       = "ns2"
  size       = var.plan_nameserver
  backups    = var.nameserver_enable_backups
  monitoring = true
  ipv6       = true
  user_data  = var.cloudinit_debian
  ssh_keys   = var.ssh_keys
  vpc_uuid   = digitalocean_vpc.computestacks_nstwo.id
}
