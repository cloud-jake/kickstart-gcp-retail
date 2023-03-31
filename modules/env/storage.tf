resource "google_storage_bucket" "storage_event" {
  name     = "${google_project.base.name}-event"
  location = var.location
  project  = google_project.base.project_id

  force_destroy            = true
  public_access_prevention = "enforced"
}

resource "google_storage_bucket" "storage_catalog" {
  name     = "${google_project.base.name}-catalog"
  location = var.location
  project  = google_project.base.project_id

  force_destroy            = true
  public_access_prevention = "enforced"
}

resource "google_storage_bucket" "storage_temp" {
  name     = "${google_project.base.name}-temp"
  location = var.location
  project  = google_project.base.project_id

  force_destroy            = true
  public_access_prevention = "enforced"
}