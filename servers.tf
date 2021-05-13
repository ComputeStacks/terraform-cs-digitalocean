resource "digitalocean_droplet" "controller" {
  region = var.region
  image = var.droplet_image_debian
  name = "controller"
  size = var.plan_controller
  backups = var.controller_enable_backups  
  monitoring = true
  ipv6 = true
  private_networking = true
  user_data = var.cloudinit_debian
  ssh_keys = var.ssh_keys
}

resource "digitalocean_droplet" "backup" {
  region = var.region
  image = var.droplet_image_debian
  name = "backup"
  size = var.plan_backup
  backups = var.backup_enable_backups  
  monitoring = true
  ipv6 = true
  private_networking = true
  user_data = var.cloudinit_debian
  ssh_keys = var.ssh_keys
}

resource "digitalocean_droplet" "node_cluster" {
	count = var.node_count
  region = var.region
  image = var.droplet_image_debian
  name = format("node%s%s", var.node_base_name, count.index + 1)
  size = var.plan_node
  backups = var.node_enable_backups  
  monitoring = true
  ipv6 = true
  private_networking = true
  user_data = var.cloudinit_debian
  ssh_keys = var.ssh_keys
}

resource "digitalocean_droplet" "metrics" {
	count = var.dedicated_metrics_server ? 1 : 0
  region = var.region
  image = var.droplet_image_debian
  name = format("metrics%s%s", var.node_base_name, count.index + 1)
  size = var.plan_metrics
  backups = var.metrics_enable_backups  
  monitoring = true
  ipv6 = true
  private_networking = true
  user_data = var.cloudinit_debian
  ssh_keys = var.ssh_keys
}


resource "digitalocean_droplet" "registries" {
	count = var.dedicated_registry_server ? 1 : 0
  region = var.region
  image = var.droplet_image_debian
  name = "registry"
  size = var.plan_registry
  backups = var.registry_enable_backups  
  monitoring = true
  ipv6 = true
  private_networking = true
  user_data = var.cloudinit_debian
  ssh_keys = var.ssh_keys
}
