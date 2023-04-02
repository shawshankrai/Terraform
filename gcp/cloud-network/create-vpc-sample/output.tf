output "auto-vpc" {
  value = google_compute_network.auto-vpc.id
}

output "custom-vpc" {
  value = google_compute_network.custom-vpc.id
}