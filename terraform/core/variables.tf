variable "project" {
  type        = string
  description = "project ID"
}

variable "region" {
  type        = string
  description = "Region of the project"
}

variable "zone" {
  type        = string
  description = "The zone where resources are deployed"
}

variable "env" {
  type        = string
  description = "Environment name"
}

variable "enable_logging" {
  type        = bool
  description = "Logging configuration"
}

variable "vpcs" {
  type = map(object({
    description             = string
    auto_create_subnetworks = bool
    routing_mode            = string
    vpc_peering = map(object({
      description  = string
      peer_network = string
    }))
  }))
  description = <<EOF
  description: Description of the VPC
  auto_create_subnetworks: Create a subnet for every GCP region
  routing_mode: Routing mode to use for this VPC. Example: "GLOBAL" or "REGIONAL"
  vpc_peering:   Note: This must configured from both ends of the peering connection.
    description: Description of VPC peering connection.
    peer_network: Peer VPC. Example "projects/itops-stage/global/networks/itops-stage"
  EOF 
}

variable "subnetworks" {
  type = map(object({
    description               = string
    vpc_subnetwork_cidr_range = string
    vpc_name                  = string
    region                    = string
  }))
  description = <<EOF
  description: Description the VPC subnetwork
  vpc_subnetwork_cidr_range: Cidr range for the VPC subnetwork
  vpc_name: VPC that this subnet will be created under
  region: Subnet region. Ex. "us-cental1"
  EOF
}



