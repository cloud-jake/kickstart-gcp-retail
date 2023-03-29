

resource "google_storage_bucket" "storage-event" {

    for_each     = local.project_list_envs

    name          = "${each.value}-event"
    location      = var.location
    project       = each.value

    force_destroy = true
    public_access_prevention = "enforced"

}

resource "google_storage_bucket" "storage-catalog" {

    for_each     = local.project_list_envs

    name          = "${each.value}-catalog"
    location      = var.location
    project       = each.value

    force_destroy = true
    public_access_prevention = "enforced"

}

resource "google_storage_bucket" "storage-temp" {

    for_each     = local.project_list_envs

    name          = "${each.value}-temp"
    location      = var.location
    project       = each.value

    force_destroy = true
    public_access_prevention = "enforced"

}
