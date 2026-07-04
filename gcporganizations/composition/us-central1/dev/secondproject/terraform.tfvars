
  name = "demo_narry_bt"
  project_id = "neural-sunup-416408"
  location      = "europe-west1"
  force_destroy = "false"
  uniform_bucket_level_access = "true"
  storage_class = "STANDARD"
  retention_period= "604800"
  enable_versioning = "true"
  enable_retention_policy_lock = "true"
  logging_bucket = "terraform-state-gcp-narasi"
   public_access_prevention = "enforced"
   #labels = var.labels
   kms_key_name = "projects/neural-sunup-416408/locations/global/keyRings/ebsvolume/cryptoKeys/ebs"
   soft_delete_retention_seconds = "304800"

   labels = {
  environment = "dev"
  application = "neuralspun"
  owner       = "devops"
  team        = "platform"
  }

    lifecycle_rules = [
    {
        action = {
        type          = "SetStorageClass"
        storage_class = "NEARLINE"
        }

        condition = {
        age = 30
        }
    },

    {
        action = {
        type = "Delete"
        }

        condition = {
        age = 365
        }
    }
    ]