provider "google" {
 credentials = "${file("${var.gcp_credentials_file}")}"
 project = "${var.gcp_project}"
 region = "${var.gcp_region}"
}

resource "random_id" "instance_id" {
  byte_length = 4
}

data "google_compute_zones" "available" {
}

data "google_dns_managed_zone" "chef-demo" {
  project = "${var.hab_ws_dns_zone_project}"
  name = "${var.hab_ws_dns_zone_name}"
}

locals {
  // Set hostname
  hostname = "${var.hab_ws_hostname}-${var.label_customer}-${var.hab_ws_count}"
  // GCP returns a trailing '.' from the managed zone data that needs to be stripped
  fqdn = "${local.hostname}.${substr(data.google_dns_managed_zone.chef-demo.dns_name, 0, length(data.google_dns_managed_zone.chef-demo.dns_name) - 1)}"
}

resource "google_compute_network" "hab_ws_net" {
  name = "hab-ws-net-${random_id.instance_id.hex}"
}

data "google_compute_subnetwork" "hab_ws_subnet" {
  name   = "${google_compute_network.hab_ws_net.name}"
}
