module "vpc" {
    source  = "terraform-google-modules/network/google"
    version = "~> 9.1"

    project_id   = "k8s-cicd-demo-426216"
    network_name = "test-vpc"
    routing_mode = "GLOBAL"

    subnets = [
        {
            subnet_name           = "public-subnet-1"
            subnet_ip             = "10.10.10.0/24"
            subnet_region         = "asia-southeast1"
        },
        {
            subnet_name           = "private-subnet-1"
            subnet_ip             = "10.10.20.0/24"
            subnet_region         = "asia-southeast1"
            subnet_private_access = "true"
            subnet_flow_logs      = "true"
            description           = "This subnet has a description"
        },
        {
            subnet_name               = "public-subnet-2"
            subnet_ip                 = "10.10.30.0/24"
            subnet_region             = "asia-southeast1"
            subnet_flow_logs          = "true"
            subnet_flow_logs_interval = "INTERVAL_10_MIN"
            subnet_flow_logs_sampling = 0.7
            subnet_flow_logs_metadata = "INCLUDE_ALL_METADATA"
        }
    ]

    secondary_ranges = {
        subnet-01 = [
            {
                range_name    = "subnet-01-secondary-01"
                ip_cidr_range = "192.168.64.0/24"
            },
        ]

        subnet-02 = []
    }

    routes = [
        {
            name                   = "egress-internet"
            description            = "route through IGW to access internet"
            destination_range      = "0.0.0.0/0"
            tags                   = "egress-inet"
            next_hop_internet      = "true"
        },
        {
            name                   = "app-proxy"
            description            = "route through proxy to reach app"
            destination_range      = "10.50.10.0/24"
            tags                   = "app-proxy"
            next_hop_instance      = "app-proxy-instance"
            next_hop_instance_zone = "asia-southeast1"
        },
    ]
}