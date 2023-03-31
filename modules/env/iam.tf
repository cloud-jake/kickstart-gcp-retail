# Big Query
resource "google_project_iam_binding" "bigquery_dataeditor" {
  project = google_project.base.project_id
  role    = "roles/bigquery.dataEditor"
  members = [
    "serviceAccount:${google_service_account.user_event_pipeline.email}",
    "serviceAccount:${google_service_account.index_manager.email}"
  ]
}

# Retail
resource "google_project_iam_binding" "retail_admin" {
  project = google_project.base.project_id
  role    = "roles/retail.admin"

  members = [
    "group:retail-admin@${var.domain}",
    "group:retail-developer@${var.domain}"
  ]
}

resource "google_project_iam_binding" "retail_editor" {
  project = google_project.base.project_id
  role    = "roles/retail.editor"
  members = [
    "serviceAccount:${google_service_account.user_event_pipeline.email}",
    "serviceAccount:${google_service_account.index_manager.email}",
    "group:retail-editor@${var.domain}"
  ]
}

resource "google_project_iam_binding" "retail_viewer" {
  project = google_project.base.project_id
  role    = "roles/retail.viewer"
  members = [
    "serviceAccount:${google_service_account.search.email}",
     "group:retail-viewer@${var.domain}",
     "group:retail-merchandising@${var.domain}",
     "group:retail-developer@${var.domain}",
     "group:retail-operations@${var.domain}"
  ]
}

# PubSub
resource "google_project_iam_binding" "pubsub_subscriber" {
  project = google_project.base.project_id
  role    = "roles/pubsub.subscriber"
  members = [
    "serviceAccount:${google_service_account.index_manager.email}"
  ]
}

#  Operations
resource "google_project_iam_binding" "monitoring_viewer" {
  project = google_project.base.project_id
  role    = "roles/monitoring.viewer"

  members = [
    "group:retail-developer@${var.domain}",
    "group:retail-operations@${var.domain}"
  ]
}

resource "google_project_iam_binding" "monitoring_editor" {
  project = google_project.base.project_id
  role    = "roles/monitoring.editor"

  members = [
    "group:retail-developer@${var.domain}",
    "group:retail-operations@${var.domain}"
  ]
}

resource "google_project_iam_binding" "logging_viewer" {
  project = google_project.base.project_id
  role    = "roles/logging.viewer"

  members = [
    "group:retail-developer@${var.domain}"
  ]
}

resource "google_project_iam_binding" "service_usage_viewer" {
  project = google_project.base.project_id
  role    = "roles/serviceusage.serviceUsageViewer"

  members = [
    "group:retail-admin@${var.domain}",
    "group:retail-editor@${var.domain}",
    "group:retail-viewer@${var.domain}",
    "group:retail-merchandising@${var.domain}",
    "group:retail-developer@${var.domain}",
    "group:retail-operations@${var.domain}"
  ]
}