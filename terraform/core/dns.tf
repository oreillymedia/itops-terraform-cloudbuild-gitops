resource "google_dns_managed_zone" "corp_zone" {
  name        = "corp-oreilly-com-zone"
  dns_name    = "corp.oreilly.com."
  description = "Corp Zone"

  visibility = "private"

  private_visibility_config {
    networks {
      network_url = google_compute_network.vpc_networks[var.project].id
    }
  }
}

resource "google_dns_record_set" "alain_record" {
  managed_zone = google_dns_managed_zone.corp_zone.name
  name    = "alain.${google_dns_managed_zone.corp_zone.dns_name}"
  type    = "A"
  rrdatas = ["10.200.80.22"]
  ttl     = 300
}

resource "google_dns_record_set" "chris" {
  managed_zone = google_dns_managed_zone.corp_zone.name
  name         = "chris.${google_dns_managed_zone.corp_zone.dns_name}"
  type         = "A"
  ttl          = 300
  rrdatas = ["10.200.80.50"]

}