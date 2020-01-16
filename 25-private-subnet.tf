# subnet private

resource "aws_subnet" "private" {
  count = length(var.private_subnets)

  vpc_id = local.vpc_id

  availability_zone = var.private_subnets[count.index].zone

  cidr_block = var.private_subnets[count.index].cidr

  tags = merge(
    {
      Name = format("%s-%s", var.name, var.private_subnets[count.index].suffix)
    },
    var.tags,
    # zipmap(var.private_subnets[count.index].tags),
  )
}

resource "aws_route_table_association" "private" {
  count = local.nat_gateway_count > 0 ? length(var.private_subnets) : 0

  route_table_id = element(
    aws_route_table.private.*.id,
    local.nat_gateway_count > 1 ? local.zone_index[element(split("", var.private_subnets[count.index].zone), length(var.private_subnets[count.index].zone) - 1)] : 0
  )

  subnet_id = aws_subnet.private[count.index].id
}
