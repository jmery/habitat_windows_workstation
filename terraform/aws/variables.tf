
////////////////////////////////
// AWS Connection

variable "aws_profile" {}

variable "aws_region" {
  default = "us-west-2"
}

////////////////////////////////
// Tags

variable "tag_customer" {}

variable "tag_project" {}

variable "tag_name" {
  default = "hab_win_ws"
}

variable "tag_dept" {}

variable "tag_contact" {}

variable "tag_application" {
  default = "hab_win_ws"
}

variable "tag_ttl" {}

variable "aws_key_pair_file" {}

variable "aws_key_pair_name" {}

////////////////////////////////
// Instance Configs

variable "count" {
  default = "1"
}
