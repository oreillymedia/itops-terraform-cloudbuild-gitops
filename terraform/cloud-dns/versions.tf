terraform {
  required_version = ">= 1.1.9"
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.53.0"
    }
    vault = {
      source  = "hashicorp/vault"
      version = "3.12.0"
    }
  }
}
