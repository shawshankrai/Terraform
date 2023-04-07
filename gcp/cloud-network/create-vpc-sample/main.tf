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
  region = "us-central1"
  private_ip_google_access = true
  depends_on = [google_compute_network.custom-vpc]
}

# ICMP (Internet Control Message Protocol) is an error-reporting protocol
# that network devices such as routers use to generate error messages to the source IP address
# when network problems prevent delivery of IP packets.
resource "google_compute_firewall" "allow-icmp" {
  name    = "allow-icmp"
  network = google_compute_network.custom-vpc.id
  allow {
    protocol = "icmp"
  }

  # If source ranges are specified, the firewall will apply only to traffic that has source IP address in these ranges.
  # These ranges must be expressed in CIDR format.
  source_ranges = ["49.207.51.147/32"]
  priority = 455
  depends_on = [google_compute_network.custom-vpc]
}

resource "google_compute_firewall" "allow-ssh" {
  name    = "allow-ssh"
  network = google_compute_network.custom-vpc.id

  allow {
    protocol = "tcp"
    ports = [22]
  }
  source_ranges = ["0.0.0.0/0"]
  depends_on = [google_compute_network.custom-vpc]
}

