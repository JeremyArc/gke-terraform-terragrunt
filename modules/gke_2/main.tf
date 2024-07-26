# Provider configuration
provider "google" {
  project = "k8s-cicd-demo-426216"
  region  = "asia-southeast1"
}


# GCS
module "gcs_buckets" {
  source  = "terraform-google-modules/cloud-storage/google"
  version = "~> 6.0"
  project_id  = "k8s-cicd-demo-426216"
  names = ["test-remote-state"]
}

# Remote state
terraform {
  backend "gcs" {
    bucket  = "test-remote-state"
    prefix  = "terraform/state"
  }
}


# VPC
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
            subnet_flow_logs           = "true"
            subnet_flow_logs_interval = "INTERVAL_10_MIN"
            subnet_flow_logs_sampling = 0.7
            subnet_flow_logs_metadata = "INCLUDE_ALL_METADATA"
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



# GKE
# google_client_config and kubernetes provider must be explicitly specified like the following.
data "google_client_config" "default" {}

provider "kubernetes" {
  host                   = "https://${module.gke.endpoint}"
  token                  = data.google_client_config.default.access_token
  cluster_ca_certificate = base64decode(module.gke.ca_certificate)
}

module "gke" {
  source                     = "terraform-google-modules/kubernetes-engine/google"
  version                    = "31.1.0"
  project_id                 = "k8s-cicd-demo-426216"
  name                       = "k8s-demo"
  region                     = "asia-southeast1"
  zones                      = ["asia-southeast1-a", "asia-southeast1-b"]
  network                    = module.vpc.network_name
  subnetwork                 = module.vpc.subnets["asia-southeast1/private-subnet-1"].name
  ip_range_pods              = module.vpc.subnets_secondary_ranges[0][0].range_name
  ip_range_services          =  module.vpc.subnets_secondary_ranges[0][1].range_name
  http_load_balancing        = true
  network_policy             = true
  horizontal_pod_autoscaling = true
  filestore_csi_driver        = false
  dns_cache                  = false
  deletion_protection        = false

  node_pools = [
    {
      name                        = "demo-node-pools"
      machine_type                = "e2-small"
      node_locations              = "asia-southeast1-a"
      min_count                   = 1
      max_count                   = 2
      disk_size_gb                = 10
      disk_type                   = "pd-standard"
      image_type                  = "COS_CONTAINERD"
      enable_gcfs                 = false
      enable_gvnic                = false
      logging_variant             = "DEFAULT"
      auto_repair                 = true
      auto_upgrade                = true
      preemptible                 = true
      initial_node_count          = 1
      accelerator_count           = 0
    },
  ]

  node_pools_oauth_scopes = {
    all = [
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
    ]
  }

  node_pools_labels = {
    all = {}

    default-node-pool = {
      default-node-pool = true
    }
  }

  node_pools_metadata = {
    all = {}

    default-node-pool = {
      node-pool-metadata-custom-value = "my-node-pool"
    }
  }

  node_pools_taints = {
    all = []

    default-node-pool = [
      {
        key    = "default-node-pool"
        value  = true
        effect = "PREFER_NO_SCHEDULE"
      },
    ]
  }

  node_pools_tags = {
    all = []

    default-node-pool = [
      "default-node-pool",
    ]
  }
}