resource "google_dns_managed_zone" "private-zone" {
  name        = "west-forward-zone"
  dns_name    = "west.ora.com."
  description = "Forward of west.ora.com to Seb-C DNS"
  labels = {
    lifetime = "temporary"
  }

  visibility = "private"

  private_visibility_config {
    networks {
      network_url = "projects/itops-playground/global/networks/itops-playground"
    }
  }

  forwarding_config {
    target_name_servers {
      ipv4_address = "172.24.1.254"
    }
    target_name_servers {
      ipv4_address = "172.24.1.254"
    }
  }
}