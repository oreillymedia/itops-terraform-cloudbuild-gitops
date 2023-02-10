data "google_compute_subnetwork" "subnetwork" {
  name   = "${var.project}-central"
  region = var.region
}

data "google_compute_image" "itops_base_image" {
  family = "itops-20-04-base-image"
  project = var.project
}
resource "google_compute_instance" "default" {
  name         = var.vm_name
  machine_type = "e2-micro"
  zone         = var.zone

  tags = ["itops-name"]

  boot_disk {
    initialize_params {
      # image = "ubuntu-os-cloud/ubuntu-2204-lts"
      image = data.google_compute_image.itops_base_image.self_link
      labels = {
        "service" = var.service_type
      }
    }
  }

  network_interface {
    subnetwork = data.google_compute_subnetwork.subnetwork.self_link
  }
}