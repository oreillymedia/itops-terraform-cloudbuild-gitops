data "google_compute_subnetwork" "subnetwork" {
  name   = "${var.project}-central"
  region = var.region
}

resource "google_compute_instance" "default" {
  name         = var.vm_name
  machine_type = "e2-micro"
  zone         = var.zone
  
  tags = ["itops","alain"]
  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-2204-lts"
      labels = {
        "service" = var.service_type
      }
    }
  }

  network_interface {
    subnetwork = data.google_compute_subnetwork.subnetwork.self_link
  }
}