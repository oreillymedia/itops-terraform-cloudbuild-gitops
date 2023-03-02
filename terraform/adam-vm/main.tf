data "google_compute_image" "itops_base_image" {
  family  = "itops-base-image"
  project = "itops-playground"
}


resource "google_compute_instance" "adam-vm" {
  name         = "adam-vm-${var.env}"
  description  = "test image"
  machine_type = var.machine_type
  zone         = var.zone
  project      = var.project

  tags = ["itops"]

  boot_disk {
    initialize_params {
      image = data.google_compute_image.itops_base_image.self_link
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