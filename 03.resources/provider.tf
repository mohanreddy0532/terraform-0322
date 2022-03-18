provider "aws" {
  region = "us-east-1"
}

terraform {
  backend "s3" {
    bucket = "terra-s3-mhn"
    key    = "sample/terraform.tfstate"
    region = "us-east-1"
  }
}