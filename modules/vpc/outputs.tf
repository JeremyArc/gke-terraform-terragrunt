output "NETWORK_NAME" {
  value = module.vpc.network_name
}

output "PRIVATE_SUBNET_NAME" {
  value = module.vpc.subnets["asia-southeast1/private-subnet-1"].name
}

output "PRIVATE_SUBNET_IP_RANGE_POD" {
  value = module.vpc.subnets_secondary_ranges[0][0].range_name
}
output "PRIVATE_SUBNET_IP_RANGE_SERVICES" {
  value = module.vpc.subnets_secondary_ranges[0][1].range_name
}