output "demo_vpc" {
  value = module.vpc.network_id
}

output "private_subnet" {
  value = module.vpc.subnets["asia-southeast1/private-subnet-1"].name
}