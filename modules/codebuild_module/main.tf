## Terraform Block for version and provider
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}
## Configure the AWS Region on provider Block
provider "aws" {
  region ="us-east-1"
}

## Create Role
resource "aws_iam_role" "code_buil_role" {
  name               = "example"
  assume_role_policy = file("assume_role.json")
}
## Associate Admin policy
resource "aws_iam_role_policy" "role_asso" {
  role   = aws_iam_role.code_buil_role.name
  policy = file("admin_policy.json")
}

resource "aws_codebuild_project" "Project_1" {
  name        = "Project_1"
  description = "An example CodeBuild project"
  service_role = aws_iam_role.code_buil_role.arn # Replace with the ARN of your CodeBuild service role

  artifacts {
    type = "S3"

    location = "tag-collector-bucket" # Replace with the name of your S3 bucket
    path     = "artifacts/"
  }

  environment {
    compute_type                = "BUILD_GENERAL1_SMALL" # Replace with your desired compute type
    image                       = "aws/codebuild/standard:5.0" # Replace with your desired CodeBuild image
    type                        = "LINUX_CONTAINER"
    privileged_mode             = true # If you need privileged access, set this to true
  }

  source {
    type = "GITHUB"

    location = "https://github.com/mohammedashiqu/ashiq_beta.git" # Replace with the URL of your GitHub repository
    git_clone_depth = 1 # Set the depth of the git clone to improve performance
    buildspec = "buildspec.yml" # Replace with the name of your CodeBuild buildspec file
  }
}