locals {
  config                 = var.config.app.codeless_pipeline
  artifacts_bucket_name = "s3-codepipeline-${var.app_name}-${var.env_type}"
  app_name               = var.app_name == null ? local.config.app_name : var.app_name
  from_env               = var.from_env == null ? local.config.from_env : var.from_env
  env_type               = var.env_type == null ? local.config.env_type : var.env_type
  pipeline_type          = var.pipeline_type == null ? local.config.pipeline_type : var.pipeline_type
  environment            = var.environment == null ? local.config.environment : var.environment
  env_name               = split("-", local.environment)[0]
  run_integration_tests  = var.run_integration_tests == null ? local.config.run_integration_tests : var.run_integration_tests
  source_repository      = var.source_repository == null ? "tolunaengineering/${local.app_name}" : var.source_repository
  vpc_config             = var.vpc_config.vpc_id == "NULL" ? merge(local.config.vpc_config, { security_group_ids = var.security_group_ids }) : var.vpc_config
}

module "ci-cd-code-pipeline" {
  source                       = "./modules/ci-cd-codepipeline"
  env_name                     = local.env_name
  app_name                     = local.app_name
  pipeline_type                = local.pipeline_type
  source_repository            = local.source_repository
  s3_bucket                    = local.artifacts_bucket_name
  test_codebuild_projects      = [module.test.attributes.name]
  merge_codebuild_projects     = local.pipeline_type != "dev" ? ["Merge-Waiter"] : []
  depends_on = [
    module.test
  ]
}

module "test" {
  source                                = "./modules/test"
  env_name                              = local.environment
  env_type                              = local.env_type
  codebuild_name                        = "test-${var.app_name}"
  source_repository                     = local.source_repository
  s3_bucket                             = "s3-codepipeline-${local.app_name}-${local.env_type}"
  privileged_mode                       = true
  environment_variables                 = var.environment_variables
  buildspec_file                        = templatefile("test_buildspec.yml.tpl",
  { ENV_NAME = local.env_name,
    ENVIRONMENT = local.environment,
    FROM_ENV = local.from_env,
    APP_NAME = local.app_name,
    ENV_TYPE = local.env_type,
    PIPELINE_TYPE = local.pipeline_type
    REPO_NAME = local.source_repository
    })
}
