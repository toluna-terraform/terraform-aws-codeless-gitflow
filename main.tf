locals {
  artifacts_bucket_name = "s3-codepipeline-${var.app_name}-${var.env_type}"
}

module "ci-cd-code-pipeline" {
  source                       = "./modules/ci-cd-codepipeline"
  env_name                     = var.env_name
  app_name                     = var.app_name
  pipeline_type                = var.pipeline_type
  source_repository            = var.source_repository
  s3_bucket                    = local.artifacts_bucket_name
  test_codebuild_projects      = [module.test.attributes.name]
  merge_codebuild_projects     = var.pipeline_type != "dev" ? ["Merge-Waiter"] : []
  depends_on = [
    module.test
  ]
}

module "test" {
  source                                = "./modules/test"
  env_name                              = var.env_name
  env_type                              = var.env_type
  codebuild_name                        = "test-${var.app_name}"
  source_repository                     = var.source_repository
  s3_bucket                             = "s3-codepipeline-${var.app_name}-${var.env_type}"
  privileged_mode                       = true
  environment_variables                 = var.environment_variables
  buildspec_file                        = templatefile("test_buildspec.yml.tpl",
  { ENV_NAME = split("-",var.env_name)[0],
    ENVIRONMENT = var.env_name,
    FROM_ENV = var.from_env,
    APP_NAME = var.app_name,
    ENV_TYPE = var.env_type,
    PIPELINE_TYPE = var.pipeline_type
    REPO_NAME = var.source_repository
    })
}
