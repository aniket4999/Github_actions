provider "google" {
    project = "lyrical-chassis-467310-s2"
    region = "us-central1"

}


resource "google_storage_bucket" "tfe-bucket" {
    name = "tfe-bucket-123456789"
    location = "US"
    force_destroy = true

  uniform_bucket_level_access = true

  versioning {
    enabled = true
  }

  lifecycle_rule {
    condition {
      age = 30
    }
    action {
      type = "Delete"
    }
  }

  labels = {
    environment = "dev"
    team        = "analytics"
  }
  
}
