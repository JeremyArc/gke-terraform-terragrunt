# variables for cluster
variable "project_id" {
    type = string
}
variable "cluster_name" {
    type = string
}
variable "region" {
    description = "cluster's region"
    type = string
}
variable "zones" {
    description = "cluster's zones"
    type = list(string)
}
variable "network" {
  description = "cluster's network"
  type = string
}
variable "subnetwork" {
    description = "cluster's subnetwork"
    type = string
}
variable "ip_range_pods" {
  type = string
}
variable "ip_range_services" {
    type = string
}
variable "http_load_balancing" {
  type = bool
}
variable "network_policy" {
type = bool
}
variable "horizontal_pod_autoscaling" {
    type = bool
}
variable "filestore_csi_driver" {
  type = bool
}
variable "dns_cache" {
  type = bool
}


# variables for node pools
variable "node_pools_name" {
    description = "node pools name"
    type = string
}
variable "machine_type" {
    type = string
}
variable "node_locations" {
    type = string
}
variable "min_count" {
    description = "minimum number of nodes"
    type = number
}
variable "max_count" {
    description = "maximum number of nodes and must greater than min_count"
    type = number
}
variable "disk_size_gb" {
    type = number
}
variable "disk_type" {
    type = string
}
variable "image_type" {
    type = string
    default = "COS_CONTAINERD"
}
variable "enable_gcfs" {
  type = bool
}
variable "enable_gvnic" {
  type = bool
}
variable "logging_variant" {
  type = string
  default = "DEFAULT"
}
variable "auto_repair" {
  type = bool
}
variable "auto_upgrade" {
  type = bool
}
variable "preemptible" {
  type = bool
}
variable "initial_node_count" {
  type = number
}
variable "accelerator_count" {
  type = number
}