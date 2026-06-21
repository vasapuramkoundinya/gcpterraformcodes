output "service_account_email" {
  description = "Service Account Email"
  value       = google_service_account.service_account.email
}

output "service_account_name" {
  description = "Service Account Name"
  value       = google_service_account.service_account.name
}

output "service_account_unique_id" {
  description = "Service Account Unique ID"
  value       = google_service_account.service_account.unique_id
}