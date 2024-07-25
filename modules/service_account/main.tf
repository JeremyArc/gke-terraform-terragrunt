module "service_accounts" {
  source        = "terraform-google-modules/service-accounts/google"
  version       = "~> 4.0"
  project_id    = "k8s-cicd-demo-426216"
  prefix         = "test"
  names         = ["k8s-service-account"]
  project_roles = [
    "k8s-cicd-demo=>roles/viewer",
    "k8s-cicd-demo=>roles/storage.objectViewer",
  ]
}