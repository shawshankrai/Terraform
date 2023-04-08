resource "google_cloud_run_service" "cloud-run-app-one" {
  # region not zone
  location = "us-central1"
  name     = "cloud-run-app-one"
  template {
    spec {
      containers {
        # image = "us-docker.pkg.dev/cloudrun/container/hello"
        image = "us-docker.pkg.dev/google-samples/containers/gke/hello-app:1.0"
        ports {
          name           = "http1"
          container_port = 8080
          protocol       = "TCP"
        }
      }
    }
  }

  traffic {
    percent = 50
    revision_name = "cloud-run-app-one-97gfm"
  }

  traffic {
    percent = 50
    revision_name = "cloud-run-app-one-v4xx6"
  }

}

resource "google_cloud_run_service_iam_policy" "cloud_run_iam_policy_one" {
  service     = google_cloud_run_service.cloud-run-app-one.name
  location    = google_cloud_run_service.cloud-run-app-one.location
  policy_data = data.google_iam_policy.cloud-run-public-access.policy_data

  depends_on = [data.google_iam_policy.cloud-run-public-access]
}

data "google_iam_policy" "cloud-run-public-access" {
  binding {
    role = "roles/run.invoker"
    members = ["allUsers"]
  }
}