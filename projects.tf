
# Create Common and API Projects
## Note: Running this command requires roles/billing.user
resource "google_project" "gcp_retail_projects" {
    
    for_each          = local.project_mapping

    name              = each.key
    project_id        = each.value
    folder_id         = var.folder_id
    billing_account   = var.billing_id

    depends_on = [
        google_folder_iam_policy.folder_project_creators
    ]

}
