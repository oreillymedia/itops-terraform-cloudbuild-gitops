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

# variable "subnetworks" {
#   type = map(object({
#     description           = string
#     vpc_subnetwork_cidr_range = string
#   }))
#   description = <<EOF
#   description: Description the VPC subnetwork
#   vpc_subnetwork_cidr_range: Cidr range for the VPC subnetwork
#   EOF
# }

variable "env" {
  type        = string
  description = "Environment name"
}

variable "enable_logging" {
  type        = bool
  description = "Logging configuration"
}

variable "vpc_name" {
  type        = string
  description = "VPC name of the env"
}

variable "machine_type" {
  type        = string
  description = "The machine type to be used"
}

variable "disk_size" {
  type        = string
  description = "The size of the boot disk in GB"
}

variable "image_family" {
  type        = string
  description = "Name of google compute environment image"
}