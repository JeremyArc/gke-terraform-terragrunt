output "network_name" {
  value = module.vpc.network_name
}

output "private_subnet_name" {
  value = module.vpc.subnets["asia-southeast1/private-subnet-1"].name
}

output "private_subnet_ip_range_pod" {
  value = module.vpc.subnets_secondary_ranges[0][0].range_name
}
output "private_subnet_ip_range_services" {
  value = module.vpc.subnets_secondary_ranges[0][1].range_name
}