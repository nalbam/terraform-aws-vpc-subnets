# locals

locals {
  vpc_id = var.vpc_id

  gateway_id = element(concat(data.aws_internet_gateway.this.*.id, [""]), 0)

  zone_count = var.single_route_table ? 1 : length(data.aws_availability_zones.azs.names) > 3 ? 3 : length(data.aws_availability_zones.azs.names)
  zone_index = {
    "a" = 0,
    "b" = 1,
    "c" = 2,
  }

  nat_gateway_count = var.enable_nat_gateway ? length(var.private_subnets) > 0 ? length(var.nat_gateway_ids) : 0 : 0
}
