resource "aws_secretsmanager_secret_version" "secrets-manager-version" {
  secret_id = var.secrets_manager_id
  secret_string = jsonencode({
    "${var.secret_string.username_key_name}" = "administrator"
    "${var.secret_string.password_key_name}" = random_password.random-password.result
  })

  version_stages = [
    "AWSPREVIOUS",
    "AWSCURRENT"
  ]

  lifecycle {
    ignore_changes = [
      secret_string,
      version_stages
    ]
  }

  depends_on = [
    random_password.random-password
  ]
}

resource "random_password" "random-password" {
  length      = local.random-password.length
  special     = local.random-password.special
  numeric     = local.random-password.numeric
  upper       = local.random-password.upper
  lower       = local.random-password.lower
  min_lower   = local.random-password.min_lower
  min_upper   = local.random-password.min_lower
  min_numeric = local.random-password.min_numeric
  min_special = local.random-password.min_special
}