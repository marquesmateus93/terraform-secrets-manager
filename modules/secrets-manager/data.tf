data "aws_secretsmanager_secret" "secrets-manager" {
  arn = aws_secretsmanager_secret.secrets-manager.arn
  depends_on = [
    aws_secretsmanager_secret.secrets-manager
  ]
}