terraform {
  required_providers {
    google = {
      version = "~> 4.47.0"
    }
    archive = {
      version = "~> 2.2.0"
    }
    null = {
      version = "~> 3.1.1"
    }
    google-beta = {
      version = "~> 4.51.0"
    }
  }

  required_version = ">= 1.3.7"
}
