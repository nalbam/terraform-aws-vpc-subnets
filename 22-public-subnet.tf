# subnet public

resource "aws_subnet" "public" {
  count = length(var.public_subnets)

  vpc_id = local.vpc_id

  availability_zone = var.public_subnets[count.index].zone

  cidr_block = var.public_subnets[count.index].cidr

  tags = merge(
    {
      Name = format("%s-%s", var.name, var.public_subnets[count.index].suffix)
    },
    var.tags,
    zipmap(var.public_subnets[count.index].tags),
  )
}

resource "aws_route_table_association" "public" {
  count = length(var.public_subnets)

  route_table_id = aws_route_table.public[0].id

  subnet_id = aws_subnet.public[count.index].id
}
