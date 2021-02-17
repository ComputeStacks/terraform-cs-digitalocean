resource "digitalocean_volume" "backup_volume" {
  region = var.region
  name = "cs-backup-volume"
  size = var.backup_volume_size
  initial_filesystem_type = "ext4"
  description = "Volume for Backup Server"
}

resource "digitalocean_volume_attachment" "backup_volume" {
  droplet_id = digitalocean_droplet.backup.id
  volume_id = digitalocean_volume.backup_volume.id
}
