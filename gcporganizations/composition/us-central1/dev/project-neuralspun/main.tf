/*resource "google_project" "my_project" {
  name       = var.name
  project_id = var.project_id
  #org_id     = "1234567"
  tags = {"env":"staging"}
  #billing_account = var.billing_account
}*/


resource "google_service_account" "service_account" {
  account_id   = "sa-newtf"
  display_name = "Service Account for terraform new SA"
  #project_id = var.project_id
}