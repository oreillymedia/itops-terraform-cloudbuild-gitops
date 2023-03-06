

# Create VPCs
resource "google_compute_network" "vpc_networks" {
  for_each = var.vpcs

  name                    = each.key
  auto_create_subnetworks = each.value["auto_create_subnetworks"]
  routing_mode            = each.value["routing_mode"]
  project                 = var.env
  description             = each.value["description"]
}

# Create Subnets inside of VPCs
resource "google_compute_subnetwork" "itops_subnets" {
  for_each = var.subnetworks

  ip_cidr_range            = each.value["vpc_subnetwork_cidr_range"]
  name                     = each.key
  network                  = each.value["vpc_name"]
  private_ip_google_access = true
  project                  = var.env
  region                   = each.value["region"]
}

# Create VPC peering
locals {
  vpc_peers = flatten([
    for vpc_key, vpc_value in var.vpcs : [
      for peer_key, peer_value in vpc_value.vpc_peering : {
        name         = peer_key
        network      = vpc_key
        peer_network = peer_value.peer_network
      }
    ]
  ])
}

resource "google_compute_network_peering" "itops-vpc-peering" {
  for_each = { for k, v in local.vpc_peers : k => v }

  name         = each.value.name
  network      = google_compute_network.vpc_networks[each.value.network].id
  peer_network = each.value.peer_network
}



