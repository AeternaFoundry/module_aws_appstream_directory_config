variable "appstream_directory_configs" {
  description = <<EOT
Map of appstream_directory_configs, attributes below
Required:
    - directory_name
    - organizational_unit_distinguished_names
    - service_account_credentials (block):
        - account_name (required)
        - account_password (required)
Optional:
    - region
    - certificate_based_auth_properties (block):
        - certificate_authority_arn (optional)
        - status (optional)
EOT

  type = map(object({
    directory_name                          = string
    organizational_unit_distinguished_names = set(string)
    region                                  = optional(string)
    service_account_credentials = object({
      account_name     = string
      account_password = string
    })
    certificate_based_auth_properties = optional(object({
      certificate_authority_arn = optional(string)
      status                    = optional(string)
    }))
  }))
  validation {
    condition = alltrue([
      for k, v in var.appstream_directory_configs : (
        alltrue([for x in v.organizational_unit_distinguished_names : length(x) >= 0 && length(x) <= 2000])
      )
    ])
    error_message = "must be between 0 and 2000 characters"
  }
  # Note: 2 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

