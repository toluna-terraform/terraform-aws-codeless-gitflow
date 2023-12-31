variable "env_name" {
    type = string
}

variable "from_env" {
    type = string
}

variable "app_name" {
    type = string
}

variable "env_type" {
    type = string
}

variable "run_integration_tests" {
    type = bool
    default = false
}

variable "source_repository" {
    type = string
}

variable "environment_variables" {
 type = map(string)
 default = {
 }
}

variable "pipeline_type" {
  type = string
}

variable "termination_wait_time_in_minutes" {
  default = 120
}

variable "vpc_config" {
  default = {}
}