#[retail-admin]
# Retail Admin Role 
#    roles/retail.admin
#    roles/serviceusage.serviceUsageViewer
resource "google_project_iam_binding" "admin_retail_admin" {
  project = google_project.base.project_id
  role    = "roles/retail.admin"

  members = [
    "group:retail-admin@${var.domain}"
  ]
}

resource "google_project_iam_binding" "admin_service_usage_viewer" {
  project = google_project.base.project_id
  role    = "roles/serviceusage.serviceUsageViewer"

  members = [
    "group:retail-admin@${var.domain}"
  ]
}

#[retail-editor]
# Retail Editor Role
#    roles/retail.editor
#    roles/serviceusage.serviceUsageViewer
resource "google_project_iam_binding" "editor_retail_editor" {
  project = google_project.base.project_id
  role    = "roles/retail.editor"

  members = [
    "group:retail-editor@${var.domain}"
  ]
}

resource "google_project_iam_binding" "editor_service_usage_viewer" {
  project = google_project.base.project_id
  role    = "roles/serviceusage.serviceUsageViewer"

  members = [
    "group:retail-editor@${var.domain}"
  ]
}


#[retail-viewer]
# Retail Viewer Role
#    roles/retail.viewer
#    roles/serviceusage.serviceUsageViewer
resource "google_project_iam_binding" "viewer_retail_viewer" {
  project = google_project.base.project_id
  role    = "roles/retail.viewer"

  members = [
    "group:retail-viewer@${var.domain}"
  ]
}

resource "google_project_iam_binding" "viewer_service_usage_viewer" {
  project = google_project.base.project_id
  role    = "roles/serviceusage.serviceUsageViewer"

  members = [
    "group:retail-viewer@${var.domain}"
  ]
}


#[retail-merchandising]
# Retail Editor role
#  All environments
#    roles/retail.editor
#    roles/serviceusage.serviceUsageViewer
resource "google_project_iam_binding" "merchandising_retail_editor" {
  project = google_project.base.project_id
  role    = "roles/retail.editor"

  members = [
    "group:retail-merchandising@${var.domain}"
  ]
}

resource "google_project_iam_binding" "merchandising_service_usage_viewer" {
  project = google_project.base.project_id
  role    = "roles/serviceusage.serviceUsageViewer"

  members = [
    "group:retail-merchandising@${var.domain}"
  ]
}

#[retail-developer]
# Retail Developer role
#  ALL Projects
#    roles/monitoring.viewer
#    roles/monitoring.editor
#    roles/logging.viewer
#    roles/serviceusage.serviceUsageViewer
#  NON-PROD
#    roles/retail.admin
#  PROD
#    roles/retail.viewer
resource "google_project_iam_binding" "developer_monitoring_viewer" {
  project = google_project.base.project_id
  role    = "roles/monitoring.viewer"

  members = [
    "group:retail-developer@${var.domain}"
  ]
}

resource "google_project_iam_binding" "developer_monitoring_editor" {
  project = google_project.base.project_id
  role    = "roles/monitoring.editor"

  members = [
    "group:retail-developer@${var.domain}"
  ]
}

resource "google_project_iam_binding" "developer_logging_viewer" {
  project = google_project.base.project_id
  role    = "roles/logging.viewer"

  members = [
    "group:retail-developer@${var.domain}"
  ]
}

resource "google_project_iam_binding" "developer_service_usage_viewer" {
  project = google_project.base.project_id
  role    = "roles/serviceusage.serviceUsageViewer"

  members = [
    "group:retail-developer@${var.domain}"
  ]
}

resource "google_project_iam_binding" "developer_retail_admin" {
  project = google_project.base.project_id
  role    = "roles/retail.admin"

  members = [
    "group:retail-developer@${var.domain}"
  ]
}

resource "google_project_iam_binding" "developer_retail_viewer" {
  project = google_project.base.project_id
  role    = "roles/retail.viewer"

  members = [
    "group:retail-developer@${var.domain}"
  ]
}


#[retail-operations]
# Retail Operations role
#  ALL Projects
#    roles/retail.viewer
#    roles/monitoring.viewer
#    roles/monitoring.editor
#    roles/logging.viewer
#    roles/serviceusage.serviceUsageViewer
resource "google_project_iam_binding" "operations_retail_viewer" {
  project = google_project.base.project_id
  role    = "roles/retail.viewer"

  members = [
    "group:retail-operations@${var.domain}"
  ]
}

resource "google_project_iam_binding" "operations_monitoring_viewer" {
  project = google_project.base.project_id
  role    = "roles/monitoring.viewer"

  members = [
    "group:retail-operations@${var.domain}"
  ]
}

resource "google_project_iam_binding" "operations_monitoring_editor" {
  project = google_project.base.project_id
  role    = "roles/monitoring.editor"

  members = [
    "group:retail-operations@${var.domain}"
  ]
}

resource "google_project_iam_binding" "operations_logging_viewer" {
  project = google_project.base.project_id
  role    = "roles/logging.viewer"

  members = [
    "group:retail-operations@${var.domain}"
  ]
}

resource "google_project_iam_binding" "operations_service_usage_viewer" {
  project = google_project.base.project_id
  role    = "roles/serviceusage.serviceUsageViewer"

  members = [
    "group:retail-operations@${var.domain}"
  ]
}
