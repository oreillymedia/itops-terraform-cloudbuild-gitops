terraform {
  required_version = ">= 1.1.9"
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "3.86.0"
    }
    vault = {
      source  = "hashicorp/vault"
      version = "2.21.0"
    }
  }
}