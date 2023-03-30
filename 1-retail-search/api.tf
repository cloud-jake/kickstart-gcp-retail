
# Enable Services on this Project
resource "google_project_service" "project_services_common" {
  
  for_each = toset(local.service_apis_common)

  project = local.prj_common
  service = each.value

  timeouts {
    create = "30m"
    update = "40m"
  }

  depends_on = [
    google_project.gcp_retail_projects
  ]

  disable_dependent_services = true
}

# Production APIs
resource "google_project_service" "project_services_prod" {
  
  for_each = toset(local.services_apis_envs)

  project = local.prj_retail_api_prod
  service = each.value

  timeouts {
    create = "30m"
    update = "40m"
  }

  depends_on = [
    google_project.gcp_retail_projects
  ]

  disable_dependent_services = true
}

# Development APIs
resource "google_project_service" "project_services_dev" {
  
  for_each = toset(local.services_apis_envs)

  project = local.prj_retail_api_dev
  service = each.value

  timeouts {
    create = "30m"
    update = "40m"
  }

  depends_on = [
    google_project.gcp_retail_projects
  ]
  
  disable_dependent_services = true
}

# Test APIs
resource "google_project_service" "project_services_test" {
  
  for_each = toset(local.services_apis_envs)

  project = local.prj_retail_api_test
  service = each.value

  timeouts {
    create = "30m"
    update = "40m"
  }

  disable_dependent_services = true
}
