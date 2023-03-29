

#[retail-admin]
# Retail Admin Role 
#    roles/retail.admin
#    roles/serviceusage.serviceUsageViewer
resource "google_project_iam_binding" "iam_rar_ra" {

  for_each     = local.project_list_envs
  
  project       = each.value
  role          = "roles/retail.admin"

  members = [
    "group:retail-admin@${var.domain}",
  ]

  depends_on = [
    module.grp_retail_admin
  ]

}

resource "google_project_iam_binding" "iam_rar_suv" {

  for_each     = local.project_list_envs
  
  project       = each.value
  role          = "roles/serviceusage.serviceUsageViewer"

  members = [
    "group:retail-admin@${var.domain}",
  ]

  depends_on = [
    module.grp_retail_admin
  ]

}

#[retail-editor]
# Retail Editor Role
#    roles/retail.editor
#    roles/serviceusage.serviceUsageViewer
resource "google_project_iam_binding" "iam_rer_ra" {

  for_each     = local.project_list_envs
  
  project       = each.value
  role          = "roles/retail.editor"

  members = [
    "group:retail-editor@${var.domain}",
  ]

  depends_on = [
    module.grp_retail_editor
  ]

}

resource "google_project_iam_binding" "iam_rer_suv" {

  for_each     = local.project_list_envs
  
  project       = each.value
  role          = "roles/serviceusage.serviceUsageViewer"

  members = [
    "group:retail-editor@${var.domain}",
  ]

  depends_on = [
    module.grp_retail_editor
  ]

}


#[retail-viewer]
# Retail Viewer Role
#    roles/retail.viewer
#    roles/serviceusage.serviceUsageViewer
resource "google_project_iam_binding" "iam_rvr_ra" {

  for_each     = local.project_list_envs
  
  project       = each.value
  role          = "roles/retail.viewer"

  members = [
    "group:retail-viewer@${var.domain}",
  ]

  depends_on = [
    module.grp_retail_viewer
  ]

}

resource "google_project_iam_binding" "iam_rvr_suv" {

  for_each     = local.project_list_envs
  
  project       = each.value
  role          = "roles/serviceusage.serviceUsageViewer"

  members = [
    "group:retail-viewer@${var.domain}",
  ]

  depends_on = [
    module.grp_retail_viewer
  ]

}


#[retail-merchandising]
# Retail Editor role
#  All environments
#    roles/retail.editor
#    roles/serviceusage.serviceUsageViewer
resource "google_project_iam_binding" "iam_rvr_ra" {

  for_each     = local.project_list_envs
  
  project       = each.value
  role          = "roles/retail.editor"

  members = [
    "group:retail-merchandising@${var.domain}",
  ]

  depends_on = [
    module.grp_retail_viewer
  ]

}

resource "google_project_iam_binding" "iam_rvr_suv" {

  for_each     = local.project_list_envs
  
  project       = each.value
  role          = "roles/serviceusage.serviceUsageViewer"

  members = [
    "group:retail-merchandising@${var.domain}",
  ]

  depends_on = [
    module.grp_retail_viewer
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
resource "google_project_iam_binding" "iam_rdr_mv" {

  for_each     = local.project_list_envs
  
  project       = each.value
  role          = "roles/monitoring.viewer"

  members = [
    "group:retail-developer@${var.domain}",
  ]

  depends_on = [
    module.grp_retail_developer
  ]

}

resource "google_project_iam_binding" "iam_rdr_me" {

  for_each     = local.project_list_envs
  
  project       = each.value
  role          = "roles/monitoring.editor"

  members = [
    "group:retail-developer@${var.domain}",
  ]

  depends_on = [
    module.grp_retail_developer
  ]

}

resource "google_project_iam_binding" "iam_rdr_lv" {

  for_each     = local.project_list_envs
  
  project       = each.value
  role          = "roles/logging.viewer"

  members = [
    "group:retail-developer@${var.domain}",
  ]

  depends_on = [
    module.grp_retail_developer
  ]

}

resource "google_project_iam_binding" "iam_rdr_suv" {

  for_each     = local.project_list_envs
  
  project       = each.value
  role          = "roles/serviceusage.serviceUsageViewer"

  members = [
    "group:retail-developer@${var.domain}",
  ]

  depends_on = [
    module.grp_retail_developer
  ]

}

resource "google_project_iam_binding" "iam_rdr_ra" {

  for_each     = local.project_list_envs_nonprod
  
  project       = each.value
  role          = "roles/retail.admin"

  members = [
    "group:retail-developer@${var.domain}",
  ]

  depends_on = [
    module.grp_retail_developer
  ]

}

resource "google_project_iam_binding" "iam_rdr_rv" {

  for_each     = local.project_list_envs_prod
  
  project       = each.value
  role          = "roles/retail.viewer"

  members = [
    "group:retail-developer@${var.domain}",
  ]

  depends_on = [
    module.grp_retail_developer
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
resource "google_project_iam_binding" "iam_ror_rv" {

  for_each     = local.project_list_envs
  
  project       = each.value
  role          = "roles/retail.viewer"

  members = [
    "group:retail-operations@${var.domain}",
  ]

  depends_on = [
    module.grp_retail_operations
  ]

}

resource "google_project_iam_binding" "iam_ror_mv" {

  for_each     = local.project_list_envs
  
  project       = each.value
  role          = "roles/monitoring.viewer"

  members = [
    "group:retail-operations@${var.domain}",
  ]

  depends_on = [
    module.grp_retail_operations
  ]

}

resource "google_project_iam_binding" "iam_ror_me" {

  for_each     = local.project_list_envs
  
  project       = each.value
  role          = "roles/monitoring.editor"

  members = [
    "group:retail-operations@${var.domain}",
  ]

  depends_on = [
    module.grp_retail_operations
  ]

}

resource "google_project_iam_binding" "iam_ror_lv" {

  for_each     = local.project_list_envs
  
  project       = each.value
  role          = "roles/logging.viewer"

  members = [
    "group:retail-operations@${var.domain}",
  ]

  depends_on = [
    module.grp_retail_operations
  ]

}

resource "google_project_iam_binding" "iam_ror_suv" {

  for_each     = local.project_list_envs
  
  project       = each.value
  role          = "roles/serviceusage.serviceUsageViewer"

  members = [
    "group:retail-operations@${var.domain}",
  ]

  depends_on = [
    module.grp_retail_operations
  ]

}
