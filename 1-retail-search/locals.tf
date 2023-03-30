
locals {

    # Common Project APIs
    service_apis_common = [
        "cloudbuild.googleapis.com",
        "composer.googleapis.com",
        "storage-component.googleapis.com",
        "logging.googleapis.com",
        "monitoring.googleapis.com",
        "cloudresourcemanager.googleapis.com",
        "cloudidentity.googleapis.com"
    ]

    # Environment Project APIs
    services_apis_envs = [
        "logging.googleapis.com",
        "monitoring.googleapis.com",
        "retail.googleapis.com",
        "dataflow.googleapis.com",
        "bigquery.googleapis.com",
        "bigquerystorage.googleapis.com",
        "storage.googleapis.com"
    ]

    # Project Names
    prj_common = "${var.prjpre}-${var.prjc}-retail-${resource.random_string.rnd_suffix.result}}"
    prj_retail_api_prod = "${var.prjpre}-${var.prjp}-retail-api-${resource.random_string.rnd_suffix.result}"
    prj_retail_api_dev = "${var.prjpre}-${var.prjd}-retail-api-${resource.random_string.rnd_suffix.result}"
    prj_retail_api_test = "${var.prjpre}-${var.prjt}-retail-api-${resource.random_string.rnd_suffix.result}"

    # Project Mappings
    project_mapping = {
        "Common"        = local.prj_common
        "Production"    = local.prj_retail_api_prod
        "Development"   = local.prj_retail_api_dev
        "Test"          = local.prj_retail_api_test
    }

    project_list_envs = [
        local.prj_retail_api_prod,
        local.prj_retail_api_dev,
        local.prj_retail_api_test
    ]    

    project_list_envs_prod = [
        local.prj_retail_api_prod,
    ]    

    project_list_envs_nonprod = [
        local.prj_retail_api_dev,
        local.prj_retail_api_test
    ]    


    # Service account names
    sa_name_event_pipeline = "retail-user-event-pipeline"
    sa_name_retail_search  = "retail-search"
    sa_name_index_mgr      = "retail-index-manager"

}
