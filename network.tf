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
