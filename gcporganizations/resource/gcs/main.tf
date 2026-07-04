resource "google_storage_bucket" "static-site" {
  name          = var.name
  project = var.project_id
  location      = var.location
  force_destroy = var.force_destroy

  uniform_bucket_level_access = var.uniform_bucket_level_access
  
  storage_class = var.storage_class

  versioning {
    enabled = var.enable_versioning
  }
  dynamic "retention_policy" {
  for_each = var.retention_period != null ? [1] : []

  content {
    is_locked        = var.enable_retention_policy_lock
    retention_period = var.retention_period
  }
}

  dynamic "logging" {
  for_each = var.logging_bucket != null ? [1] : []

  content {
    log_bucket = var.logging_bucket
  }
}
  public_access_prevention = var.public_access_prevention

  labels = var.labels
  dynamic "lifecycle_rule" {
  for_each = var.lifecycle_rules

  content {
     action {
      type          = try(lifecycle_rule.value.action.type, null)
      storage_class = try(lifecycle_rule.value.action.storage_class, null)
            }

     condition {
      age                        = try(lifecycle_rule.value.condition.age, null)
      created_before             = try(lifecycle_rule.value.condition.created_before, null)
      with_state                 = try(lifecycle_rule.value.condition.with_state, null)
      num_newer_versions         = try(lifecycle_rule.value.condition.num_newer_versions, null)
      matches_storage_class      = try(lifecycle_rule.value.condition.matches_storage_class, null)
      matches_prefix             = try(lifecycle_rule.value.condition.matches_prefix, null)
      matches_suffix             = try(lifecycle_rule.value.condition.matches_suffix, null)
      custom_time_before         = try(lifecycle_rule.value.condition.custom_time_before, null)
      days_since_custom_time     = try(lifecycle_rule.value.condition.days_since_custom_time, null)
      days_since_noncurrent_time = try(lifecycle_rule.value.condition.days_since_noncurrent_time, null)
      noncurrent_time_before     = try(lifecycle_rule.value.condition.noncurrent_time_before, null)
      }
      }
    }


    dynamic "encryption" {
    for_each = var.kms_key_name != null ? [1] : []

    content {
        default_kms_key_name = var.kms_key_name
            }
    }

    dynamic "soft_delete_policy" {
  for_each = var.soft_delete_retention_seconds != null ? [1] : []

  content {
    retention_duration_seconds = var.soft_delete_retention_seconds
  }
}

}