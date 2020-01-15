# locals

locals {
  vpc_id = var.vpc_id

  gateway_id = element(concat(data.aws_internet_gateway.this.*.id, [""]), 0)

  nat_gateway_count = length(var.private_subnets) > 0 ? var.enable_nat_gateway ? length(var.nat_gateway_ids) : 0 : 0

  zone_index = {
    "a" = 0,
    "b" = 1,
    "c" = 2,
  }
}
