

# Create Service accounts for Google Service Integration

# User Event Pipeline
resource "google_service_account" "service_accounts_uep" {

  for_each     = local.project_list_envs

  account_id   = "${local.sa_name_event_pipeline}@${each.value}.iam.gserviceaccount.com",
  display_name = local.sa_name_event_pipeline
  project      = each.value

  depends_on   = [
    google_project.gcp_retail_projects
  ]

}

# Retail Search
resource "google_service_account" "service_accounts_rs" {

  for_each     = local.project_list_envs

  account_id   = "${local.sa_name_retail_search}@${each.value}.iam.gserviceaccount.com",
  display_name = local.sa_name_retail_search
  project      = each.value

  depends_on   = [
    google_project.gcp_retail_projects
  ]

}

# Index Manager
resource "google_service_account" "service_accounts_im" {

  for_each     = local.project_list_envs

  account_id   = "${local.sa_name_index_mgr}@${each.value}.iam.gserviceaccount.com",
  display_name = local.sa_name_index_mgr
  project      = each.value

  depends_on   = [
    google_project.gcp_retail_projects
  ]

}
