resource "google_redis_instance" "redis-instance-one" {
  memory_size_gb = 1
  name           = "redis-instance-one"
  display_name   = "redis-instance-one-terraform"
  location_id    = "us-central1-a"

  # Can create and attach our own network as well
  authorized_network = "default"

  redis_version = "REDIS_5_0"
}