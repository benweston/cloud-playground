terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "5.8.0"
    }
  }
}

provider "google" {
  # Configuration options
  project = cloud-playground
  region  = "europe-west2"
}
