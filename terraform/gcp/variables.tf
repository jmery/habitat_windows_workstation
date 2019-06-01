///////////////////////////////////////
// GCP Info

variable "gcp_credentials_file" {
  description = "Path to your JSON GCP credentials file on your local machine"
}

variable "gcp_project" {
  description = "Existing GCP project to use for deployment"
}

variable "gcp_region" {
  default="us-west1"
  description = <<EOF
gcp_region is the GCP region in which we will build instances

Region List: https://cloud.google.com/compute/docs/regions-zones/
EOF
}

///////////////////////////////////////
// Required Labels (aka Tags)
variable "label_customer" {
  description = "label_customer is the customer tag which will be added to resources. lower-case, numbers, underscores, or dashes only"
}

variable "label_project" {
  description = "label_project is the project tag which will be added to resources. lower-case, numbers, underscores, or dashes only"
}

variable "label_dept" {
  description = "label_dept is the department tag which will be added to resources. lower-case, numbers, underscores, or dashes only"
}

variable "label_contact" {
  description = "label_contact is the contact tag which will be added to resources. lower-case, numbers, underscores, or dashes only"
}

variable "label_application" {
  description = "label_application is the application tag which will be added to resources. lower-case, numbers, underscores, or dashes only"
}
variable "label_ttl" {
  default = 4
}

///////////////////////////////////////
// Workstation Variables

variable "hab_ws_hostname" {
  default = "hab-ws"
  description = "Hostname pattern to prepend to system names and DNS entries"
}

variable "hab_ws_count" {
  default = "1"
  description = "Number of workstations to create"
}

variable "hab_ws_dns_zone_name" {
  description = "GCP-managed DNS zone name in which to register automate_hostname"
}

variable "hab_ws_dns_zone_project" {
  default = "null"
  description = "Project hosting the automate_dns_zone above.  Defaults to gcp_project variable."
}

variable "hab_ws_machine_type" {
  default = "n1-standard-4"
  description = <<EOF
GCP machine type for habitat Windows workstation(s)

Machine Types:  https://cloud.google.com/compute/docs/machine-types
EOF
}
