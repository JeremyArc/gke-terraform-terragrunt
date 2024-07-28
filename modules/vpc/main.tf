module "vpc" {
    source  = "terraform-google-modules/network/google"
    version = "~> 9.1"

    project_id   = var.project_id
    network_name = var.project_id
    routing_mode = var.routing_mode

    subnets = var.subnets

    secondary_ranges = var.secondary_ranges


}


