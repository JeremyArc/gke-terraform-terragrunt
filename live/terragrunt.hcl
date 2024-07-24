locals {
    parsed = regex(".*/live/(?P<env>.*?)/.*", get_terragrunt_dir())
    env = local.parsed.env
}

remote_state {
  backend = "gcs"
  config = {
    bucket = "${local.env}-jessada-terragrunt-state"
    prefix = "${path_relative_to_include()}/terraform.tfstate"
    project = "k8s-cicd-demo"
    location = "ASIA-SOUTHEAST1"
  }
  generate = {
    path      = "backend.tf"
    if_exists = "overwrite_terragrunt"
  }
}


