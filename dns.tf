resource "digitalocean_record" "zone_portal_ipv4" {
    count = var.use_do_ns ? 1 : 0
    domain = var.zone_name
    name = var.cs_portal_domain
    type = "A"
    ttl = var.zone_ttl
    value = digitalocean_droplet.controller.ipv4_address
}
resource "digitalocean_record" "zone_portal_ipv6" {
    count = var.use_do_ns ? 1 : 0
    domain = var.zone_name
    name = var.cs_portal_domain
    type = "AAAA"
    ttl = var.zone_ttl
    value = digitalocean_droplet.controller.ipv6_address
}
resource "digitalocean_record" "zone_registry_ipv4" {
    count = var.use_do_ns ? 1 : 0
    domain = var.zone_name
    name = var.cs_registry_domain
    type = "A"
    ttl = var.zone_ttl
    value = var.dedicated_registry_server ? digitalocean_droplet.registries.*.ipv4_address[0] : digitalocean_droplet.controller.ipv4_address
}
resource "digitalocean_record" "zone_registry_ipv6" {
    count = var.use_do_ns ? 1 : 0
    domain = var.zone_name
    name = var.cs_registry_domain
    type = "AAAA"
    ttl = var.zone_ttl
    value = var.dedicated_registry_server ? digitalocean_droplet.registries.*.ipv6_address[0] : digitalocean_droplet.controller.ipv6_address
}
resource "digitalocean_record" "zone_metrics_ipv4" {
    count = var.use_do_ns ? 1 : 0
    domain = var.zone_name
    name = var.cs_metrics_domain
    type = "A"
    ttl = var.zone_ttl
    value = var.dedicated_metrics_server ? digitalocean_droplet.metrics.*.ipv4_address[0] : digitalocean_droplet.controller.ipv4_address
}
resource "digitalocean_record" "zone_metrics_ipv6" {
    count = var.use_do_ns ? 1 : 0
    domain = var.zone_name
    name = var.cs_metrics_domain
    type = "AAAA"
    ttl = var.zone_ttl
    value = var.dedicated_metrics_server ? digitalocean_droplet.metrics.*.ipv6_address[0] : digitalocean_droplet.controller.ipv6_address
}
resource "digitalocean_record" "zone_app" {
    count = var.use_do_ns ? 1 : 0
    domain = var.zone_name
    name = var.cs_app_url
    type = "A"
    ttl = var.zone_ttl
    value = digitalocean_droplet.node_cluster.0.ipv4_address
}
resource "digitalocean_record" "zone_app_wildcard" {
    count = var.use_do_ns ? 1 : 0
    domain = var.zone_name
    name = format("*.%s", var.cs_app_url)
    type = "CNAME"
    ttl = var.zone_ttl
    value = format("%s.%s.", var.cs_app_url, var.zone_name)
}
