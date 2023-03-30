##
## [User Event Pipeline] 
##

# Streaming from Web Analytics to BigQuery 
#    roles/bigquery.dataEditor
#    -User Events Table (BigQuery)
resource "google_project_iam_binding" "iam_uep_bq" {
  project = google_project.base.id
  role    = "roles/bigquery.dataEditor"
  members = ["serviceAccount:${google_service_account.user_event_pipeline.email}"]
}

#    roles/retail.editor
#    -Retail Search Project
resource "google_project_iam_binding" "iam_uep_re" {
  project = google_project.base.id
  role    = "roles/retail.editor"
  members = ["serviceAccount:${google_service_account.user_event_pipeline.email}"]
}

##
## [Search]
##

# Call Retail API 
#    roles/retail.viewer
#    -Retail Search Project 
resource "google_project_iam_binding" "iam_uep_rv" {
  project = google_project.base.id
  role    = "roles/retail.viewer"
  members = ["serviceAccount:${google_service_account.search.email}"]
}

##
## [Index Manager]
## 

# Manage BQ
#    roles/bigquery.dataEditor
#    -Catalog Table (BigQuery)
#    -Audit Table (BigQuery)
resource "google_project_iam_binding" "iam_rs_im_de" {
  project = google_project.base.id
  role    = "roles/bigquery.dataEditor"
  members = ["serviceAccount:${google_service_account.index_manager.email}"]
}

#   roles/retail.editor
#   -Retail Search Project 
resource "google_project_iam_binding" "iam_rs_im_re" {
  project = google_project.base.id
  role    = "roles/retail.editor"
  members = ["serviceAccount:${google_service_account.index_manager.email}"]
}

#   roles/pubsub.subscriber
#   -Catalog Event Topic
resource "google_project_iam_binding" "iam_rs_im_pss" {
  project = google_project.base.id
  role    = "roles/pubsub.subscriber"
  members = ["serviceAccount:${google_service_account.index_manager.email}"]
}