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

  min_nat_count = min(
    length(var.public_subnets),
    local.zone_count,
  )

  nat_gateway_count = var.enable_nat_gateway ? var.create_nat_gateway ? local.min_nat_count > 0 ? var.single_nat_gateway ? 1 : local.min_nat_count : 0 : length(var.nat_gateway_ids) : 0

  nat_gateway_ids = var.enable_nat_gateway ? var.create_nat_gateway ? aws_nat_gateway.private.*.id : var.nat_gateway_ids : []
}
