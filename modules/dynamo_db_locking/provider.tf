terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
  backend "s3" {
    bucket = "tag-collector-bucket"
    region = "us-east-1"
    key = "terraform.tfstate"
    dynamodb_table = "lock-table"
  }
}
# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}