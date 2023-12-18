terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "5.9.0"
    }
  }
}

provider "google" {
  project     = ""
  region      = ""
  zone        = ""
  credentials = file("")
}
