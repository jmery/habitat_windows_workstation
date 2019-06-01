resource "google_compute_firewall" "hab_ws_ingress" {
  name      = "hab-ws-ingress-${random_id.instance_id.hex}"
  network   = "${google_compute_network.hab_ws_net.name}"
  direction = "INGRESS"

  allow {
    protocol = "tcp"
    ports    = ["3389", "9631", "9638"]
  }

  allow {
    protocol = "udp"
    ports    = ["9638"]
  }

  allow {
    protocol = "icmp"
  }
}

resource "google_compute_firewall" "hab_ws_egress" {
  name      = "hab-ws-egress-${random_id.instance_id.hex}"
  network   = "${google_compute_network.hab_ws_net.name}"
  direction = "EGRESS"

  allow {
    protocol = "tcp"
    ports    = ["0-65535"]
  }

 allow {
    protocol = "udp"
    ports    = ["0-65535"]
  }

  allow {
    protocol = "icmp"
  }
}

resource "google_compute_firewall" "hab_ws_internal" {
  name      = "hab-ws-internal-${random_id.instance_id.hex}"
  network   = "${google_compute_network.hab_ws_net.name}"
  direction = "INGRESS"
  source_ranges = ["${data.google_compute_subnetwork.hab_ws_subnet.ip_cidr_range}"]

  allow {
    protocol = "tcp"
    ports    = ["0-65535"]
  }

 allow {
    protocol = "udp"
    ports    = ["0-65535"]
  }

  allow {
    protocol = "icmp"
  }
}