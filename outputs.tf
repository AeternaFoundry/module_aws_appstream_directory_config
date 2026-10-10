output "appstream_directory_configs_id" {
  description = "Map of id values across all appstream_directory_configs, keyed the same as var.appstream_directory_configs"
  value       = { for k, v in aws_appstream_directory_config.appstream_directory_configs : k => v.id if v.id != null && length(v.id) > 0 }
}
output "appstream_directory_configs_certificate_based_auth_properties" {
  description = "Map of certificate_based_auth_properties values across all appstream_directory_configs, keyed the same as var.appstream_directory_configs"
  value       = { for k, v in aws_appstream_directory_config.appstream_directory_configs : k => one(v.certificate_based_auth_properties) if v.certificate_based_auth_properties != null && length(v.certificate_based_auth_properties) > 0 }
}
output "appstream_directory_configs_created_time" {
  description = "Map of created_time values across all appstream_directory_configs, keyed the same as var.appstream_directory_configs"
  value       = { for k, v in aws_appstream_directory_config.appstream_directory_configs : k => v.created_time if v.created_time != null && length(v.created_time) > 0 }
}
output "appstream_directory_configs_directory_name" {
  description = "Map of directory_name values across all appstream_directory_configs, keyed the same as var.appstream_directory_configs"
  value       = { for k, v in aws_appstream_directory_config.appstream_directory_configs : k => v.directory_name if v.directory_name != null && length(v.directory_name) > 0 }
}
output "appstream_directory_configs_organizational_unit_distinguished_names" {
  description = "Map of organizational_unit_distinguished_names values across all appstream_directory_configs, keyed the same as var.appstream_directory_configs"
  value       = { for k, v in aws_appstream_directory_config.appstream_directory_configs : k => v.organizational_unit_distinguished_names if v.organizational_unit_distinguished_names != null && length(v.organizational_unit_distinguished_names) > 0 }
}
output "appstream_directory_configs_region" {
  description = "Map of region values across all appstream_directory_configs, keyed the same as var.appstream_directory_configs"
  value       = { for k, v in aws_appstream_directory_config.appstream_directory_configs : k => v.region if v.region != null && length(v.region) > 0 }
}
output "appstream_directory_configs_service_account_credentials" {
  description = "Map of service_account_credentials values across all appstream_directory_configs, keyed the same as var.appstream_directory_configs"
  value       = { for k, v in aws_appstream_directory_config.appstream_directory_configs : k => one(v.service_account_credentials) if v.service_account_credentials != null && length(v.service_account_credentials) > 0 }
  sensitive   = true
}

