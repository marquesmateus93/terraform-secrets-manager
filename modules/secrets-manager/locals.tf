locals {
  secrets-manager = {
    name                    = "${var.prefix_name}-secrets-manager-${var.tags["environment"]}"
    recovery_window_in_days = 0
  }
}