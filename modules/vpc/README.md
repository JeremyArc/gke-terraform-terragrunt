<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_vpc"></a> [vpc](#module\_vpc) | terraform-google-modules/network/google | ~> 9.1 |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_network_name"></a> [network\_name](#input\_network\_name) | vpc's name | `string` | n/a | yes |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | n/a | `string` | n/a | yes |
| <a name="input_routing_mode"></a> [routing\_mode](#input\_routing\_mode) | n/a | `string` | n/a | yes |
| <a name="input_secondary_ranges"></a> [secondary\_ranges](#input\_secondary\_ranges) | Map of secondary ip ranges for both pod and services of each subnet | <pre>map(list(object({<br>      range_name    = string<br>      ip_cidr_range = string<br>    })))</pre> | n/a | yes |
| <a name="input_subnets"></a> [subnets](#input\_subnets) | List of subnets to be created | <pre>list(object({<br>    subnet_name           = string<br>    subnet_ip             = string<br>    subnet_region         = string<br>    subnet_private_access = optional(bool)<br>    subnet_flow_logs      = optional(bool)<br>    subnet_flow_logs_interval = optional(string)<br>    subnet_flow_logs_sampling = optional(number)<br>    subnet_flow_logs_metadata = optional(string)<br>    description           = optional(string)<br>  }))</pre> | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_NETWORK_NAME"></a> [NETWORK\_NAME](#output\_NETWORK\_NAME) | n/a |
| <a name="output_PRIVATE_SUBNET_IP_RANGE_POD"></a> [PRIVATE\_SUBNET\_IP\_RANGE\_POD](#output\_PRIVATE\_SUBNET\_IP\_RANGE\_POD) | n/a |
| <a name="output_PRIVATE_SUBNET_IP_RANGE_SERVICES"></a> [PRIVATE\_SUBNET\_IP\_RANGE\_SERVICES](#output\_PRIVATE\_SUBNET\_IP\_RANGE\_SERVICES) | n/a |
| <a name="output_PRIVATE_SUBNET_NAME"></a> [PRIVATE\_SUBNET\_NAME](#output\_PRIVATE\_SUBNET\_NAME) | n/a |
<!-- END_TF_DOCS -->