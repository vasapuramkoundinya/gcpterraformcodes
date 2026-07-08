  vpc_name = "demo-narry-vpc"
  description =  "this vpc is for demo purpose"
  auto_create_subnetworks = "false"
  routing_mode            = "GLOBAL"
  project_id                 = "neural-sunup-416408"
  bgp_best_path_selection_mode  = "STANDARD"#"LEGACY"
  bgp_always_compare_med        = "true"
  # By setting this to true, any previous value for bgp_always_compare_med
  # will be cleared, reverting it to the API default.
  bgp_inter_region_cost = "ADD_COST_TO_MED"     
  delete_bgp_always_compare_med = "false"
  deletion_policy = "DELETE"
  delete_default_routes_on_create = true

subnets = {

  app = {
    subnet_name = "app-subnet"
    subnet_cidr = "10.10.1.0/24"
    region      = "us-central1"
    purpose = ""
    stack_type = "IPV4_ONLY"
    enable_flow_logs = true
  }

  db = {
    subnet_name = "db-subnet"
    subnet_cidr = "10.10.2.0/24"
    region      = "us-central1"
    purpose = "PRIVATE"
     stack_type = "IPV4_ONLY"
     enable_flow_logs = false
  }

  gke = {
    subnet_name = "gke-subnet"
    subnet_cidr = "10.10.3.0/24"
    region      = "us-central1"
    purpose = "PRIVATE"
    private_google_access = true
     stack_type = "IPV4_ONLY"
     enable_flow_logs = false

    secondary_ranges = [
      {
        range_name = "pods"
        cidr       = "10.20.0.0/14"
      },
      {
        range_name = "services"
        cidr       = "10.30.0.0/20"
      }
    ]
  }
}