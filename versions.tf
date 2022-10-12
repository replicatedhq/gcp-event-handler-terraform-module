terraform {
  required_providers {
    google = {
      version = "~> 4.37.0"
    }
    archive = {
      version = "~> 2.2.0"
    }
    null = {
      version = "~> 3.1.1"
    }
  }

  required_version = ">= 1.0.11"
}
