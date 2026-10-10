resource "aws_appstream_directory_config" "appstream_directory_configs" {
  for_each = var.appstream_directory_configs

  directory_name                          = each.value.directory_name
  organizational_unit_distinguished_names = each.value.organizational_unit_distinguished_names
  region                                  = each.value.region

  service_account_credentials {
    account_name     = each.value.service_account_credentials.account_name
    account_password = each.value.service_account_credentials.account_password
  }

  dynamic "certificate_based_auth_properties" {
    for_each = each.value.certificate_based_auth_properties != null ? [each.value.certificate_based_auth_properties] : []
    content {
      certificate_authority_arn = certificate_based_auth_properties.value.certificate_authority_arn
      status                    = certificate_based_auth_properties.value.status
    }
  }
}

