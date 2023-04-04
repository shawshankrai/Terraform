output "auto-vpc" {
  value = google_compute_network.auto-vpc.id
}

output "custom-vpc" {
  value = google_compute_network.custom-vpc.id
}

output "subnetwork-us-one" {
  value = google_compute_subnetwork.subnetwork-us-one.id
}

output "firewall-allow-icmp" {
  value = google_compute_firewall.allow-icmp.id
}