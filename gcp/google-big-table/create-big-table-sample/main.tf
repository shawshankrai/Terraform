resource "google_bigtable_instance" "big-table-one" {
  name = "big-table-one"
  deletion_protection = false

  labels = {
    "env" = "dev"
  }

  cluster {
    cluster_id = "big-table-cluster-one"
    num_nodes = 1
    storage_type = "SSD"
  }
}

resource "google_bigtable_table" "big-table-table-one" {
  instance_name = google_bigtable_instance.big-table-one.name
  name          = "big-table-table-one"
}