resource "google_compute_network" "this" {
  name                    = var.vpc_name
  description =  var.description
  auto_create_subnetworks = var.auto_create_subnetworks
  routing_mode            = var.routing_mode
  project                 = var.project_id
  bgp_best_path_selection_mode  = var.bgp_best_path_selection_mode #"LEGACY"
  bgp_always_compare_med        = var.bgp_always_compare_med 
  # By setting this to true, any previous value for bgp_always_compare_med
  # will be cleared, reverting it to the API default.
  bgp_inter_region_cost = var.bgp_inter_region_cost
  delete_bgp_always_compare_med = var.delete_bgp_always_compare_med
  deletion_policy = var.deletion_policy 
  delete_default_routes_on_create = var.delete_default_routes_on_create 
}

resource "google_compute_subnetwork" "subnets" {

  for_each = var.subnets

  name          = each.value.subnet_name
  ip_cidr_range = each.value.subnet_cidr
  region        = each.value.region
  purpose = var.purpose

  network = google_compute_network.this.id

  private_ip_google_access =each.value.private_google_access

  dynamic "secondary_ip_range" {

    for_each = each.value.secondary_ranges

    content {
      range_name    = secondary_ip_range.value.range_name
      ip_cidr_range = secondary_ip_range.value.cidr
    }
  }
  log_config {
    aggregation_interval = "INTERVAL_10_MIN"
    flow_sampling        = 0.5
    metadata             = "INCLUDE_ALL_METADATA"
  }
}