# Steps
# 1. Create Code storage bucket
# 2. Upload index.zip
# 3. Deploy Function
# 4. Policy binding

# 1. Create Code storage bucket
resource "google_storage_bucket" "code-storage-bucket" {
  location = "us-central1"
  name     = "shashank-iam-gcp-code-storage-bucket-one"
}

# 2. Upload index.zip
resource "google_storage_bucket_object" "source-code-zip" {
  bucket = google_storage_bucket.code-storage-bucket.id
  name   = "index.zip"
  source = "./code/index.zip"

  depends_on = [google_storage_bucket.code-storage-bucket]
}

# 3. Deploy Function
resource "google_cloudfunctions_function" "cloud-function-one" {
  name                = "cloud-function-one"
  runtime             = "nodejs18"
  description         = "Function from Terraform script"
  available_memory_mb = 128

  source_archive_bucket = google_storage_bucket.code-storage-bucket.name
  source_archive_object = google_storage_bucket_object.source-code-zip.name
  trigger_http          = true
  entry_point           = "helloWorld"

  depends_on = [google_storage_bucket.code-storage-bucket, google_storage_bucket_object.source-code-zip]
}

# 4(a). Policy Data
data "google_iam_policy" "google_cloud_function_policy_data" {
  binding {
    role    = "roles/cloudfunctions.invoker"
    members = ["allUsers"]
  }
}

# 4(a). Cloud function Policy
resource "google_cloudfunctions_function_iam_policy" "google_cloud_function_policy" {
  cloud_function = google_cloudfunctions_function.cloud-function-one.name
  policy_data    = data.google_iam_policy.google_cloud_function_policy_data.policy_data
  region         = google_cloudfunctions_function.cloud-function-one.region

  depends_on = [data.google_iam_policy.google_cloud_function_policy_data]
}