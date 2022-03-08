data "digitalocean_project" "computestacks" {
  name = var.do_project_name
}
resource "digitalocean_project_resources" "computestacks_project_resources" {
  project = data.digitalocean_project.computestacks.id
  resources = [
    digitalocean_droplet.controller.urn,
    digitalocean_droplet.backup.urn,
    digitalocean_droplet.metrics.urn,
    digitalocean_droplet.registry.urn,
    digitalocean_droplet.nsone.urn,
    digitalocean_droplet.nstwo.urn,
    digitalocean_volume.backup_volume.urn,
    digitalocean_floating_ip.cluster_vip.urn
  ]
}
resource "digitalocean_project_resources" "computestacks_nodes" {
  project   = data.digitalocean_project.computestacks.id
  resources = digitalocean_droplet.node_cluster.*.urn
}
