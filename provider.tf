terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.50.0"
    }
  }
  backend "s3" {
    bucket         = "aamer-tf-state-backend"
    key            = "terraform.tfstate"
    region         = "ap-southeast-2"
    dynamodb_table = "dynamo-db-locking"
  }

}

provider "aws" {
  region = "ap-southeast-2"
}