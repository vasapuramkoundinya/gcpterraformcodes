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
#variable "purpose" {}

variable "router_name" {
  type = string
}

variable "router_description" {
  type = string
}

variable "region" {
  type = string
}

/**
variable "network" {
  type = string
}**/

variable "router" {
  type = object({

    bgp = optional(object({
      asn               = optional(number, 64514)
      keepalive_interval = number
      identifier_range = optional(string)
      advertise_mode    = optional(string, "DEFAULT")
      advertised_groups = optional(list(string), [])

      advertised_ip_ranges = optional(list(object({
        range       = string
        description = optional(string)
      })), [])
    }))
  })
}