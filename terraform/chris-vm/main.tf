resource "google_compute_instance" "default" {
  name         = "chris-vm"
  machine_type = "e2-micro"
  zone         = var.zone

  tags = ["itops"]

  boot_disk {
    initialize_params {
      image  = var.image_family
      labels = {
        my_label = "value"
      }
    }
  }

  network_interface {
    subnetwork = "itops-playground-central"
  }
}
