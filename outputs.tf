resource "local_file" "Inventory" {
	content = templatefile("outputs/inventory.yml.tmpl", {
		ssh_priv_key = var.ssh_connection_priv_key_path,
		do_token = var.do_token,
		registry_public = digitalocean_droplet.registry.ipv4_address,
		registry_private = digitalocean_droplet.registry.ipv4_address_private,		
		node_public = digitalocean_droplet.node.ipv4_address,
		node_private = digitalocean_droplet.node.ipv4_address_private,
		metrics_public = digitalocean_droplet.metrics.ipv4_address,		
		metrics_private = digitalocean_droplet.metrics.ipv4_address_private,
		controller_public = digitalocean_droplet.controller.ipv4_address,		
		controller_private = digitalocean_droplet.controller.ipv4_address_private,
		backup_public = digitalocean_droplet.backup.ipv4_address,
		backup_private = digitalocean_droplet.backup.ipv4_address_private,
		nsone_public = digitalocean_droplet.nsone.ipv4_address,		
		nsone_private = digitalocean_droplet.nsone.ipv4_address_private,
		nstwo_public = digitalocean_droplet.nstwo.ipv4_address,		
		pg_pass = random_string.pg_password.result,
		loki_pass = random_string.loki_password.result,
		prom_pass = random_string.prometheus_password.result,
		backup_key = random_string.backup_key.result,
		app_id = random_string.app_id.result,
		network_name = lower(random_string.network_name.result),
		network_range = var.cs_network_range,
		region_name = var.region_name,
		currency = var.cs_currency,
		zone_name = var.zone_name,
		cs_app_url = format("%s.%s", var.cs_app_url, var.zone_name),
		cs_portal_domain = format("%s.%s", var.cs_portal_domain, var.zone_name),
		cs_registry_domain = format("%s.%s", var.cs_registry_domain, var.zone_name),
		cs_metrics_domain = format("%s.%s", var.cs_metrics_domain, var.zone_name),
		primary_nameserver_domain = format("%s.%s", var.primary_nameserver_domain, var.primary_nameserver_zone),
		secondary_nameserver_domain = format("%s.%s", var.secondary_nameserver_domain, var.secondary_nameserver_zone),
		cs_admin_email = var.cs_admin_email,
		cs_admin_password = random_string.cs_admin_password.result
	})
	filename = "result/inventory.yml"
}

resource "local_file" "dns_settings" {
	content = templatefile("outputs/dns_settings.txt.tmpl", {
		cs_app_url = format("%s.%s", var.cs_app_url, var.zone_name),
		cs_portal_domain = format("%s.%s", var.cs_portal_domain, var.zone_name),
		cs_registry_domain = format("%s.%s", var.cs_registry_domain, var.zone_name),
		cs_metrics_domain = format("%s.%s", var.cs_metrics_domain, var.zone_name),
		node_public = digitalocean_droplet.node.ipv4_address,
		controller_public = digitalocean_droplet.controller.ipv4_address,
		metrics_public = digitalocean_droplet.metrics.ipv4_address,
		registry_public = digitalocean_droplet.registry.ipv4_address,
		nsone_public = digitalocean_droplet.nsone.ipv4_address,
		nstwo_public = digitalocean_droplet.nstwo.ipv4_address,
		controller_public_ipv6 = digitalocean_droplet.controller.ipv6_address,
		node_public_ipv6 = digitalocean_droplet.node.ipv6_address,
		metrics_public_ipv6 = digitalocean_droplet.metrics.ipv6_address,
		registry_public_ipv6 = digitalocean_droplet.registry.ipv6_address,
		nsone_public_ipv6 = digitalocean_droplet.nsone.ipv6_address,
		nstwo_public_ipv6 = digitalocean_droplet.nstwo.ipv6_address,
		primary_nameserver_domain = format("%s.%s", var.primary_nameserver_domain, var.primary_nameserver_zone),
		secondary_nameserver_domain = format("%s.%s", var.secondary_nameserver_domain, var.secondary_nameserver_zone)
	})
	filename = "result/dns_settings.txt"
}
