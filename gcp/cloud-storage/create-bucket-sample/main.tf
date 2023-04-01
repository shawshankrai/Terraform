resource google_storage_bucket "storage_bucket" {
  name = "shashank-iam-gcs-bucket-1"
  location = "US-CENTRAL1"
  project = "terraform-gcp-382215"
  storage_class = "NEARLINE"
  labels = {
    env = "tf_dev"
    dept = "tf_audit"
  }
}