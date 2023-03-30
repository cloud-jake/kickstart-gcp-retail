# User Event Pipeline
resource "google_service_account" "user_event_pipeline" {
  account_id   = "retail-user-event-pipeline@${google_project.base.id}.iam.gserviceaccount.com"
  display_name = "retail-user-event-pipeline"
  project      = google_project.base.id
}

# Retail Search
resource "google_service_account" "search" {
  account_id   = "retail-search@${google_project.base.id}.iam.gserviceaccount.com"
  display_name = "retail-search"
  project      = google_project.base.id
}

# Index Manager
resource "google_service_account" "index_manager" {
  account_id   = "retail-index-manager@${google_project.base.id}.iam.gserviceaccount.com"
  display_name = "retail-index-manager"
  project      = google_project.base.id
}