resource google_storage_bucket "storage_bucket" {
  name = "shashank-iam-gcs-bucket-1"
  location = "US-CENTRAL1"
  project = "terraform-gcp-382215"
  storage_class = "NEARLINE"
  labels = {
    env = "tf_dev"
    dept = "tf_audit"
  }
  uniform_bucket_level_access = true
  lifecycle_rule {
    condition {
      age = 5
    }
    action {
      type = "SetStorageClass"
      storage_class = "COLDLINE"
    }
  }
  retention_policy {
    retention_period = 300 # in seconds
    is_locked = true
  }
}

resource "google_storage_bucket_object" "upload_picture" {
  bucket = google_storage_bucket.storage_bucket.name
  name   = "name_of_object"
  source = "pic.jpg"

}
