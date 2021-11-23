resource "google_storage_bucket" "static-site" {
  name     = "test-bucket-${var.project}"
  location = "US"
}
