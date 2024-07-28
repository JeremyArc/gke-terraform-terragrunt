<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_gke"></a> [gke](#module\_gke) | terraform-google-modules/kubernetes-engine/google | 31.1.0 |

## Resources

| Name | Type |
|------|------|
| [google_client_config.default](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/client_config) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_accelerator_count"></a> [accelerator\_count](#input\_accelerator\_count) | n/a | `number` | n/a | yes |
| <a name="input_auto_repair"></a> [auto\_repair](#input\_auto\_repair) | n/a | `bool` | n/a | yes |
| <a name="input_auto_upgrade"></a> [auto\_upgrade](#input\_auto\_upgrade) | n/a | `bool` | n/a | yes |
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | n/a | `string` | n/a | yes |
| <a name="input_disk_size_gb"></a> [disk\_size\_gb](#input\_disk\_size\_gb) | n/a | `number` | n/a | yes |
| <a name="input_disk_type"></a> [disk\_type](#input\_disk\_type) | n/a | `string` | n/a | yes |
| <a name="input_dns_cache"></a> [dns\_cache](#input\_dns\_cache) | n/a | `bool` | n/a | yes |
| <a name="input_enable_gcfs"></a> [enable\_gcfs](#input\_enable\_gcfs) | n/a | `bool` | n/a | yes |
| <a name="input_enable_gvnic"></a> [enable\_gvnic](#input\_enable\_gvnic) | n/a | `bool` | n/a | yes |
| <a name="input_filestore_csi_driver"></a> [filestore\_csi\_driver](#input\_filestore\_csi\_driver) | n/a | `bool` | n/a | yes |
| <a name="input_horizontal_pod_autoscaling"></a> [horizontal\_pod\_autoscaling](#input\_horizontal\_pod\_autoscaling) | n/a | `bool` | n/a | yes |
| <a name="input_http_load_balancing"></a> [http\_load\_balancing](#input\_http\_load\_balancing) | n/a | `bool` | n/a | yes |
| <a name="input_image_type"></a> [image\_type](#input\_image\_type) | n/a | `string` | `"COS_CONTAINERD"` | no |
| <a name="input_initial_node_count"></a> [initial\_node\_count](#input\_initial\_node\_count) | n/a | `number` | n/a | yes |
| <a name="input_ip_range_pods"></a> [ip\_range\_pods](#input\_ip\_range\_pods) | n/a | `string` | n/a | yes |
| <a name="input_ip_range_services"></a> [ip\_range\_services](#input\_ip\_range\_services) | n/a | `string` | n/a | yes |
| <a name="input_logging_variant"></a> [logging\_variant](#input\_logging\_variant) | n/a | `string` | `"DEFAULT"` | no |
| <a name="input_machine_type"></a> [machine\_type](#input\_machine\_type) | n/a | `string` | n/a | yes |
| <a name="input_max_count"></a> [max\_count](#input\_max\_count) | maximum number of nodes and must greater than min\_count | `number` | n/a | yes |
| <a name="input_min_count"></a> [min\_count](#input\_min\_count) | minimum number of nodes | `number` | n/a | yes |
| <a name="input_network"></a> [network](#input\_network) | cluster's network | `string` | n/a | yes |
| <a name="input_network_policy"></a> [network\_policy](#input\_network\_policy) | n/a | `bool` | n/a | yes |
| <a name="input_node_locations"></a> [node\_locations](#input\_node\_locations) | n/a | `string` | n/a | yes |
| <a name="input_node_pools_name"></a> [node\_pools\_name](#input\_node\_pools\_name) | node pools name | `string` | n/a | yes |
| <a name="input_preemptible"></a> [preemptible](#input\_preemptible) | n/a | `bool` | n/a | yes |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | variables for cluster | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | cluster's region | `string` | n/a | yes |
| <a name="input_subnetwork"></a> [subnetwork](#input\_subnetwork) | cluster's subnetwork | `string` | n/a | yes |
| <a name="input_zones"></a> [zones](#input\_zones) | cluster's zones | `list(string)` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->