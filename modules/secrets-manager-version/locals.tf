locals {
  random-password = {
    length      = 50
    special     = true
    numeric     = true
    upper       = true
    lower       = true
    min_lower   = 8
    min_upper   = 8
    min_numeric = 8
    min_special = 0
  }
}