terraform {
  backend "s3" {
    bucket = "terra-s3-mhn"
    key    = "sample/terraform.tfstate"
    region = "us-east-1"
  }
}