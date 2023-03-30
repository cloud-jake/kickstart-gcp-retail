
# Kickstart GCP - Retail Search

This example repository shows how the CFT Terraform modules can build a secure Google Cloud foundation, following the [Google Cloud security foundations guide](https://cloud.google.com/architecture/security-foundations).
The supplied structure and code is intended to form a starting point for building your own foundation with pragmatic defaults that you can customize to meet your own requirements. Currently, the step 0 is manually executed.
From step 1 onwards, the Terraform code is deployed by using either Google Cloud Build (default) or Jenkins.
Cloud Build has been chosen by default to allow you to quickly get started without having to deploy a CI/CD tool, although it is worth noting the code can easily be executed by your preferred tool.

## Overview

This repo contains several distinct Terraform projects, each within their own directory that must be applied separately, but in sequence.
Each of these Terraform projects are to be layered on top of each other, and run in the following order.

### [0. bootstrap](./0-bootstrap/)

This stage executes the [CFT Bootstrap module](https://github.com/terraform-google-modules/terraform-google-bootstrap) which bootstraps an existing Google Cloud organization, creating all the required Google Cloud resources and permissions to start using the Cloud Foundation Toolkit (CFT).
For [CI/CD Pipelines](/docs/GLOSSARY.md#foundation-cicd-pipeline), you can use either Cloud Build (by default) or Jenkins. If you want to use Jenkins instead of Cloud Build, see [README-Jenkins](./0-bootstrap/README-Jenkins.md) on how to use the Jenkins sub-module.

The bootstrap step includes:

- The `prj-b-seed` project that contains the following:
  - Terraform state bucket
  - Custom service accounts used by Terraform to create new resources in Google Cloud
- The `prj-b-cicd` project that contains the following:
  - A [CI/CD Pipeline](/docs/GLOSSARY.md#foundation-cicd-pipeline) implemented with either Cloud Build or Jenkins
  - If using Cloud Build, the following items:
    - Cloud Source Repository
    - Artifact Registry
  - If using Jenkins, the following items:
    - A Compute Engine instance configured as a Jenkins Agent
    - Custom service account to run Compute Engine instances for Jenkins Agents
    - VPN connection with on-prem (or wherever your Jenkins Controller is located)

It is a best practice to separate concerns by having two projects here: one for the CFT resources and one for the CI/CD tool.
The `prj-b-seed` project stores Terraform state and has the service accounts that can create or modify infrastructure.
On the other hand, the deployment of that infrastructure is coordinated by a CI/CD tool of your choice allocated in a second project named `prj-b-cicd`.

To further separate the concerns at the IAM level as well, a distinct service account is created for each stage.
If using Cloud Build, these service accounts are used directly in the pipeline to execute the pipeline steps (`plan` or `apply`).
In this configuration, the baseline permissions of the CI/CD tool are unchanged, and the Terraform custom service accounts are granted the IAM permissions required to build the foundation.

If using Jenkins, the CI/CD tool account (`sa-jenkins-agent-gce@prj-b-cicd-xxxx.iam.gserviceaccount.com`) is granted access to generate tokens over the Terraform custom Service Accounts.
In this configuration, the baseline permissions of the CI/CD tool are limited, and the Terraform custom service accounts are granted the IAM permissions required to build the foundation.

After executing this step, you will have the following structure:

```
example-organization/
└── fldr-bootstrap
    ├── prj-b-cicd
    └── prj-b-seed
```

When this step uses the Cloud Build submodule, it sets up Cloud Build and Cloud Source Repositories for each of the stages below.
Triggers are configured to run a `terraform plan` for any non-environment branch and `terraform apply` when changes are merged to an environment branch (`development`, `non-production` or `production`).
Usage instructions are available in the 0-bootstrap [README](./0-bootstrap/README.md).

### [1. retail-search](./1-retail-search/)

The purpose of this stage is to set up the common folder used to house projects that contain shared resources such as DNS Hub, Interconnect, Security Command Center notification, org level secrets, network hub and org level logging.
This will create the following folder and project structure:

```
example-organization
└── fldr-common
    ├── prj-c-logging
    ├── prj-c-base-net-hub
    ├── prj-c-billing-logs
    ├── prj-c-dns-hub
    ├── prj-c-interconnect
    ├── prj-c-restricted-net-hub
    ├── prj-c-scc
    └── prj-c-secrets
```
<!-- 
#### Logs

Among the eight projects created under the common folder, two projects (`prj-c-logging`, `prj-c-billing-logs`) are used for logging.
The first one is for organization-wide audit logs, and the second one is for billing logs.
In both cases, the logs are collected into BigQuery datasets which you can then use for general querying, dashboarding, and reporting. Logs are also exported to Pub/Sub, a Cloud Storage bucket, and a log bucket.

**Notes**:

- Log export to Cloud Storage bucket has optional object versioning support via `log_export_storage_versioning`.
- The various audit log types being captured in BigQuery are retained for 30 days.
- For billing data, a BigQuery dataset is created with permissions attached, however you will need to configure a billing export [manually](https://cloud.google.com/billing/docs/how-to/export-data-bigquery), as there is no easy way to automate this at the moment. -->

#### Secrets

Another project created under the common folder. This project is allocated for [Secret Manager](https://cloud.google.com/secret-manager) for secrets shared by the organization.

Usage instructions are available for the org step in the [README](./1-org/README.md).

### Final view

After all steps above have been executed, your Google Cloud organization should represent the structure shown below, with projects being the lowest nodes in the tree.

```
example-organization
└── fldr-common
    ├── prj-c-logging
    ├── prj-c-base-net-hub
    ├── prj-c-billing-logs
    ├── prj-c-dns-hub
    ├── prj-c-interconnect
    ├── prj-c-restricted-net-hub
    ├── prj-c-scc
    ├── prj-c-secrets
    ├── prj-bu1-c-infra-pipeline
    └── prj-bu2-c-infra-pipeline
└── fldr-development
    ├── prj-bu1-d-env-secrets
    ├── prj-bu1-d-sample-floating
    ├── prj-bu1-d-sample-base
    ├── prj-bu1-d-sample-restrict
    ├── prj-bu1-d-sample-peering
    ├── prj-bu2-d-env-secrets
    ├── prj-bu2-d-sample-floating
    ├── prj-bu2-d-sample-base
    ├── prj-bu2-d-sample-restrict
    ├── prj-bu2-d-sample-peering
    ├── prj-d-monitoring
    ├── prj-d-secrets
    ├── prj-d-shared-base
    └── prj-d-shared-restricted
└── fldr-non-production
    ├── prj-bu1-n-env-secrets
    ├── prj-bu1-n-sample-floating
    ├── prj-bu1-n-sample-base
    ├── prj-bu1-n-sample-restrict
    ├── prj-bu1-n-sample-peering
    ├── prj-bu2-n-env-secrets
    ├── prj-bu2-n-sample-floating
    ├── prj-bu2-n-sample-base
    ├── prj-bu2-n-sample-restrict
    ├── prj-bu2-n-sample-peering
    ├── prj-n-monitoring
    ├── prj-n-secrets
    ├── prj-n-shared-base
    └── prj-n-shared-restricted
└── fldr-production
    ├── prj-bu1-p-env-secrets
    ├── prj-bu1-p-sample-floating
    ├── prj-bu1-p-sample-base
    ├── prj-bu1-p-sample-restrict
    ├── prj-bu1-p-sample-peering
    ├── prj-bu2-p-env-secrets
    ├── prj-bu2-p-sample-floating
    ├── prj-bu2-p-sample-base
    ├── prj-bu2-p-sample-restrict
    ├── prj-bu2-p-sample-peering
    ├── prj-p-monitoring
    ├── prj-p-secrets
    ├── prj-p-shared-base
    └── prj-p-shared-restricted
└── fldr-bootstrap
    ├── prj-b-cicd
    └── prj-b-seed
```

### Optional Variables

Some variables used to deploy the steps have default values, check those **before deployment** to ensure they match your requirements. For more information, there are tables of inputs and outputs for the Terraform modules, each with a detailed description of their variables. Look for variables marked as **not required** in the section **Inputs** of these READMEs:

- Step 0-bootstrap: If you are using Cloud Build in the [CI/CD Pipeline](/docs/GLOSSARY.md#foundation-cicd-pipeline), check the main [README](./0-bootstrap/README.md#Inputs) of the step. If you are using Jenkins, check the [README](./0-bootstrap/modules/jenkins-agent/README.md#Inputs) of the module `jenkins-agent`.
- Step 1-org: The [README](./1-org/envs/shared/README.md#Inputs) of the environment `shared`.
- Step 2-environments: The READMEs of the environments [development](./2-environments/envs/development/README.md#Inputs), [non-production](./2-environments/envs/non-production/README.md#Inputs), and [production](./2-environments/envs/production/README.md#Inputs)
- Step 3-networks-dual-svpc: The READMEs of the environments [shared](./3-networks-dual-svpc/envs/shared/README.md#inputs), [development](./3-networks-dual-svpc/envs/development/README.md#Inputs), [non-production](./3-networks/envs/non-production/README.md#Inputs), and [production](./3-networks/envs/production/README.md#Inputs)
- Step 3-networks-hub-and-spoke: The READMEs of the environments [shared](./3-networks-hub-and-spoke/envs/shared/README.md#inputs), [development](./3-networks-hub-and-spoke/envs/development/README.md#Inputs), [non-production](./3-networks/envs/non-production/README.md#Inputs), and [production](./3-networks/envs/production/README.md#Inputs)
- Step 4-projects: The READMEs of the environments [shared](./4-projects/business_unit_1/shared/README.md#inputs), [development](./4-projects/business_unit_1/development/README.md#Inputs), [non-production](./4-projects/business_unit_1/non-production/README.md#Inputs), and [production](./4-projects/business_unit_1/production/README.md#Inputs)

