variable "env_name" {
    type = string
}

variable "source_repository" {
    type = string
}

variable "test_codebuild_projects" {
    type = list(string)
}

variable "merge_codebuild_projects" {
    type = list(string)
}

variable "s3_bucket" {
    type = string
}

variable "app_name" {
}

variable "pipeline_type" {
}