terraform {
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.5"
    }
  }
}
provider "digitalocean" {
	token = var.do_token
}

##
# Password Generation
resource "random_string" "pg_password" {
    length  = 24
    special = false
}
resource "random_string" "loki_password" {
    length  = 24
    special = false
}
resource "random_string" "prometheus_password" {
    length  = 24
    special = false
}
resource "random_string" "backup_key" {
    length  = 24
    special = true
}
resource "random_string" "app_id" {
    length  = 8
    special = false
}
resource "random_string" "network_name" {
    length  = 6
    special = false
}
resource "random_string" "cs_admin_password" {
    length  = 12
    special = true
}
