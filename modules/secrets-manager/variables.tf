variable "prefix_name" {
    description = "Resources prefix name."
    type        = string
    validation {
    condition = can(
        regex(
            "[a-z-]",
            var.prefix_name
        )
    )
    error_message = "The prefix name must contain just lowercase and hyphens."
    }
}

variable "force_overwrite_replica_secret" {
  description = "Specify whether to overwrite a secret with the same name in the destination region."
  type        = bool
  default     = true
  validation {
    condition = (
      var.force_overwrite_replica_secret == true ||
      var.force_overwrite_replica_secret == false
    )
    error_message = "Must to be a boolean value."
  }
}

variable "tags" {
  description = "Tracking tags."
  type        = map(string)
  validation {
    condition = alltrue ([
      for tag in keys(var.tags) : contains([
          "environment",
          "creator_id",
          "powered_by"
        ],tag
      )
    ])
    error_message = "Tags must contain at least: 'environment', 'creator_id' and 'powered_by'."
  }
}