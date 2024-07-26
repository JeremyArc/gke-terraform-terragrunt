dependency "vpc" {
  config_path = "../vpc"
}
# Automatically find the root terragrunt.hcl and inherit its configuration
include {
  path = find_in_parent_folders()
}

terraform {
    source = "../../../modules/gke"
}

inputs = {
# gke variables
project_id = "k8s-cicd-demo-426216"
cluster_name = "k8s-demo"
region = "asia-southeast1"
zones = ["asia-southeast1-a"]
network = dependency.vpc.outputs.test_vpc
subnetwork = dependency.vpc.outputs.private_subnet
ip_range_pods =  dependency.vpc.outputs.subnets_secondary_ranges[0][0].range_name
ip_range_services = dependency.vpc.outputs.subnets_secondary_ranges[0][1].range_name
http_load_balancing = true
network_policy = true
horizontal_pod_autoscaling = true
filestore_csi_driver = false
dns_cache = false

# node pools variables
node_pools_name = "demo-node-pools"
machine_type = "e2-small"
node_locations = "asia-southeast1-a"
min_count = 1
max_count = 2
disk_size_gb = 10
disk_type = "pd-standard"
image_type = "COS_CONTAINERD"
enable_gcfs = false
enable_gvnic = false
logging_variant = "DEFAULT"
auto_repair = true
auto_upgrade = true
preemptible = true
initial_node_count = 1
accelerator_count = 0
}