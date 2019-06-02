resource "google_compute_address" "hab_ws_ext_ip" {
  name = "hab-ws-ext-ip-${random_id.instance_id.hex}"
  address_type = "EXTERNAL"
}

resource "google_dns_record_set" "hab_ws_dns" {
  project = "${data.google_dns_managed_zone.chef-demo.project}"
  name = "${local.hostname}.${data.google_dns_managed_zone.chef-demo.dns_name}"
  managed_zone = "${data.google_dns_managed_zone.chef-demo.name}"
  type = "A"
  ttl  = 300

  rrdatas = ["${google_compute_address.hab_ws_ext_ip.address}"]
}

resource "google_compute_instance" "hab_ws" {
  name         = "${local.hostname}-${random_id.instance_id.hex}"
  hostname     = "${local.fqdn}"
  machine_type = "${var.hab_ws_machine_type}"
  zone         = "${data.google_compute_zones.available.names[0]}" // Default to first available zone
  allow_stopping_for_update = true // Let Terraform resize on the fly if needed

  labels {
    x-contact     = "${var.label_contact}"
    x-customer    = "${var.label_customer}"
    x-project     = "${var.label_project}"
    x-dept        = "${var.label_dept}"
    x-application = "${var.label_application}"
    x-ttl         = "${var.label_ttl}"
  }

  boot_disk {
    auto_delete = true
    initialize_params {
      type = "pd-ssd"
      size = 100
      image = "win-2016-hab-ws"
    }
  }

  network_interface {
    network = "${google_compute_network.hab_ws_net.name}"
    access_config {
      nat_ip = "${google_compute_address.hab_ws_ext_ip.address}"
    }
  }
}
