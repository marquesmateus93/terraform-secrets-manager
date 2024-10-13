  output "secrets_manager_version" {
    value = aws_secretsmanager_secret_version.secrets-manager-version
    sensitive = true
  }

  output "username" {
    value     = try(jsondecode(data.aws_secretsmanager_secret_version.secrets-manager-version.secret_string)[var.secret_string.username_key_name], null)
    sensitive = true
  }

  output "password" {
    value     = try(jsondecode(data.aws_secretsmanager_secret_version.secrets-manager-version.secret_string)[var.secret_string.password_key_name], null)
    sensitive = true
  }