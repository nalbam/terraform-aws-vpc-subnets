# route_table private

resource "aws_route_table" "private" {
  count = local.nat_gateway_count

  vpc_id = local.vpc_id

  lifecycle {
    # When attaching VPN gateways it is common to define aws_vpn_gateway_route_propagation
    # resources that manipulate the attributes of the routing table (typically for the private subnets)
    ignore_changes = [propagating_vgws]
  }

  tags = merge(
    {
      Name = format("%s-%s", var.name, var.private_subnets[count.index].suffix)
    },
    var.tags,
    zipmap(var.private_subnets[count.index].tags),
  )
}

resource "aws_route" "private" {
  count = local.nat_gateway_count

  route_table_id         = element(aws_route_table.private.*.id, count.index)
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = element(var.nat_gateway_ids, count.index)

  timeouts {
    create = "5m"
  }
}
