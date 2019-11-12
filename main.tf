# Configure the AWS Provider
provider "aws" {  
  region  = "${var.region}"
}

terraform {
    backend "s3" {
        bucket = "lms-infraestrutura"
        key    = "api-gateway-infraestrutura.tfstate"
        region = "us-east-1"
    }
}

/* terraform {
  required_version = "~> 0.11.13"

  backend "remote" {
    hostname = "app.terraform.io"
    organization = "LMS"

    workspaces {
      name = "default"
    }
  }
} */

data "terraform_remote_state" "s3" {
  backend = "s3"

  workspace = "${terraform.workspace}"
  
  config = {
    bucket = "lms-infraestrutura"
    key    = "terraform.tfstate"
    region = "us-east-1"
  }
}

data "terraform_remote_state" "vpc" {
  backend = "s3"
  workspace = "${terraform.workspace}"
  config = {
    bucket = "lms-infraestrutura"
    key    = "vpc-infraestrutura.tfstate"
    region = "us-east-1"
  }
}
