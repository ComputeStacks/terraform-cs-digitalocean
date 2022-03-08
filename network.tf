resource "digitalocean_vpc" "computestacks" {
  name     = var.droplet_vpc_name
  region   = var.region
  ip_range = var.droplet_vpc_net
}
resource "digitalocean_vpc" "computestacks_nstwo" {
  name     = var.ns2_vpc_name
  region   = var.region_nstwo
  ip_range = var.ns2_vpc_net
}
resource "digitalocean_floating_ip" "cluster_vip" {
  droplet_id = digitalocean_droplet.node_cluster[0].id
  region     = var.region
}
