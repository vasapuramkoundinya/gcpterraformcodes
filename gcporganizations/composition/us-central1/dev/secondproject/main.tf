module "neural_bucket" {
    source = "../../../../resource/gcs"
    name = var.name
    project_id = var.project_id
  location      = var.location
  force_destroy = var.force_destroy
  uniform_bucket_level_access = var.uniform_bucket_level_access
  storage_class = var.storage_class
  retention_period= var.retention_period
  enable_versioning = var.enable_versioning
  enable_retention_policy_lock = var.enable_retention_policy_lock
  logging_bucket = var.logging_bucket
   public_access_prevention = var.public_access_prevention
   labels = var.labels
   lifecycle_rules =var.lifecycle_rules
   kms_key_name = var.kms_key_name
   soft_delete_retention_seconds = var.soft_delete_retention_seconds
  
}