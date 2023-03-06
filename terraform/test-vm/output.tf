output "vm_ip" {
  description = "the gcp vm ip address"
  value = google_compute_instance.default.network_interface.0.network_ip
}