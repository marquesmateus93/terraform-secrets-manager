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

variable "secrets_manager_id" {
  description = "Secrets Manager ID provided by."
  type        = string
  validation {
    condition = (
      can(
        regex(
          "arn:aws:secretsmanager:(us(-gov)?|ap|ca|cn|eu|sa)-(central|(north|south)?(east|west)?)-\\d:\\d{12}:[a-zA-Z0-9/-_+=.@-]+",
          var.secrets_manager_id
        )
      )
    )
    error_message = "Secret Manager resource ARN not valid."
  }
}

variable "secret_string" {
  description = "Key/Value secret username value."
  type        = object({
    username_key_name = string
    password_key_name = string
  })

  default = {
    username_key_name = "username"
    password_key_name = "password"
  }

  validation {
    condition = (
      var.secret_string != null
    )
    error_message = "Content cannot be empty."
  }

  validation {
    condition = (
      var.secret_string != null
    )
    error_message = "Content cannot be empty."
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