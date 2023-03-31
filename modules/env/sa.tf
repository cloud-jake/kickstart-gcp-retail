# User Event Pipeline
resource "google_service_account" "user_event_pipeline" {
  account_id   = "retail-user-event-pipeline"
  display_name = "retail-user-event-pipeline"
  project      = google_project.base.project_id
}

# Retail Search
resource "google_service_account" "search" {
  account_id   = "retail-search"
  display_name = "retail-search"
  project      = google_project.base.project_id
}

# Index Manager
resource "google_service_account" "index_manager" {
  account_id   = "retail-index-manager"
  display_name = "retail-index-manager"
  project      = google_project.base.project_id
}