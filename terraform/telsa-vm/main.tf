resource "google_compute_instance" "default" {
  name         = "telsa-vm"
  machine_type = "e2-micro"
  zone         = var.zone

  tags = ["itops"]

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-2204-lts"
      labels = {
        my_label = "value"
      }
    }
  }

  network_interface {
    subnetwork = "itops-playground-central"
  }
}