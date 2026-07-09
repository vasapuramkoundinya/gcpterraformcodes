module "neural_compute_components" {
    source = "../../../../resource/vpc"
    vpc_name = var.vpc_name
    description =  var.description
  auto_create_subnetworks = var.auto_create_subnetworks
  routing_mode            = var.routing_mode
  project_id                 = var.project_id
  bgp_best_path_selection_mode  = var.bgp_best_path_selection_mode #"LEGACY"
  bgp_always_compare_med        = var.bgp_always_compare_med 
  # By setting this to true, any previous value for bgp_always_compare_med
  # will be cleared, reverting it to the API default.
  bgp_inter_region_cost = var.bgp_inter_region_cost
  delete_bgp_always_compare_med = var.delete_bgp_always_compare_med
  deletion_policy = var.deletion_policy 
  delete_default_routes_on_create = var.delete_default_routes_on_create 
  subnets = var.subnets
}


module "cloud_router" {
  source = "../../../../resource/cloudrouter_nat"
  router_name = var.router_name
  router_description = var.router_description
  project_id = var.project_id
  region = var.region
  network = module.neural_compute_components.id
  router = var.router
}