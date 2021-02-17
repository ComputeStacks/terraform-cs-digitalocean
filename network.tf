resource "digitalocean_floating_ip" "cluster_vip" {
  droplet_id = digitalocean_droplet.node_cluster[0].id
  region = var.region
}
