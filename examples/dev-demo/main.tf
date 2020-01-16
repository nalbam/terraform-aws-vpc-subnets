# vpc

terraform {
  backend "s3" {
    region         = "ap-northeast-2"
    bucket         = "terraform-mz-seoul"
    key            = "vpc-demo-subnets.tfstate"
    dynamodb_table = "terraform-mz-seoul"
    encrypt        = true
  }
  required_version = ">= 0.12"
}

provider "aws" {
  region = var.region
}

data "terraform_remote_state" "vpc" {
  backend = "s3"
  config = {
    region = "ap-northeast-2"
    bucket = "terraform-mz-seoul"
    key    = "vpc-demo.tfstate"
  }
}

module "subnets" {
  source = "../.."

  region = var.region
  name   = var.name

  vpc_id = data.terraform_remote_state.vpc.outputs.vpc_id

  single_route_table = var.single_route_table

  enable_nat_gateway = var.enable_nat_gateway
  nat_gateway_ids    = data.terraform_remote_state.vpc.outputs.nat_gateway_ids

  public_subnets  = var.public_subnets
  private_subnets = var.private_subnets

  tags = var.tags
}
