resource "aws_secretsmanager_secret" "secrets-manager" {
  name                            = local.secrets-manager.name
  recovery_window_in_days         = local.secrets-manager.recovery_window_in_days
  force_overwrite_replica_secret  = var.force_overwrite_replica_secret

  tags = merge({Name = local.secrets-manager.name},
              var.tags)
}