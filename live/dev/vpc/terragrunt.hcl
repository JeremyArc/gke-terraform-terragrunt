include {
    path = find_in_parent_folders()
}

terraform {
    source = "../../../modules/vpc"
}

inputs = {

    project_id      = "k8s-cicd-demo-426216"
    network_name    = "test-vpc"
    routing_mode    = "GLOBAL"
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
            subnet_flow_logs       = "true"
            description           = "This subnet has a description"
        },
        {
            subnet_name               = "public-subnet-2"
            subnet_ip                 = "10.10.30.0/24"
            subnet_region             = "asia-southeast1"
            subnet_flow_logs           = "true"
            subnet_flow_logs_interval  = "INTERVAL_10_MIN"
            subnet_flow_logs_sampling  = 0.7
            subnet_flow_logs_metadata  = "INCLUDE_ALL_METADATA"
        }
    ]

    secondary_ranges = {
        private-subnet-1 = [
            {
                range_name    = "private-subnet-1-gke-pods"
                ip_cidr_range = "10.20.0.0/16"
            },
            {
                range_name    = "private-subnet-1-gke-services"
                ip_cidr_range = "10.21.0.0/20"
            }
        ]
    }


}