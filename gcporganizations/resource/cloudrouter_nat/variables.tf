

variable "project_id" {
  type = string
}

variable "router_name" {
  type = string
}

variable "router_description" {
  type = string
}

variable "region" {
  type = string
}

variable "network" {
  type = string
}

variable "router" {
  type = object({

    bgp = optional(object({
      asn               = optional(number, 64514)
      keepalive_interval = optional(number)
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