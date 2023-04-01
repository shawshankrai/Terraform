terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "4.59.0"
    }
  }
}

provider "google" {
  # Configuration options
  project = "terraform-gcp-382215"
  region = "us-central1"
  zone = "us-central1-a"
  credentials = "../cred/terraform-gcp.json"
}

resource google_storage_bucket "cloud-storage-bucket" {
  name = "shashank-iam-terraform-cloud-storage-bucket-1"
  location = "US-CENTRAL1"
}
