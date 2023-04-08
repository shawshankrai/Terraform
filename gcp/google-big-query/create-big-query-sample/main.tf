resource "google_bigquery_dataset" "dataset-one" {
  dataset_id = "dummy_dataset_one"
  delete_contents_on_destroy = true
}

resource "google_bigquery_table" "table-one" {
  dataset_id = google_bigquery_dataset.dataset-one.dataset_id
  table_id   = "dummy_table_one"
  deletion_protection = false

  depends_on = [google_bigquery_dataset.dataset-one]
}

