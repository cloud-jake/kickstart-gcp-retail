
##
### [User Event Pipeline] 
##
# Streaming from Web Analytics to BigQuery 
#    roles/bigquery.dataEditor
#    -User Events Table (BigQuery)
resource "google_project_iam_binding" "iam_uep_bq" {

  for_each     = local.project_list_envs
  
  project       = each.value
  role          = "roles/bigquery.dataEditor"

  members = [
    "serviceAccount:${local.sa_name_event_pipeline}@${each.value}.iam.gserviceaccount.com",
  ]

  depends_on = [
    google_service_account.service_accounts_uep
  ]

}

#    roles/retail.editor
#    -Retail Search Project
resource "google_project_iam_binding" "iam_uep_re" {

  for_each     = local.project_list_envs
  
  project       = each.value
  role          = "roles/retail.editor"

  members = [
    "serviceAccount:${local.sa_name_event_pipeline}@${each.value}.iam.gserviceaccount.com",
  ]

  depends_on = [
    google_service_account.service_accounts_uep
  ]

}


#[Search]
# Call Retail API 
#    roles/retail.viewer
#    -Retail Search Project 
resource "google_project_iam_binding" "iam_uep_rv" {

  for_each     = local.project_list_envs
  
  project       = each.value
  role          = "roles/retail.viewer"

  members = [
    "serviceAccount:${local.sa_name_retail_search}@${each.value}.iam.gserviceaccount.com",
  ]

  depends_on = [
    google_service_account.service_accounts_rs
  ]

}



#[Index Manager]
# Manage BQ
#    roles/bigquery.dataEditor
#    -Catalog Table (BigQuery)
#    -Audit Table (BigQuery)
resource "google_project_iam_binding" "iam_rs_im_de" {

  for_each     = local.project_list_envs
  
  project       = each.value
  role          = "roles/bigquery.dataEditor"

  members = [
    "serviceAccount:${local.sa_name_index_mgr}@${each.value}.iam.gserviceaccount.com",
  ]

  depends_on = [
    google_service_account.service_accounts_im
  ]

}

#   roles/retail.editor
#   -Retail Search Project 
resource "google_project_iam_binding" "iam_rs_im_re" {

  for_each     = local.project_list_envs
  
  project       = each.value
  role          = "roles/retail.editor"

  members = [
    "serviceAccount:${local.sa_name_index_mgr}@${each.value}.iam.gserviceaccount.com",
  ]

  depends_on = [
    google_service_account.service_accounts_im
  ]

}

#   roles/pubsub.subscriber
#   -Catalog Event Topic
resource "google_project_iam_binding" "iam_rs_im_pss" {

  for_each     = local.project_list_envs
  
  project       = each.value
  role          = "roles/pubsub.subscriber"

  members = [
    "serviceAccount:${local.sa_name_index_mgr}@${each.value}.iam.gserviceaccount.com",
  ]

  depends_on = [
    google_service_account.service_accounts_im
  ]

}
