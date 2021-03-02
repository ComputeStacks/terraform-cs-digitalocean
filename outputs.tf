resource "local_file" "Inventory" {
	content = templatefile("outputs/inventory.yml.tmpl", {
		do_token = var.do_token,
		nodes = digitalocean_droplet.node_cluster.*.name,
		metrics_count = length(digitalocean_droplet.metrics),
		registry_count = length(digitalocean_droplet.registries),
		registry_public = digitalocean_droplet.registries.*.ipv4_address,
		registry_private = digitalocean_droplet.registries.*.ipv4_address_private,
		nodes_public = digitalocean_droplet.node_cluster.*.ipv4_address,
		nodes_private = digitalocean_droplet.node_cluster.*.ipv4_address_private,
		metrics_public = digitalocean_droplet.metrics.*.ipv4_address,
		metrics_private = digitalocean_droplet.metrics.*.ipv4_address_private,
		controller_public = digitalocean_droplet.controller.ipv4_address,
		controller_private = digitalocean_droplet.controller.ipv4_address_private,
		backup_public = digitalocean_droplet.backup.ipv4_address,
		backup_private = digitalocean_droplet.backup.ipv4_address_private,
		pg_pass = random_string.pg_password.result,
		loki_pass = random_string.loki_password.result,
		prom_pass = random_string.prometheus_password.result,
		backup_key = random_string.backup_key.result,
		floating_ip = digitalocean_floating_ip.cluster_vip.ip_address,
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
		license_key = var.license_key,
		use_zerossl = var.use_zerossl,
		acme_challenge_method = var.acme_challenge_method,
		acme_cf_account = var.acme_cf_account,
		acme_cf_token = var.acme_cf_token,
		default_image = var.droplet_image_default,
		cs_admin_create = var.cs_admin_create,
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
		registry_count = length(digitalocean_droplet.registries),
		metrics_count = length(digitalocean_droplet.metrics),
		nodes_public = digitalocean_droplet.node_cluster.*.ipv4_address,
		controller_public = digitalocean_droplet.controller.ipv4_address,
		metrics_public = digitalocean_droplet.metrics.*.ipv4_address,
		registry_public = digitalocean_droplet.registries.*.ipv4_address
	})
	filename = "result/dns_settings.txt"
}
