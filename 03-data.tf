# data

data "aws_availability_zones" "azs" {
}

data "aws_internet_gateway" "this" {
  filter {
    name   = "attachment.vpc-id"
    values = [var.vpc_id]
  }
}
