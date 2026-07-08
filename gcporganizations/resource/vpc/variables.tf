variable "vpc_name" {}
variable "description"{}
variable "auto_create_subnetworks"{}
variable "routing_mode"{}
variable "project_id"{}
variable "bgp_best_path_selection_mode"{}
variable "bgp_always_compare_med"{}
variable "bgp_inter_region_cost"{}
variable "delete_bgp_always_compare_med"{}
variable "deletion_policy"{}
variable "delete_default_routes_on_create"{}
#variable "purpose" {}
variable "subnets" {
  type = map(object({
    subnet_name      = string
    subnet_cidr      = string
    region           = string
    purpose = optional(string)
    stack_type = string

    private_google_access = optional(bool, false)
    enable_flow_logs       = optional(bool, false)
    secondary_ranges = optional(list(object({
      range_name = string
      cidr       = string
    })), [])
  }))
}
