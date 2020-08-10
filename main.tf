variable "project_id" {
  default = "skyuk-uk-mikaelmichelier-poc"
}
variable "location" {
  default = "europe-west2"
}
variable "bucket_name" {
}
variable "json_file" {
  default = "logs"
}

provider "google" {
  credentials = file("./${var.json_file}")
  project = var.project_id
  region  = var.location
}

resource "google_storage_bucket" "simple" {
  name     = var.bucket_name
  location = "EU"
  force_destroy = true
  versioning {
    enabled = true
  }
}
