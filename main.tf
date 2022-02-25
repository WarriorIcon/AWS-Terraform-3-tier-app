/*
  * Multi-AZ 3-tier app with Public and Private subnets + RDS.
*/

terraform {
  backend "s3" {
    bucket = "demo-3-tier-vpc"
    key    = "statefile/3-tier-vpc/account.tf"
    region = "us-east-1"
  }  

  required_version = ">= 1.1.6"
    required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.2.0"
    }
  }

}

provider "aws" {
  region = "us-east-1"
}


module "vpc" {
  source = "./modules/network/"
}


