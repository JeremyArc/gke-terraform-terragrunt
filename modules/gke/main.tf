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
  project_id                 = var.project_id
  name                       = var.cluster_name
  region                     = var.region
  zones                      = var.zones
  network                    = var.network
  subnetwork                 = var.subnetwork
  ip_range_pods              = var.ip_range_pods
  ip_range_services          = var.ip_range_services
  http_load_balancing        = var.http_load_balancing
  network_policy             = var.network_policy
  horizontal_pod_autoscaling = var.horizontal_pod_autoscaling
  filestore_csi_driver        = var.filestore_csi_driver
  dns_cache                  = var.dns_cache
  deletion_protection        = false

  node_pools = [
    {
      name                        = var.node_pools_name
      machine_type                = var.machine_type
      node_locations              = var.node_locations
      min_count                   = var.min_count
      max_count                   = var.max_count
      disk_size_gb                = var.disk_size_gb
      disk_type                   = var.disk_type
      image_type                  = var.image_type
      enable_gcfs                 = var.enable_gcfs
      enable_gvnic                = var.enable_gvnic
      logging_variant             = var.logging_variant
      auto_repair                 = var.auto_repair
      auto_upgrade                = var.auto_upgrade
      preemptible                 = var.preemptible
      initial_node_count          = var.initial_node_count
      accelerator_count           = var.accelerator_count
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