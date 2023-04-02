resource "google_compute_network" "auto-vpc" {
  name = "auto-vpc"
  auto_create_subnetworks = true
}

resource "google_compute_network" "custom-vpc" {
  name = "custom-vpc"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "subnetwork-us-one" {
  ip_cidr_range = "10.1.0.0/24"
  name          = "subnet-us-1"
  network       = google_compute_network.custom-vpc.id
  region = "US_CENTRAL1"
  depends_on = [google_compute_network.custom-vpc]
}

