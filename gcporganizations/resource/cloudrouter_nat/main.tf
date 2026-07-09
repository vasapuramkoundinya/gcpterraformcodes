### Cloud Router configuration####

resource "google_compute_router" "this" {

  name        = var.router_name
  description = var.router_description

  project = var.project_id
  region  = var.region
  network = var.network

  bgp {
    asn            = var.router.bgp.asn
    advertise_mode = var.router.bgp.advertise_mode

    advertised_groups = var.router.bgp.advertised_groups

    keepalive_interval = var.router.bgp.keepalive_interval
    identifier_range = var.router.bgp.identifier_range

    dynamic "advertised_ip_ranges" {
      for_each = var.router.bgp.advertised_ip_ranges

      content {
        range       = advertised_ip_ranges.value.range
        description = advertised_ip_ranges.value.description
      }
    }
  }
}