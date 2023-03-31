resource "google_project" "base" {
  name            = "${var.project_prefix}-${var.env_code}-retail-api"
  project_id      = "${var.project_prefix}-${var.env_code}-retail-api-${var.suffix}"
  folder_id       = var.folder_id
  billing_account = var.billing_id
}

resource "google_project_service" "base_services" {
  for_each = toset(var.services)

  project                    = google_project.base.project_id
  service                    = each.value
  disable_dependent_services = true

  timeouts {
    create = "30m"
    update = "40m"
  }
}