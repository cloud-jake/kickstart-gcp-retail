

variable "domain" {
    type        = string
    description = "Domain suffix to be used to construct IAM groups"
} 

variable "folder_name" {
    type        = string
    description = "Name of Folder (3-30 characters) ex. XXXXXXX-product-discovery"
}
 
variable "folder_id" {
    type        = string
    description = "Get Folder ID of above folder"
}

variable "org_id" {
    type        = string
    description = "Organization Number"
}

variable "billing_id" {
    type        = string
    description = "Billing Account ex. 012345-678910-ABCDEF"
}

variable "location" {
    type        = string
    description = "Location ex US or EU"
    default     = "US"
}

variable "region" {
    type        = string
    description = "Region ex us-central1 or europe-west2"
    default     = "us-central1"
}

variable "prjpre" {
    type        = string
    description = "Project Prefix for all projects ex prj-xxxxx"
    default     = "prj"
}

variable "prjp" {
    type        = string
    description = "Project Prefix for production project ex p"
    default     = "p"
}

variable "prjd" {
    type        = string
    description = "Project Prefix for development project ex d"
    default     = "d"
}

variable "prjt" {
    type        = string
    description = "Project Prefix for test project ex t"
    default     = "t"
}

variable "prjc" {
    type        = string
    description = "Project Prefix for common project ex c"
    default     = "c"
}

variable "id1" {
    type        = string
    description = "Principal for IAM role #1"
}

variable "id2" {
    type        = string
    description = "Principal for IAM role #2"
    default     = ""
}

variable "type" {
    type        = string
    description = "Principal Type: user or group"
    default     = "user"
}

variable "create_retail_groups" {
    type        = bool
    default     = true
    description = "Retail groups may only be created once per domain"
}
