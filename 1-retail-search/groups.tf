
#[retail-admin]
# Retail Admin Role 
#    roles/retail.admin
# GROUP_EMAIL="retail-admin@${DOMAIN}"
# gcloud identity groups create ${GROUP_EMAIL} --organization=${ORGANIZATION_ID}

module "grp_retail_admin" {
  source  = "terraform-google-modules/group/google"
  version = "~> 0.1"

  count        = var.create_retail_groups ? 1 : 0

  id           = "retail-admin@${var.domain}"
  display_name = "retail-admin"
  description  = "Retail Admin Role"
  domain       = var.domain
}

#[retail-editor]
# Retail Editor Role
#    roles/retail.editor
module "grp_retail_editor" {
  source  = "terraform-google-modules/group/google"
  version = "~> 0.1"

  count        = var.create_retail_groups ? 1 : 0

  id           = "retail-editor@${var.domain}"
  display_name = "retail-editor"
  description  = "Retail Editor Role"
  domain       = var.domain
}

#[retail-viewer]
# Retail Viewer Role
#    roles/retail.viewer
module "grp_retail_viewer" {
  source  = "terraform-google-modules/group/google"
  version = "~> 0.1"

  count        = var.create_retail_groups ? 1 : 0

  id           = "retail-viewer@${var.domain}"
  display_name = "retail-viewer"
  description  = "Retail Viewer Role"
  domain       = var.domain
}


#[retail-merchandising]
# Retail Merchandising role
#  All environments
#    roles/retail.editor
module "grp_retail_merchandising" {
  source  = "terraform-google-modules/group/google"
  version = "~> 0.1"

  count        = var.create_retail_groups ? 1 : 0

  id           = "retail-merchandising@${var.domain}"
  display_name = "retail-merchandising"
  description  = "Retail Merchandising Role"
  domain       = var.domain
}

#[retail-developer]
# Retail Developer role
#  NON-PROD
#    roles/retail.admin
#  PROD
#    roles/retail.viewer
#  ALL Projects
#    roles/monitoring.viewer
#    roles/monitoring.editor
#    roles/logging.viewer
#    roles/serviceusage.serviceUsageViewer
module "grp_retail_developer" {
  source  = "terraform-google-modules/group/google"
  version = "~> 0.1"

  count        = var.create_retail_groups ? 1 : 0

  id           = "retail-developer@${var.domain}"
  display_name = "retail-developer"
  description  = "Retail Developer Role"
  domain       = var.domain
}

#[retail-operations]
# Retail Operations role
#  ALL Projects
#    roles/retail.viewer
#    roles/monitoring.viewer
#    roles/monitoring.editor
#    roles/logging.viewer
#    roles/serviceusage.serviceUsageViewer
module "grp_retail_operations" {
  source  = "terraform-google-modules/group/google"
  version = "~> 0.1"

  count        = var.create_retail_groups ? 1 : 0

  id           = "retail-operations@${var.domain}"
  display_name = "retail-operations"
  description  = "Retail Operations Role"
  domain       = var.domain
}
