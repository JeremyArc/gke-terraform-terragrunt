# Automatically find the root terragrunt.hcl and inherit its configuration
include {
  path = find_in_parent_folders()
}

terraform {
    source = "../../../modules/gke"
}

inputs = {
# gke variables
project_id = "k8s-cicd-demo"
cluster_name = "k8s-demo"
region = "asia-southeast1"
zones = ["asia-southeast1-a"]
network = "default"
subnetwork = "asia-southeast1"
ip_range_pods = "asia-southeast-gke-pods"
ip_range_services = "asia-southeast-gke-service"
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
spot = true
disk_size_gb = 10
disk_type = "pd-standard"
image_type = "COS_CONTAINERD"
enable_gcfs = false
enable_gvnic = false
logging_variant = "DEFAULT"
auto_repair = true
auto_upgrade = true
service_account = "project-service-account@k8s-cicd-demo.iam.gserviceaccount.com"
preemptible = true
initial_node_count = 1
accelerator_count = 0
}