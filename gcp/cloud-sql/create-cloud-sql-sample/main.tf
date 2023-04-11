# Steps
# 1. Create DB instance
# 2. Create sql user

# 1. Create DB instance
resource "google_sql_database_instance" "database-instance-one" {
  name = "database-instance-one"
  database_version = "MYSQL_8_0"
  region = "us-central1"
  deletion_protection = false
  settings {
    tier = "db-f1-micro"
  }
}

# 2. Create sql user
resource "google_sql_user" "sql-user-one" {
  instance = google_sql_database_instance.database-instance-one.id
  name     = "sql-user-one"
  # Use Hashi corp. vault in place of plain text
  password = "root"
}