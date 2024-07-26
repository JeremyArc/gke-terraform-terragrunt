# output "subnets_secondary_ranges" {
#    value = {
#     for subnet, ranges in module.vpc.subnets_secondary_ranges : subnet => ranges
#   }
# }

# output "private_subnet" {
#   value = module.vpc.subnets["asia-southeast1/private-subnet-1"].name
# }

# output "test_vpc" {
#   value = module.vpc.network_name
# }

# output "subnet_secondary_ip_range" {
#     value = "ddddd"
# }

# output "subnet_secondary" {
#   value = module.vpc.subnets_secondary_ranges
# }

# output "network" {
#   value = module.vpc.network
# }

# output "projectId" {
#   value = module.vpc.project_id
# }

output "subnets_secondary_ranges" {
  value = module.vpc.subnets_secondary_ranges
}