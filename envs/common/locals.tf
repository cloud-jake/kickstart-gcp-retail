locals {
  project = "prj-c-retail"

  services = [
    "logging.googleapis.com",
    "monitoring.googleapis.com",
    "retail.googleapis.com",
    "dataflow.googleapis.com",
    "bigquery.googleapis.com",
    "bigquerystorage.googleapis.com",
    "storage.googleapis.com"
  ]
}