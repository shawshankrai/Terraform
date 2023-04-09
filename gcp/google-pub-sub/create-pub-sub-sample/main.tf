# Steps
# 1. Create topic
# 2. Create Schema
# 3. Create Subscription

# 1. Create topic
resource "google_pubsub_topic" "topic-one" {
  name = "topic-one"
  schema_settings {
    schema   = google_pubsub_schema.schema-one.id
    encoding = "JSON"
  }

  depends_on = [google_pubsub_schema.schema-one]
}

# 2. Create Schema
resource "google_pubsub_schema" "schema-one" {
  name       = "schema-one"
  type       = "AVRO"
  definition = "{\n  \"type\" : \"record\",\n  \"name\" : \"Avro\",\n  \"fields\" : [\n    {\n      \"name\" : \"Name\",\n      \"type\" : \"string\"\n    },\n    {\n      \"name\" : \"Age\",\n      \"type\" : \"int\"\n    }\n  ]\n}\n"
}

# 3. Create Subscription
resource "google_pubsub_subscription" "subscription-one" {
  name                       = "subscription-one"
  topic                      = google_pubsub_topic.topic-one.id
  # How long to retain unacknowledged messages in the subscription's backlog, from the moment a message is published.
  message_retention_duration = "1200s"
  retain_acked_messages      = true
  # Wait for receiving ack till
  ack_deadline_seconds       = 20
  # Message expiration
  expiration_policy {
    ttl = "300000.5s"
  }
  retry_policy {
    minimum_backoff = "10s"
  }
  enable_message_ordering = false

  depends_on = [google_pubsub_topic.topic-one]
}