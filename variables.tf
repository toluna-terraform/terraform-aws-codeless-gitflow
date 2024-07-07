variable "config" {
}

variable "env_name" {
    type = string
    default  = null
}

variable "environment" {
    type = string
    default  = null
}

variable "from_env" {
    type = string
    default  = null
}

variable "app_name" {
    type = string
    default  = null
}

variable "env_type" {
    type = string
    default  = null
}

variable "run_integration_tests" {
    type = bool
    default  = null
}

variable "source_repository" {
  type     = string
  default  = null
}

variable "environment_variables" {
  type = map(string)
  default = {
  }
}

variable "pipeline_type" {
  type = string
  default  = null
}

variable "termination_wait_time_in_minutes" {
  default = 120
}

variable "vpc_config" {
  default = {
     vpc_id             = "NULL",
      subnets            = [],
      security_group_ids = []
  }
}

variable "security_group_ids" {
  type = list(string)
  default = []
}