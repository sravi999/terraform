terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.0.0"
    }
  }
}

provider "google" {
  credentials = file(var.credentials)

  project = var.project
  region  = var.region
  zone    = var.zone
}

resource "google_compute_network" "vpc_network" {
  name = "terraform-vpc-network"
}
resource "google_compute_instance" "vm_instance" {
  name         = "terraform-instance"
  machine_type = var.machine_type
  tags         = ["web", "dev"]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }

  network_interface {
    network = google_compute_network.vpc_network.name
    access_config {
    }
  }
}
