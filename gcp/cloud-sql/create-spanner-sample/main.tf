resource "google_spanner_instance" "spanner-one" {
  config       = "regional-us-east5"
  display_name = "spanner-one"
  name = "spanner-one"
  num_nodes = 1
  labels = {
    "env" = "dev"
  }

}

resource "google_spanner_database" "database-one" {
  instance = google_spanner_instance.spanner-one.name
  name     = "database_one"
  deletion_protection = false
  ddl = ["CREATE TABLE t1 (t1 INT64 NOT NULL,) PRIMARY KEY(t1)"]
}
