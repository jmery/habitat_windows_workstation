output "hab_workstation_public_ip" {
  value = "${google_compute_instance.hab_ws.network_interface.0.access_config.0.nat_ip}"
}

output "hab_workstation_dns" {
  value = "${substr(google_dns_record_set.hab_ws_dns.name, 0, length(google_dns_record_set.hab_ws_dns.name) - 1)}"
}
