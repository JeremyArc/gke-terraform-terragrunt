variable "project_id" {
  type = string
}

variable "network_name" {
  description = "vpc's name"
  type = string
}

variable "routing_mode" {
  type = string
}

variable "subnets" {
  description = "List of subnets to be created"
  type = list(object({
    subnet_name           = string
    subnet_ip             = string
    subnet_region         = string
    subnet_private_access = optional(bool)
    subnet_flow_logs      = optional(bool)
    subnet_flow_logs_interval = optional(string)
    subnet_flow_logs_sampling = optional(number)
    subnet_flow_logs_metadata = optional(string)
    description           = optional(string)
  }))
  default = []
}

variable "secondary_ranges" {
    description = "Map of secondary ip ranges for both pod and services of each subnet"
    type = map(list(object({
      range_name    = string
      ip_cidr_range = string
    })))
}


