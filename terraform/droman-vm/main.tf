data "google_compute_image" "itops_base_image" {
  family  = "itops-22-04-base-image"
  project = "itops-playground"
}


resource "google_compute_instance" "droman-vm" {
  name         = "droman-vm-${var.env}"
  description  = "Deans test image"
  machine_type = var.machine_type
  zone         = var.zone
  project      = var.project

  tags = ["itops"]

  boot_disk {
    initialize_params {
      image  = var.image_family
      labels = {
        my_label = "itops"
      }
      size = var.disk_size
    }
  }

  network_interface {
    subnetwork = "itops-playground-central"
  }
}