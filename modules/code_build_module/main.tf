provider "aws" {
  region = "us-east-1"
}

resource "aws_codebuild_project" "example" {
  name           = "example-project"
  service_role   = "arn:aws:iam::870796375513:role/service-role/codebuild-terraform-pipeline-service-role"
  source {
    type      = "GITHUB"
    location  = "https://github.com/mohammedashiqu/ashiq_beta.git"
    buildspec = "buildspec.yml"
  }
  environment {
    compute_type  = "BUILD_GENERAL1_SMALL"
    image         = "aws/codebuild/standard:5.0"
    type          = "LINUX_CONTAINER"
    privileged_mode = true
  }
  artifacts {
    type         = "S3"
    location     = "tag-collector-bucket"
    name         = "example-project"
    packaging    = "ZIP"
  }
}
