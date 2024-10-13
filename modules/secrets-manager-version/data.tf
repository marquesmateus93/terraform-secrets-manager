data "aws_secretsmanager_secret_version" "secrets-manager-version" {
  secret_id = var.secrets_manager_id

    depends_on = [
      aws_secretsmanager_secret_version.secrets-manager-version
    ]
}