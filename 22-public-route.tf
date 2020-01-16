# route_table public

resource "aws_route_table" "public" {
  count = length(var.public_subnets) > 0 ? local.zone_count : 0

  vpc_id = local.vpc_id

  tags = merge(
    {
      Name = format(
        "%s-public-%s",
        var.name,
        element(split("", data.aws_availability_zones.azs.names[count.index]), length(data.aws_availability_zones.azs.names[count.index]) - 1)
      )
    },
    var.tags,
  )
}

resource "aws_route" "public" {
  count = length(var.public_subnets) > 0 ? local.zone_count : 0

  route_table_id         = aws_route_table.public[count.index].id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = local.gateway_id

  timeouts {
    create = "5m"
  }
}
