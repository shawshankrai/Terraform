resource "google_compute_instance" "instance-one" {
  machine_type = "n1-standard-2"
  name         = "instance-one"
  zone         = "us-central1-a"

  # if we want to update machine type in future
  allow_stopping_for_update = true

  network_interface {
    network    = "custom-vpc"
    subnetwork = "subnet-us-1"
  }

  boot_disk {
    initialize_params {
      image = "debian-11-bullseye-v20230306"
      size  = 10
    }
    auto_delete = true
  }

  labels = {
    # labels accept only small letters
    "env" = "dev"
  }

  scheduling {
    # make instance temporary if true, can be taken back with 30s of notice and is available for 24 hrs
    preemptible = false
    # this needs to be set as false if preemptible is true
    automatic_restart = true
  }

  service_account {
    email = "terraform-gcp@terraform-gcp-382215.iam.gserviceaccount.com"
    scopes = ["cloud-platform"]
  }

  lifecycle {
    ignore_changes = [attached_disk]
  }
}

resource "google_compute_disk" "compute-disk-1" {
  name = "compute-disk-1"
  type = "pd-ssd"
  size = 10
  zone = "us-central1-a"
  labels = {
    "env" = "dev"
  }
  # if required
  # image = "debian-11-bullseye-v20220719"
}

resource "google_compute_attached_disk" "attach-disk-to-vm-instance" {
  disk     = google_compute_disk.compute-disk-1.id
  instance = google_compute_instance.instance-one.id

  depends_on = [google_compute_disk.compute-disk-1, google_compute_instance.instance-one]
}